//
//  SignInResponseDTO.swift
//  goforawalk
//
//  Created by Kyeongmo Yang on 4/28/25.
//

import Foundation

public struct SignInResponseDTO: Decodable {
    public struct Credentials: Decodable {
        let accessToken: String
        let refreshToken: String
    }
    
    public struct User: Decodable {
        let email: String?
        let nickname: String
    }
    
    let userId: Int
    let credentials: Credentials
    let user: User
    
    public init(
        userId: Int,
        credentials: Credentials,
        user: User
    ) {
        self.userId = userId
        self.credentials = credentials
        self.user = user
    }
    
    public func toDomain() -> (Token, UserInfo) {
        let token = Token(accessToken: credentials.accessToken, userId: "\(userId)")
        let user = UserInfo(nickname: user.nickname, email: user.nickname)
        return (token, user)
    }
}
