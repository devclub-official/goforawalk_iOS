//
//  AuthClient.swift
//  goforawalk
//
//  Created by Kyeongmo Yang on 4/28/25.
//

import Foundation
import AuthInterface
import BaseDomain
import ComposableArchitecture

extension AuthClient: DependencyKey {
    public static let liveValue = AuthClient(
        signIn: { domain, idToken in
            let requestDTO = SignInRequestDTO(idToken: idToken)
            let apiEndpoint = AuthEndpoint.signIn(provider: domain, requestDTO)
        },
        saveToken: { token in
            return
        },
//        loadToken: {
//            return
//        }
    )
}

extension DependencyValues {
    public var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}
