//
//  SignInFeature.swift
//  SignIn
//
//  Created by Kyeongmo Yang on 5/11/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import Auth
import AuthInterface
import ComposableArchitecture
import GlobalThirdPartyLibrary
import KakaoSDKAuth
import KakaoSDKUser
import KeyChainStore

@Reducer
public struct SignInFeature {
    @ObservableState
    public struct State {
        public var isLoading: Bool = false
        @Presents var alert: AlertState<Action.Alert>?
        
        public init() {}
    }
    
    public enum Action {
        case alert(PresentationAction<Alert>)
        case checkAuthorization
        case isAlreadyAuthorized
        case kakaoSignInButtonTapped
        case signInWithKakakoResponse(AuthInterface.Token, AuthInterface.User)
        case signInWithKakaoError(Error)
        // TODO: - Apple login
        
        @CasePathable
        public enum Alert {
            case messageReceived(String)
        }
    }
    
    @Dependency(\.authClient) var authClient
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .checkAuthorization:
                if KeyChainStore.shared.validateToken() {
                    return .send(.isAlreadyAuthorized)
                }
                return .none
                
            case .kakaoSignInButtonTapped:
                state.isLoading = true
                
                return .run { send in
                    do {
                        let oauthToken: OAuthToken? = try await withCheckedThrowingContinuation { continuation in
                            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                                if let error {
                                    continuation.resume(throwing: error)
                                    return
                                }
                                continuation.resume(returning: oauthToken)
                            }
                        }
                        let (token, userInfo) = try await authClient.signIn(.kakao, oauthToken?.accessToken ?? "")
                        await send(.signInWithKakakoResponse(token, userInfo))
                    } catch {
                        await send(.signInWithKakaoError(error))
                    }
                }
                
            case let .signInWithKakakoResponse(token, _):
                state.isLoading = false
                authClient.saveToken(token)
                return .send(.isAlreadyAuthorized)
                
            case let .signInWithKakaoError(error):
                state.isLoading = false
                state.alert = AlertState(
                    title: {
                        TextState("알림")
                    }, actions: {
                        ButtonState {
                            TextState("확인")
                        }
                    }, message: {
                        TextState(error.localizedDescription)
                    })
                return .none
                
            default:
                return .none
            }
        }
    }
}
