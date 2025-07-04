//
//  ProfileView.swift
//  ProfileFeature
//
//  Created by Kyeongmo Yang on 6/24/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

public struct ProfileView: View {
    private var store: StoreOf<ProfileFeature>
    
    public init(store: StoreOf<ProfileFeature>) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text(store.profile.nickname)
                    .font(.system(size: 16))
                    .bold()
                
                Button {
                    print("닉네임 변경")
                } label: {
                    Image(systemName: "pencil.line")
                        .foregroundStyle(.black)
                }
            }
            .padding(.vertical, 25)
            
            HStack {
                VStack {
                    Text("\(store.profile.totalFootstepCount)")
                        .font(.system(size: 22))
                        .bold()
                        .italic()
                    
                    Text("발자취 개수")
                }
                
                Spacer()
                    .frame(width: 50)
                
                VStack {
                    Text("\(store.profile.footstepStreakDays)")
                        .font(.system(size: 22))
                        .bold()
                        .italic()
                    
                    Text("연속 발자취")
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ProfileView(store: .init(initialState: ProfileFeature.State()) {
        ProfileFeature()
    })
}
