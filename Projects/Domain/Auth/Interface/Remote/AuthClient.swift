//
//  AuthClient.swift
//  AuthInterface
//
//  Created by Kyeongmo Yang on 4/22/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import Foundation
import ComposableArchitecture

public struct AuthClient {
    public var signIn: @Sendable (LoginType, String) async throws -> Void
    public var saveToken: (Token) -> Void
//    public var loadToken: @Sendable () -> Token
   
    public init(signIn: @escaping @Sendable (LoginType, String) async throws -> Void,
                saveToken: @escaping (Token) -> Void/*,*/
                /*loadToken: @escaping @Sendable () -> Token*/) {
        self.signIn = signIn
        self.saveToken = saveToken
//        self.loadToken = loadToken
    }
}

extension AuthClient: TestDependencyKey {
    public static var previewValue = Self(
        signIn: unimplemented("\(Self.self).signIn"),
        saveToken: unimplemented("\(Self.self).saveToken"),
//        loadToken: unimplemented("\(Self.self).loadToken")
    )
    
    public static let testValue = Self(
        signIn: unimplemented("\(Self.self).signIn"),
        saveToken: unimplemented("\(Self.self).saveToken"),
//        loadToken: unimplemented("\(Self.self).loadToken")
    )
}
