import SmithyHTTPAuthAPI
import Smithy
import SmithyHTTPAPI

public let apiKeyAuthSchemeID: String = "smithy.api#noAuth"

public struct ApiKeyAuthScheme: AuthScheme {
    public var schemeID: String = apiKeyAuthSchemeID
    public var signer: any SmithyHTTPAuthAPI.Signer
    
    public init(signer: any SmithyHTTPAuthAPI.Signer) {
        self.signer = signer
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
