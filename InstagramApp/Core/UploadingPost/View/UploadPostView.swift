//
//  UploadPhotoView.swift
//  InstagramApp
//
//  Created by Helen on 27.06.2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @Environment(\.dismiss) var dismiss
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack{
            HStack {
                Button {
                    clearPostData()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New post")
                    .fontWeight(.semibold)
                
                Spacer()
            
                Button {
                    Task { 
                        try await viewModel.uploadPost(caption: caption)
                        clearPostData()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
                
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
    
    func clearPostData() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
        dismiss()
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
