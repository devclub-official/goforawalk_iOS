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
import Network

extension AuthClient: DependencyKey {
    public static let liveValue = AuthClient(
        signIn: { domain, idToken in
            let requestDTO = SignInRequestDTO(idToken: idToken)
            let apiEndpoint = AuthEndpoint.signIn(provider: domain, requestDTO)
            let response = try await NetworkProviderImpl.shared.request(apiEndpoint)
            return response.toDomain()
        },
        saveToken: { token in
            LocalAuthStoreImpl().saveToken(token: token)
        },
        loadToken: {
            LocalAuthStoreImpl().loadToken()
        }
    )
}

extension DependencyValues {
    public var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}
