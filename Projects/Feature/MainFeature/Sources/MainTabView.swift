//
//  MainTabView.swift
//  MainFeature
//
//  Created by Kyeongmo Yang on 5/14/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import ComposableArchitecture
import FeedFeature
import ProfileFeature
import SwiftUI

public struct MainTabView: View {
    private let store: StoreOf<MainTabFeature>
    
    public init(store: StoreOf<MainTabFeature>) {
        self.store = store
    }
    
    public var body: some View {
        TabView {
            Tab(
                MainTab.home.title,
                systemImage: MainTab.home.imageName
            ) {
                NavigationStack {
                    FeedListView(
                        store: store.scope(
                            state: \.feed,
                            action: \.feed
                        )
                    )
                }
            }
            
            Tab(MainTab.record.title, systemImage: MainTab.record.imageName) {
                ScrollView {
                    List([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], id: \.self) { number in
                        Text("\(number)")
                    }
                }
            }
            
            Tab(
                MainTab.profile.title,
                systemImage: MainTab.profile.imageName
            ) {
                NavigationStack {
                    ProfileView(
                        store: store.scope(
                            state: \.profile,
                            action: \.profile
                        )
                    )
                }
            }
        }
    }
}

#Preview {
    MainTabView(store: Store(initialState: MainTabFeature.State()) {
        MainTabFeature()
    })
}
