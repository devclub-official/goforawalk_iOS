//
//  SignInStore.swift
//  SignIn
//
//  Created by Kyeongmo Yang on 5/5/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import BaseFeature
import GlobalThirdPartyLibrary
import ComposableArchitecture
import KakaoSDKUser
import AuthInterface
import Auth
import NetworkInterface

@Reducer
public struct SignInStore {
    public struct State {
        let isSignedIn: Bool
        
        public init(isSignedIn: Bool) {
            self.isSignedIn = isSignedIn
        }
    }
    
    public enum Action {
        case tapSignInButton(LoginType)
    }
    
    public init() {
        
    }
    
    @Dependency(\.authClient) var authClient
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .tapSignInButton(let loginType):
                return .run { send in
                    switch loginType {
                    case .apple:
                        return
                        
                    case .kakao:
                        let idToken: String = try await withCheckedThrowingContinuation { continuation in
                            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                                if let error {
                                    continuation.resume(throwing: error)
                                } else {
                                    guard let oauthToken, let idToken = oauthToken.idToken else {
                                        continuation.resume(throwing: NetworkError.noResponse)
                                        return
                                    }
                                    
                                    continuation.resume(returning: idToken)
                                }
                            }
                        }
                        let (accessToken, user) = try await authClient.signIn(.kakao, idToken)
                        return
                    }
                }
            }
        }
    }
}
