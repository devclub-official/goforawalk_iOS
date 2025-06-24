//
//  ProfileFeature.swift
//  ProfileFeature
//
//  Created by Kyeongmo Yang on 6/27/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import ComposableArchitecture
import Foundation
import UserServiceInterface
import UserService

@Reducer
public struct ProfileFeature {
    @ObservableState
    public struct State {
        var profile: Profile = .init()
        
        public init() {}
    }
    
    public enum Action {
        case onAppear
        case fetchProfile(Profile)
        case changeNicknameButtonTapped
    }
    
    @Dependency(\.profileClient) var profileClient
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    let profile = try await profileClient.fetchProfile()
                    await send(.fetchProfile(profile))
                }
                
            case .fetchProfile(let profile):
                state.profile = profile
                return .none
                
            case .changeNicknameButtonTapped:
                return .none
            }
        }
    }
}
