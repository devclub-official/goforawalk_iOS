//
//  FeedFeature.swift
//  FeedFeature
//
//  Created by Kyeongmo Yang on 6/10/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import ComposableArchitecture
import FeedServiceInterface
import FeedService

@Reducer
public struct FeedFeature {
    @ObservableState
    public struct State {
        var footsteps: [Footstep] = []
        var isLoading: Bool = false
        
        public init() {}
    }
    
    public enum Action {
        case onAppear
        case fetchFootstepsResponse([Footstep])
    }
    
    @Dependency(\.feedClient) var feedClient
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    let footsteps = try await feedClient.fetchFootsteps()
                    await send(.fetchFootstepsResponse(footsteps))
                }
            case .fetchFootstepsResponse(let footsteps):
                state.footsteps = footsteps
                return .none
            }
        }
    }
}
