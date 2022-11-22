//
//  Loading.swift
//  NC1
//
//  Created by Vincenzo Di Meo on 22/11/22.
//

import SwiftUI

struct Loading: View {
    
    @State private var wave = false
    @State private var wave1 = false
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("Orange"))
                    .scaleEffect(wave ? 2 : 1) . opacity (wave ? 0 : 1)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false).speed(0.3))
                    .onAppear () {
                        self.wave.toggle()
                    }
            }
            
            Text("Loading...")
                .font(.title2)
                .bold()
                .padding(.top, 100)
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
