//
//  FeedCell.swift
//  FeedFeature
//
//  Created by Kyeongmo Yang on 5/19/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            HStack {
                Text("닉네임")
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
                AsyncImage(url: URL(string: "https://yavuzceliker.github.io/sample-images/image-1.jpg")!) { phase in
                    switch phase {
                    case .empty:
                        Color.gray.opacity(0.1)
                            .frame(height: 250)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .overlay(alignment: .topLeading) {
                                VStack {
                                    HStack {
                                        Text("걷는")
                                        
                                        Spacer()
                                        
                                        Text("3일 연속")
                                    }
                                    .foregroundStyle(Color.ff6b6b)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Spacer()
                                        
                                        Text("2025년 6월 28일")
                                            .foregroundStyle(Color.gray757990)
                                    }
                                }
                                .padding(15)
                            }
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
                Text("이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을(50글자)")
                
                Text("30분 전")
            }
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
    FeedCell()
}

fileprivate extension Color {
    static let ff6b6b = Color(red: 1.0, green: 107/255, blue: 107/255)
    static let gray757990 = Color(red: 117/255, green: 121/255, blue: 144/255)
}
