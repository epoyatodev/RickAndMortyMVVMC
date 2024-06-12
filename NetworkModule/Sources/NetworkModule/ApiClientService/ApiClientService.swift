//
//
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//


import Foundation
import Combine

public enum APIError: Error {
    case invalidEndpoint
    case badServerResponse
    case networkError(error: Error)
    case parsing(error: Error)
}

public typealias APIResponse = (data: Data, statusCode: Int)


public protocol IAPIClientService {
    func buildURLRequest(from endpoint: EndPointType) -> URLRequest?
}


public final class APIClientService: IAPIClientService {
    public struct Configuration {
        let baseURL: URL?
        let baseHeaders: [String: String]
        
        public init(baseURL: URL?, baseHeaders: [String: String]) {
            self.baseURL = baseURL
            self.baseHeaders = baseHeaders
        }
        
        public static let `default` = Configuration(baseURL: nil, baseHeaders: [:])
    }
    
    private let configuration: Configuration
    
    public init(configuration: Configuration = .default) {
        self.configuration = configuration
    }
    
    public func buildURLRequest(from endpoint: EndPointType) -> URLRequest? {
        let host = endpoint.baseURL?.host() ?? configuration.baseURL?.host()
        guard let host = host else { return nil }
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = endpoint.path
        
        if let urlQueries = endpoint.urlQueries {
            var queryItems: [URLQueryItem] = []
            for item in urlQueries {
                queryItems.append(URLQueryItem(name: item.key, value: item.value))
            }
            
            components.queryItems = queryItems
        }
        
        guard let url = components.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        
        let endpointHeaders = endpoint.headers ?? [:]
        let mergedHeaders = configuration.baseHeaders.merging(endpointHeaders) { (_, new) in new }
        request.allHTTPHeaderFields = mergedHeaders
        
        switch endpoint.bodyParameter {
        case let .data(data):
            request.httpBody = data
        case let .dictionary(dict, options):
            let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: options)
            request.httpBody = jsonData
        case let .encodable(object, encoder):
            let data = try? encoder.encode(object)
            request.httpBody = data
        default:
            break
        }
        
        return request
    }
}



