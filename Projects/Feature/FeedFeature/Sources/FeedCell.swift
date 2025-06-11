//
//  FeedCell.swift
//  FeedFeature
//
//  Created by Kyeongmo Yang on 5/19/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import SwiftUI
import FeedServiceInterface

struct FeedCell: View {
    private let footstep: Footstep
    
    public init(footstep: Footstep) {
        self.footstep = footstep
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(footstep.userNickname)
                    .font(.headline)
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(Color.gray)
                }
            }
            .padding(.horizontal, 15)
            .padding(.top, 15)
            
            ZStack {
                AsyncImage(url: footstep.imageUrl) { phase in
                    switch phase {
                    case .empty:
                        Color.gray.opacity(0.1)
                            .frame(height: 250)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                    case .failure:
                        Image(systemName: "photo")
                            .frame(height: 250)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            HStack(alignment: .top) {
                Text(footstep.content ?? "")
                
                if Calendar.current.isDate(footstep.createdAt, inSameDayAs: .now) {
                    Text(footstep.createdAt.formatted(date: .omitted, time: .shortened))
                } else {
                    Text(footstep.createdAt.formatted(date: .numeric, time: .omitted))
                }
            }
            .foregroundStyle(Color.gray757990)
            .padding(10)
        }
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

#Preview {
    FeedCell(footstep: .mock)
}

fileprivate extension Color {
    static let ff6b6b = Color(red: 1.0, green: 107/255, blue: 107/255)
    static let gray757990 = Color(red: 117/255, green: 121/255, blue: 144/255)
}
