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
    
    public struct UserInfo: Decodable {
        let email: String?
        let nickname: String
    }
    
    let userId: Int
    let credentails: Credentials
    let userInfo: UserInfo
    
    public init(
        userId: Int,
        credentails: Credentials,
        userInfo: UserInfo
    ) {
        self.userId = userId
        self.credentails = credentails
        self.userInfo = userInfo
    }
}
