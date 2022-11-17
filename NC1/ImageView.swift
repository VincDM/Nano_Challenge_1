//
//  ImageView.swift
//  NC1
//
//  Created by Vincenzo Di Meo on 17/11/22.
//

import SwiftUI

struct ImageView: View {
    
    @State var uiImage: UIImage?
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        VStack {
            if uiImage != nil {
                Image(uiImage: uiImage!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 600)
                    .border(Color.pink)
                    .clipped()
                    .shadow(color: .black, radius: 8, x: 0, y: 5)
            }
            else {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 600)
                    .border(Color.pink)
                    .clipped()
                    .shadow(color: .black, radius: 8, x: 0, y: 5)
            }
            
            if let imageClass = classifier.imageClass {
                HStack {
                    Text("Brand name:")
                        .font(.body)
                        .bold()
                    Text(imageClass)
                }
                .padding(.top, 50)
            }
            else {
                HStack {
                    Text("Brand name:")
                        .font(.body)
                        .bold()
                    Text("Not found")
                }
                .padding(.top, 50)
            }
        }
        .font(.subheadline)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(classifier: ImageClassifier())
    }
}
