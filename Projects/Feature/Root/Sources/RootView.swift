//
//  RootView.swift
//  Root
//
//  Created by Kyeongmo Yang on 5/5/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import SignIn

public struct RootView: View {
    public let store: StoreOf<RootStore>
    
    public init(store: StoreOf<RootStore>) {
        self.store = store
    }
    
    public var body: some View {
        SignInView(store: store.scope(state: \.signIn, action: \.signIn))
    }
}

//#Preview {
//    RootView(store: RootStore())
//}
