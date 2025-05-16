//
//  MainTabFeature.swift
//  MainFeature
//
//  Created by Kyeongmo Yang on 5/15/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import ComposableArchitecture

@Reducer
public struct MainTabFeature {
    @ObservableState
    public struct State {
        var currentTab: MainTab = .home
        
        public init() {}
    }
    
    public enum Action {
        case selectTab(MainTab)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}
