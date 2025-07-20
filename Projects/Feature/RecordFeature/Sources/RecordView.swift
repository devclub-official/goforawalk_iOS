//
//  RecordView.swift
//  RecordFeature
//
//  Created by Kyeongmo Yang on 7/20/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import SwiftUI

public struct RecordView: View {
    @State private var capturedImage: UIImage?
    @State private var isCustomCameraViewPresented = false
    
    public init() {}
    
    public var body: some View {
        ZStack {
            if capturedImage != nil {
                Image(uiImage: capturedImage!)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                Color(UIColor.systemBackground)
            }
            VStack {
                Spacer()
                
                Button(
                    action: {
                        isCustomCameraViewPresented.toggle()
                    }, label: {
                        Image(systemName: "camera.fill")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white).clipShape(Circle())
                    }
                )
                .padding(.bottom)
                .sheet(isPresented: $isCustomCameraViewPresented) {
//                    CustomCameraView(capturedImage: $capturedImage)
                }
                // 실시간으로 카메라 영상이 보이는 화면 표시
            }
        }
    }
}

#Preview {
    RecordView()
}
