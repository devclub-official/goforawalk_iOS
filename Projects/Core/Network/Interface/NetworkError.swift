//
//  NetworkError.swift
//  NetworkInterface
//
//  Created by Kyeongmo Yang on 4/15/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import Foundation

public enum NetworkError: Error, Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        lhs.messsage == rhs.messsage
    }
    
    case invalidURL
    case failedDecoding
    case failedAuthorization
    case lostConnection
    case internalError
    
    var messsage: String {
        switch self {
        case .invalidURL: "Invalid URL"
        case .failedDecoding: "Decoding failed"
        case .failedAuthorization: "Authorization failed"
        case .lostConnection: "Connection Lost"
        case .internalError: "Internal Error"
        }
    }
}
