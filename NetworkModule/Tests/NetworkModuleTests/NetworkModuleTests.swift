import XCTest
@testable import NetworkModule

final class NetworkModuleTests: XCTestCase {
    func testBuildURLRequest_withValidEndpoint_shouldReturnURLRequest() {
            // Arrange
            let configuration = APIClientService.Configuration(baseURL: URL(string: "https://rickandmortyapi.com"), baseHeaders: ["Content-Type": "application/json"])
            let apiClientService = APIClientService(configuration: configuration)
            
            let endpoint = MockEndPointType(path: "/api/character", httpMethod: .get, headers: nil, urlQueries: ["page": "1"], bodyParameter: nil)
            
            // Act
            let request = apiClientService.buildURLRequest(from: endpoint)
            
            // Assert
            XCTAssertNotNil(request)
            XCTAssertEqual(request?.url?.absoluteString, "https://rickandmortyapi.com/api/character?page=1")
            XCTAssertEqual(request?.httpMethod, "GET")
            XCTAssertEqual(request?.allHTTPHeaderFields?["Content-Type"], "application/json")
        }
    
    func testBuildURLRequest_withInvalidEndpoint_shouldReturnNil() {
            // Arrange
            let configuration = APIClientService.Configuration(baseURL: nil, baseHeaders: [:])
            let apiClientService = APIClientService(configuration: configuration)
            
        let endpoint = MockEndPointType(baseURL: URL(string: "") , path: "/api/character", httpMethod: .get, headers: nil, urlQueries: nil, bodyParameter: nil)
            
            // Act
            let request = apiClientService.buildURLRequest(from: endpoint)
            
            // Assert
            XCTAssertNil(request)
        }
}

// Mock EndPointType for testing
struct MockEndPointType: EndPointType {
    var baseURL: URL?
    var path: String
    var httpMethod: NetworkModule.HTTPMethod
    var headers: [String: String]?
    var urlQueries: [String: String]?
    var bodyParameter: NetworkModule.BodyParameter?
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum BodyParameter {
    case data(Data)
    case dictionary([String: Any], options: JSONSerialization.WritingOptions)
    case encodable(Encodable, encoder: JSONEncoder)
}
