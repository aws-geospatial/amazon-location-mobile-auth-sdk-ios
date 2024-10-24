import ClientRuntime
import SmithyHTTPAuthAPI
import Smithy
import SmithyHTTPAPI

public let apiKeyAuthSchemeID: String = "smithy.api#noAuth"

public struct ApiKeyAuthScheme: AuthScheme {
    public var schemeID: String = apiKeyAuthSchemeID
    public var signer: any SmithyHTTPAuthAPI.Signer
    
    public init() {
        // This signer isn't actually used, since the AuthSchemeMiddleware will set signer to nil on the SelectedAuthScheme
        // when smithy.api#noAuth is specified, but it is required to confirm to the AuthScheme protocol
        self.signer = ApiKeySigner()
    }
    
    public func customizeSigningProperties(
        signingProperties: Smithy.Attributes,
        context: Smithy.Context
    ) throws -> Smithy.Attributes {
        return signingProperties
    }
}

public class ApiKeySigner: Signer {
    public init() {}

    public func signRequest<IdentityT>(
        requestBuilder: SmithyHTTPAPI.HTTPRequestBuilder,
        identity: IdentityT,
        signingProperties: Smithy.Attributes
    ) async throws -> SmithyHTTPAPI.HTTPRequestBuilder {
        return requestBuilder
    }
}

public class ApiKeyAuthSchemeResolverParameters: AuthSchemeResolverParameters {
    public var operation: String
    public init(operation: String) {
        self.operation = operation
    }
}

public class ApiKeyAuthSchemeResolver: AuthSchemeResolver {
    public init() {}
    
    public func resolveAuthScheme(params: AuthSchemeResolverParameters) throws -> [AuthOption] {
        var validAuthOptions = Array<AuthOption>()
        validAuthOptions.append(AuthOption(schemeID: apiKeyAuthSchemeID))
        return validAuthOptions
    }

    public func constructParameters(context: Context) throws -> AuthSchemeResolverParameters {
        guard let opName = context.getOperation() else {
            throw ClientError.dataNotFound(
                "Operation name not configured in middleware context for auth scheme resolver params construction.")
        }
        return ApiKeyAuthSchemeResolverParameters(operation: opName)
    }
}

public class APIKeyInterceptor<InputType, OutputType>: Interceptor {
    public typealias RequestType = HTTPRequest
    public typealias ResponseType = HTTPResponse
    
    private var apiKey: String

    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    // Use the HTTP interceptor to inject the API key "key" query param into requests
    public func modifyBeforeSigning(context: some MutableRequest<InputType, RequestType>) async throws {
        let request = context.getRequest()
        
        // Check if the user had already explicitly passed in the "key" for the request
        // If they did, we don't want to override it
        let apiKeyName = "key"
        var apiKeyExists = false
        for item in request.queryItems ?? [] {
            if (item.name == apiKeyName) {
                apiKeyExists = true
                break
            }
        }
        
        // If the request was missing an apiKey, then we add it to the request
        // directly through the query parameters
        if (!apiKeyExists) {
            let apiKeyQueryItem = URIQueryItem(name: apiKeyName, value: apiKey)
            
            let requestBuilder = context.getRequest().toBuilder()
            requestBuilder.withQueryItem(apiKeyQueryItem)
            
            context.updateRequest(updated: requestBuilder.build())
        }
    }
}

public class APIKeyInterceptorProvider: HttpInterceptorProvider {
    private var apiKey: String

    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    public func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
        return APIKeyInterceptor(apiKey: self.apiKey)
    }
}
