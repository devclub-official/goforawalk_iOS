//
//  MainTabFeature.swift
//  MainFeature
//
//  Created by Kyeongmo Yang on 5/15/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import ComposableArchitecture
import FeedFeature

@Reducer
public struct MainTabFeature {
    @ObservableState
    public struct State {
        var currentTab: MainTab = .home
        
        var feed: FeedFeature.State = .init()
        
        public init() {}
    }
    
    public enum Action {
        case selectTab(MainTab)
        
        case feed(FeedFeature.Action)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.feed, action: \.feed) {
            FeedFeature()
        }
        
        Reduce { state, action in
            switch action {
            case .selectTab(let tab):
                state.currentTab = tab
                return .none
                
            case .feed(let feedAction):
                return .none
            }
        }
    }
}
