//
//  RootStore.swift
//  Root
//
//  Created by Kyeongmo Yang on 5/5/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import BaseFeature
import SignIn
import ComposableArchitecture

@Reducer
public struct RootStore {
    @ObservableState
    public struct State {
        public var path: [String] = []
        
        public var signIn: SignInStore.State = .init(isSignedIn: false)
        
        public init() {
        }
    }
    
    public enum Action {
        case signIn(SignInStore.Action)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .signIn:
                return .none
            }
        }
        
        Scope(state: \.signIn, action: \.signIn) {
            SignInStore()
        }
    }
}
