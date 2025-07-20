//
//  MainTabView.swift
//  MainFeature
//
//  Created by Kyeongmo Yang on 5/14/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import ComposableArchitecture
import DesignSystem
import FeedFeature
import ProfileFeature
import RecordFeature
import SwiftUI

public struct MainTabView: View {
    private let store: StoreOf<MainTabFeature>
    @State private var showingCamera = false
    @State private var selectedImage: UIImage?
    
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
                Text("발자취 등록")
                    .onAppear {
                        showingCamera = true
                    }
            }
            
            Tab(
                MainTab.profile.title,
                systemImage: MainTab.profile.imageName
            ) {
                ProfileView(
                    store: store.scope(
                        state: \.profile,
                        action: \.profile
                    )
                )
            }
        }
        .fullScreenCover(isPresented: $showingCamera) {
//            RecordView()
            CustomCameraView()
        }
    }
}

#Preview {
    MainTabView(store: Store(initialState: MainTabFeature.State()) {
        MainTabFeature()
    })
}
