//
//  HomePageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 04.04.2025.
//

import Foundation
import SwiftUI

struct HomePageView: View {
    
    @EnvironmentObject var nav: AppNavigationController

    
    
    var body: some View {
        ZStack {
            
            Color.backgroundPrimary
                .ignoresSafeArea()

            VStack() {
                
                Logo(size: 135, textSize: 30, circleGrid: false).padding(.top,110)

                IntroText()
                    .padding(.horizontal, 32)
                    .padding(.top,60)
                
                Spacer()
                
                VStack(spacing:25) {
                    
                    ButtonShadowClosure(text: "Start SerenAI", fontSize: 18,height:50, action: {
                        nav.goToNext(from: .homepage)
                    }) .padding(.horizontal, 32)
                    
                    SubButtonText(text: "Already have an account?", focusedText: "Continue").padding(.bottom,5)
                }
                
            }
        }
    }
}
    




struct Logo : View {
    let size: CGFloat
    let textSize : CGFloat
    let centerColor = Color.secondLogoCircle
    let circleGrid : Bool
    
    var lineWidth: CGFloat {
          circleGrid ? 40 : 20
      }

      var sizeStroke: CGFloat {
          circleGrid ? 20 : 10
      }

      var blurRadius: CGFloat {
          circleGrid ? 20 : 15
      }
    
    var body : some View {
        ZStack {
            if circleGrid {
                CircleGrid()
            }
            
            // Glowing stroke
            Circle()
                .stroke(Color.white.opacity(1), lineWidth: lineWidth) // Simulates "spread"
                .frame(width: size + sizeStroke , height: size + sizeStroke )
                .blur(radius: blurRadius)
            
            // Center logo circle
            Circle()
                .fill(centerColor.opacity(0.8))
                .frame(width: size, height: size)
                
            
            // Logo text
            Text("SerenAI")
                .foregroundColor(.white)
                .font(.custom(Font.font_regular, size: textSize))
        }
    }
}

struct ButtonShadowClosure : View {
var text: String
var fontSize: CGFloat
var height: CGFloat
var action: (() -> Void)? = nil  // Optional closure

var body: some View {
    Button(action: {
        action?()  // Only called if non-nil
    }) {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.secondary_2)
                .frame(height: height)
                .blur(radius: 2)
                .shadow(color: .white.opacity(0.25), radius: 4, x: 0, y: 6)

            Text(text)
                .foregroundColor(.white)
                .font(.custom(Font.font_regular, size: fontSize).weight(.medium))
        }
    }
    .buttonStyle(PlainButtonStyle())
}
}





struct ButtonShadow : View {
    var text : String
    var fontSize : CGFloat
    var height : CGFloat
    
    var body : some View {
        
        ZStack {
            
            //                   // Main button background
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.secondary_2) //
                .frame(height: height).blur(radius: 2)
                .shadow(color: .white.opacity(0.25), radius: 4,x:0,y:6)
            
            Text(text)
                .foregroundColor(.white)
                .font(.custom(Font.font_regular, size: fontSize).weight(.medium))
        }
            
    }
}


struct ButtonShadowUnpadded: View {
    var text: String
    var fontSize: CGFloat
    var height: CGFloat

    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.custom(Font.font_regular, size: fontSize).weight(.medium))
            .frame(height: height)
            .padding(.horizontal,40)
            .background(
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(Color.secondary_2)
                    .blur(radius: 2)
                    .shadow(color: .white.opacity(0.25), radius: 4, x: 0, y: 6)
            )
    }
}



struct IntroText : View {
    var body : some View {
        VStack(spacing: 8) {
        
            Text("Welcome to SerenAI")
                .foregroundColor(.white)
                .font(.custom(Font.font_regular, size: 28).weight(.semibold))
            
            Text("Serenity is not freedom from the storm,\nbut peace amid the storm")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .font(.custom(Font.font_regular, size: 18))
        }
        
    }
}



struct SubButtonText : View {
    
    var text : String
    var focusedText : String
    var font: Font = Font.regular(size: 14)
    
    var body : some View {
     
        HStack(spacing: 4) {
            
            Text(text)
                .foregroundColor(.white)
                .font(font)
            

            Text(focusedText)
                .foregroundColor(Color.accent) // Darker, like the screenshot
                .font(.custom(Font.font_regular, size: 14))
            
        }
    }
}



struct CircleGrid: View {
    let circleColor = Color.logoPetal
    let size: CGFloat = 125

    var body: some View {
        VStack(spacing: -45) {
            ForEach(0..<3) { row in
                HStack(spacing: -45) {
                    ForEach(0..<3) { col in
                        Circle()
                            .fill(circleColor)
                            .frame(width: size, height: size)
                    }
                }
            }
        }
    }
}

