//
//  GoForAWalkApp.swift
//  GoForAWalk
//
//  Created by Kyeongmo Yang on 5/6/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import SwiftUI
import Root
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct GoForAWalkApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: .init(initialState: RootStore.State()) {
                RootStore()
            })
            .onOpenURL { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    _ = AuthController.handleOpenUrl(url: url)
                }
            }
        }
    }
    
    init() {
        KakaoSDK.initSDK(appKey: "967669c3b7e25ab9fa8fda2775b8f581")
    }
}
