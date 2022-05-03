//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI


struct CustomComposableView: View {
    
    // MARK: Stored Properties
    // Horizontal Position
    @State var xOffset = -100.0
    @State var rotationAmount = 360.0
    // Trigger to start the animation
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50, height: 50)
            Text("OK")
                .foregroundColor(.white)
            
        }
        .rotationEffect(.degrees(rotationAmount), anchor: .center)
        .offset(x: xOffset, y: 0)
        .animation(Animation
            .easeInOut(duration: 2)
            .repeatForever(autoreverses: true))
        .onReceive(timer) { input in
            // Move the circle and text over to the right
            xOffset = 100.0
            
            // Turn once
            rotationAmount = 360.0
            
            // Turn of the timer
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
