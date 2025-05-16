//
//  FeedListView.swift
//  FeedFeature
//
//  Created by Kyeongmo Yang on 5/18/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import SwiftUI

public struct FeedListView: View {
    public init() {}
    
    public var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...20, id: \.self) { number in
                    FeedCell()
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}

#Preview {
    FeedListView()
}
