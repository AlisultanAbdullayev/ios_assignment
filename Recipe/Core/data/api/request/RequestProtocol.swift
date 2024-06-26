//
//  RequestProtocol.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/29/24.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    var requestType: RequestType { get }
    var headers: [String : String] { get }
    var params: [String : Any] { get }
    var urlParams: [String : String?]? { get }
}

extension RequestProtocol {
    var host: String {
        APIConstants.host
    }
    
    var params: [String : Any] {
        [:]
    }
    
    var urlParams: [String : String?] {
        [:]
    }
    
    var headers: [String : String] {
        [:]
    }
    
    func createURLRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        
        if let urlParams, !urlParams.isEmpty {
            components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }
        
        guard let url = components.url else { throw NetworkError.invalidURL }
        print(url)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
   
}
