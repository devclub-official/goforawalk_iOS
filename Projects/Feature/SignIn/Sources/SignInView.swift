//
//  SignInView.swift
//  SignIn
//
//  Created by Kyeongmo Yang on 5/5/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import SwiftUI
import BaseFeature
import AuthInterface
import GlobalThirdPartyLibrary
import ComposableArchitecture

public struct SignInView: View {
    private let store: StoreOf<SignInStore>
    
    public init(store: StoreOf<SignInStore>) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            Text("걷는 로고")
                .font(.largeTitle)
            
            Text("'가장 쉬운 걷기의 시작'")
            
            Spacer()
            
            Button {
                store.send(.tapSignInButton(.kakao))
            } label: {
                Text("카카오 로그인")
            }
        }
        .padding(.vertical, 20)
    }
}

#Preview {
    SignInView(
        store: .init(initialState: SignInStore.State(isSignedIn: false)) {
            SignInStore()
        }
    )
}
