//
//  SignInView.swift
//  SignIn
//
//  Created by Kyeongmo Yang on 5/5/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import AuthenticationServices
import ComposableArchitecture
import SwiftUI

public struct SignInView: View {
    @StateObject private var store: StoreOf<SignInFeature>
    
    public init(store: StoreOf<SignInFeature>) {
        _store = .init(wrappedValue: store)
    }
    
    public var body: some View {
        VStack {
            Text("걷는 로고")
                .font(.largeTitle)
            
            Text("'가장 쉬운 걷기의 시작'")
            
            Spacer()
            
            Button {
                store.send(.kakaoSignInButtonTapped)
            } label: {
                Text("카카오 로그인")
            }
            
            SignInWithAppleButton { request in
                request.requestedScopes = [.email]
            } onCompletion: { result in
                switch result {
                case .success(let authorization):
                    store.send(.signInWithAppleCredential(authorization))
                case .failure(let error):
                    store.send(.signInWithAppleError(error))
                }
            }
        }
        .alert($store.scope(state: \.alert, action: \.alert))
    }
}
