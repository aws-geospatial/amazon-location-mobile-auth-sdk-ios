import Testing
import Foundation
@testable import AmazonLocationiOSAuthSDK
import SmithyHTTPAPI
import ClientRuntime
import Smithy

@Suite("APIKeyInterceptor Tests") struct APIKeyInterceptorTests {
    
    @Test("Test bundle ID header is added to request") func testBundleIdHeaderAdded() async throws {
        let interceptor = APIKeyInterceptor<String, String>(apiKey: "test-api-key")
        let context = MockRequestContext()
        
        try await interceptor.modifyBeforeSigning(context: context)
        
        let updatedRequest = context.getRequest()
        let bundleIdHeader = updatedRequest.headers.value(for: "X-Apple-Bundle-Id")
        
        if let expectedBundleId = Bundle.main.bundleIdentifier {
            #expect(bundleIdHeader == expectedBundleId)
        }
    }
    
    @Test("Test API key query param is added when missing") func testApiKeyAdded() async throws {
        let interceptor = APIKeyInterceptor<String, String>(apiKey: "test-api-key")
        let context = MockRequestContext()
        
        try await interceptor.modifyBeforeSigning(context: context)
        
        let updatedRequest = context.getRequest()
        let hasKey = updatedRequest.queryItems?.contains(where: { $0.name == "key" && $0.value == "test-api-key" }) ?? false
        #expect(hasKey)
    }
    
    @Test("Test API key not duplicated when already present") func testApiKeyNotDuplicated() async throws {
        let interceptor = APIKeyInterceptor<String, String>(apiKey: "test-api-key")
        let request = HTTPRequestBuilder()
            .withHost("example.com")
            .withPath("/test")
            .withMethod(.get)
            .withQueryItem(URIQueryItem(name: "key", value: "existing-key"))
            .build()
        let context = MockRequestContext(request: request)
        
        try await interceptor.modifyBeforeSigning(context: context)
        
        let updatedRequest = context.getRequest()
        let keyItems = updatedRequest.queryItems?.filter { $0.name == "key" } ?? []
        #expect(keyItems.count == 1)
        #expect(keyItems.first?.value == "existing-key")
    }
}

class MockRequestContext: MutableRequest {
    typealias InputType = String
    typealias OutputType = String
    typealias RequestType = HTTPRequest
    typealias ResponseType = HTTPResponse
    
    private var request: HTTPRequest
    
    init(request: HTTPRequest? = nil) {
        self.request = request ?? HTTPRequestBuilder()
            .withHost("example.com")
            .withPath("/test")
            .withMethod(.get)
            .build()
    }
    
    func getInput() -> String { return "" }
    func getAttributes() -> Context { return Context(attributes: Attributes()) }
    func getRequest() -> HTTPRequest { return request }
    func updateRequest(updated: HTTPRequest) { self.request = updated }
}
