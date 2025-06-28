//
//  MainTabFeature.swift
//  MainFeature
//
//  Created by Kyeongmo Yang on 5/15/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import ComposableArchitecture
import FeedFeature
import ProfileFeature

@Reducer
public struct MainTabFeature {
    @ObservableState
    public struct State {
        var currentTab: MainTab = .home
        
        var feed: FeedFeature.State = .init()
        var profile: ProfileFeature.State = .init()
        
        public init() {}
    }
    
    public enum Action {
        case selectTab(MainTab)
        
        case feed(FeedFeature.Action)
        case profile(ProfileFeature.Action)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.feed, action: \.feed) {
            FeedFeature()
        }
        Scope(state: \.profile, action: \.profile) {
            ProfileFeature()
        }
        
        Reduce { state, action in
            switch action {
            case .selectTab(let tab):
                state.currentTab = tab
                return .none
                
            case .feed(let feedAction):
                return .none
                
            case .profile(let profileAction):
                return .none
            }
        }
    }
}
