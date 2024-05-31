//
//  NetworkError.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/29/24.
//

import Foundation

public enum NetworkError: LocalizedError {
    case invalidServerResponse
    case invalidURL
    
    public var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            "The server returned an invalid response!"
        case .invalidURL:
            "URL string is malformed!"
        }
    }
}
