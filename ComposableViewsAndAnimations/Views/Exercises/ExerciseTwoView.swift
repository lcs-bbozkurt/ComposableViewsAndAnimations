//
//  ExerciseTwoView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseTwoView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Controls the size of the circle
    @State private var scaleFactor = 1.0
    
    // Controls the hue of the circle
    @State private var hue: Color = .black
    
    // Controls the size of the circle
    @State private var offsetx = -100.0
    @State var offsety = -100.0
        
    // MARK: Computed properties

    var body: some View {
        
        NavigationView {
            
            ZStack {
                Circle()
                    .foregroundColor(hue)
                    .frame(width: 100, height: 100)
                    .scaleEffect(scaleFactor)
                    .offset(x:offsetx, y:offsety)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true))
                    .onTapGesture {
                        // Move the circle to the right
                        
                        scaleFactor = 1
                        // Change the color of the view to a random hue
                        hue = Color(hue:Double.random(in: 1...360)  / 360.0, saturation: 0.8, brightness: 0.8)
                        offsetx = 100.0
                        offsety = 100.0
                    }
            }
            
            ZStack {
                
                Circle()
                    .foregroundColor(hue)
                    .frame(width: 100, height: 100)
                    .scaleEffect(scaleFactor)
                    .offset(x: 100, y: 100)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true))
                    .onTapGesture {
                        // Move the circle to the right
                        scaleFactor = 1
                        hue = Color(hue:Double.random(in: 1...360) / 360.0,
                                    saturation: 0.8, brightness: 0.8)
                        offsetx = -100.0
                        offsety = -100.0
                        
                    }
            }
            .navigationTitle("Exercise 2")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }

        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTwoView(showThisView: .constant(true))
    }
}
