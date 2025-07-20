//
//  CustomCameraView.swift
//  RecordFeature
//
//  Created by Kyeongmo Yang on 7/20/25.
//  Copyright © 2025 com.gaeng2y. All rights reserved.
//

import SwiftUI

public struct CustomCameraView: View {
    @State private var capturedImage: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    let cameraService = CameraService()
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Color.black
            
            GeometryReader { geometry in
                CameraView(cameraService: cameraService) { result in
                    switch result {
                    case .success(let photo):
                        if let data = photo.fileDataRepresentation() {
                            // 사진 버튼을 누르면 아래와 같이 동작
                            capturedImage = UIImage(data : data)
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            print("Error : no image data found")
                        }
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.width
                )
                .clipped()
                .position(
                    x: geometry.size.width / 2,
                    y: geometry.size.height / 2
                )
            }
            
            VStack {
                Spacer()
                
                Button(
                    action: {
                        cameraService.capturePhoto()
                    }, label: {
                        Image(systemName: "circle").font(.system(size: 72)).foregroundColor(.white)
                    }
                )
            }
        }
    }
}

//#Preview {
//    CustomCameraView()
//}
