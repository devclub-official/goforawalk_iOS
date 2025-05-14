//
//  RootFeature.swift
//  Root
//
//  Created by Kyeongmo Yang on 5/5/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import Auth
import ComposableArchitecture
import KeyChainStore
import SignIn

@Reducer
public struct RootFeature {
    @ObservableState
    public struct State {
        public var path: [String] = []
        public var signIn: SignInFeature.State = .init()
        
        public init() {
        }
    }
    
    public enum Action {
        case signIn(SignInFeature.Action)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .signIn(.isAlreadyAuthorized):
                return .none
                
            default:
                return .none
            }
        }
        
        Scope(state: \.signIn, action: \.signIn) {
            SignInFeature()
        }
        .dependency(\.authClient, .liveValue)
    }
}
