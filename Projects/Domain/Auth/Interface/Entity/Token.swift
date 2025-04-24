//
//  Token.swift
//  AuthInterface
//
//  Created by Kyeongmo Yang on 4/22/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import Foundation

public struct Token: Equatable {
    public let accessToken: String?
    public let expiresAt: String?
    public let userId: String?
    public let loginType: LoginType
    public let oauth2Id: String?
    
    public init(
        accessToken: String?,
        expiresAt: String?,
        userId: String?,
        loginType: LoginType,
        oauth2Id: String?
    ) {
        self.accessToken = accessToken
        self.expiresAt = expiresAt
        self.userId = userId
        self.loginType = loginType
        self.oauth2Id = oauth2Id
    }
}

public extension Token {
    static let mock = Token(
        accessToken: "mockAccessToken",
        expiresAt: "2025-04-22",
        userId: "userID",
        loginType: .apple,
        oauth2Id: "MockOAuth2Id"
    )
}
