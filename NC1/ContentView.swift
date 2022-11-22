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
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var uploaded: Bool = false
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("AI Search")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                    
                    Spacer()
                }
                
                HStack {
                    Text("Use AI to search for products")
                        .font(Font.custom("AddingtonCF-Thin", size: 26, relativeTo: .title2))
                        .padding(.leading)
                    
                    Spacer()
                }
                
                Rectangle()
                    .frame(width: 1000, height: 1)
                    .foregroundColor(.gray)
                
                Group {
                    HStack {
                        Image(systemName: "camera.viewfinder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .foregroundColor(Color("Orange"))
                        
                        Image("Arrow")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .padding(.top, 150)
                    }
                    
                    HStack {
                        Image("Shoes")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipped()
                    }
                }
                .padding(.top, 30)
                
                Spacer()
                
                Button {
                    isPresenting = true
                    uiImage = nil
                } label: {
                    Text("Take a photo")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                }
                .background(content: {
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: 350, height: 50)
                })
                
                .fullScreenCover(isPresented: $isPresenting) {
                    CameraView(uiImage: $uiImage, isPresenting: $isPresenting)
                        .onDisappear() {
                            if uiImage != nil {
                                uploaded = true
                            }
                        }
                        .ignoresSafeArea()
                }
                
                // Showing image into ImageView
                NavigationLink("", destination: ImageView(uiImage: uiImage, classifier: ImageClassifier()), isActive: $uploaded)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(classifier: ImageClassifier())
        }
    }
}
