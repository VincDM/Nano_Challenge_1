//
//  ContentView.swift
//  NC1
//
//  Created by Vincenzo Di Meo on 15/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State private var uploaded: String? = nil
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    isPresenting = true
                } label: {
                    Image(systemName: "camera.viewfinder")
                        .onTapGesture {
                            isPresenting = true
                        }
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
                .background(content: {
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color("Orange"))
                        .shadow(radius: 20, x: 20, y: 10)
                })
                .fullScreenCover(isPresented: $isPresenting) {
                    CameraView(uiImage: $uiImage, isPresenting: $isPresenting)
                        .onDisappear {
                            if uiImage != nil {
                                NavigationLink("", destination: ImageView(uiImage: uiImage, classifier: ImageClassifier()))
                            }
                        }
                        .ignoresSafeArea()
            }
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
