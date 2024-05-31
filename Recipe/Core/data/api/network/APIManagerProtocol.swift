//
//  APIManagerProtocol.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/29/24.
//

import Foundation

protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol) async throws -> Data
}

final actor APIManager: APIManagerProtocol {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())
        
        guard
            let httpResponse = response as? HTTPURLResponse,
            200..<300 ~= httpResponse.statusCode
        else {
            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                print(statusCode)
            }
            throw URLError(.badServerResponse)
        }
        print("Called performer!")
        return data
    }
}
