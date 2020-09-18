//
//  ContentView.swift
//  LoadingSpinner
//
//  Created by Alexander Römer on 18.09.20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSpinning = false
    
    var body: some View {
        ZStack {
            
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            Text("Loading")
                .foregroundColor(Color(.systemYellow))
                .shadow(color: Color(.systemYellow), radius: 5, x: 1, y: 1)
            
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 150, height: 150)
                .foregroundColor(Color(.darkGray))
            
            Circle()
                .trim(from: 0, to: 1/4)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 150, height: 150)
                .foregroundColor(Color(.systemYellow))
                .overlay(Circle()
                            .frame(width: 15, height: 15)
                            .foregroundColor(Color(.systemYellow))
                            .offset(x: 0, y: 75)
                )
                .shadow(color: Color(.yellow), radius: 5, x: 1, y: 1)
                .offset()
                .rotationEffect(.degrees(isSpinning ? 360 : 0))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isSpinning.toggle()
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
