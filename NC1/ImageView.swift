//
//  ImageView.swift
//  NC1
//
//  Created by Vincenzo Di Meo on 17/11/22.
//

import SwiftUI

struct ImageView: View {
    
    @State var uiImage: UIImage?
    var classifier: ImageClassifier
    
    var body: some View {
        VStack {
            if (uiImage != nil) {
                Image(uiImage: uiImage!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 320, height: 500)
                    .clipped()
                    .cornerRadius(15)
                    .shadow(color: .black, radius: 8, x: 0, y: 5)
            }
            else {
                Image(systemName: "questionmark.square.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 320, height: 500)
                    .clipped()
                    .cornerRadius(15)
                    .shadow(color: .black, radius: 8, x: 0, y: 5)
            }
            
            if (uiImage != nil) {
                HStack {
                    Text("Brand name:")
                        .font(.title2)
                        .bold()
                    
                    Text(getImageClass())
                        .font(.title2)
                }
                .padding(.top, 50)
            }
            else {
                HStack {
                    Text("Brand name:")
                        .font(.title2)
                        .bold()
                    
                    Text("Not found")
                        .font(.title2)
                }
                .padding(.top, 50)
            }
        }
        .font(.subheadline)
    }
    
    func detectImage(uiImage: UIImage!) {
        classifier.detect(uiImage: uiImage!)
    }
    
    func getImageClass() -> String {
        detectImage(uiImage: uiImage)
        return classifier.imageClass!
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(uiImage: nil, classifier: ImageClassifier())
    }
}
