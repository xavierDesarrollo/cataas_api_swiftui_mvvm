//
//  ServiceError.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import Foundation

enum ServiceError: Error {
    case badURL
    case badResponse(statusCode: Int)
    case parsing(DecodingError?)
    case generic
    
    
    var localizedDescription: String {
        switch self {
            case .badURL:
                return Constants.ERROR.badUrl
            case .badResponse(statusCode: let statusCode):
            return String(format: Constants.ERROR.badResponse, statusCode)
            case .parsing(let error):
                return error?.localizedDescription ?? Constants.ERROR.parsing
            case .generic:
                return Constants.ERROR.generic
        }
    }
}
