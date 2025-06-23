//
//  FeedListView.swift
//  FeedFeature
//
//  Created by Kyeongmo Yang on 5/18/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

public struct FeedListView: View {
    private var store: StoreOf<FeedFeature>
    
    public init(store: StoreOf<FeedFeature>) {
        self.store = store
    }
    
    public var body: some View {
        if store.footsteps.isEmpty {
            Text("아직 발자취가 없어요.\n첫 발자취를 남겨볼까요?")
                .multilineTextAlignment(.center)
        } else {
            ScrollView {
                LazyVStack {
                    ForEach(store.footsteps) { footsteps in
                        FeedCell(footstep: footsteps) { footstep in
                            store.send(.footstepCellMenuTapped(footstep.id))
                        }
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                    }
                }
            }
            .onAppear {
                store.send(.onAppear)
            }
        }
    }
}

#Preview {
    FeedListView(store: .init(initialState: FeedFeature.State()) {
        FeedFeature()
    })
}
