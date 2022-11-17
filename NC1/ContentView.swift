//
//  ContentView.swift
//  NC1
//
//  Created by Vincenzo Di Meo on 15/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresenting: Bool = false
    var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "camera")
                    .onTapGesture {
                        isPresenting = true
                    }
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .fullScreenCover(isPresented: $isPresenting) {
                CameraView()
                    .onDisappear {
                        if uiImage != nil {
                            ImageView(uiImage: uiImage, classifier: ImageClassifier())
                            print("Camera closed")
                        }
                    }
                    .ignoresSafeArea()
            }
            
            
            
            /*VStack {
             Button(action: {
             if uiImage != nil {
             classifier.detect(uiImage: uiImage!)
             }
             }) {
             Image(systemName: "bolt.fill")
             .foregroundColor(.orange)
             .font(.title)
             }
             
             
             }
             }
             .fullScreenCover(isPresented: $isPresenting){
             ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
             .onDisappear {
             if uiImage != nil {
             classifier.detect(uiImage: uiImage!)
             }
             }
             .ignoresSafeArea()
             }
             .padding()*/
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(classifier: ImageClassifier())
        }
    }
}
