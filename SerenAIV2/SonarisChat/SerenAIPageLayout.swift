//
//  SerenAIPageLayout.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 18.04.2025.
//

import Foundation
import SwiftUI


struct PresentationSerenAIUsageLayout<Content: View>: View {
    
    let padding : CGFloat
     let content: () -> Content

     init(
        padding: CGFloat,
         @ViewBuilder content: @escaping () -> Content
     ) {
         self.content = content
         self.padding = padding
     }
    
    
    var body : some View {
        ZStack() {
            Color.backgroundPrimary.ignoresSafeArea()
            
            ZStack{
                
                
                
                VStack {
                    Spacer()
                    GradientLines()
                }
                .ignoresSafeArea(edges: .bottom)
                
                ZStack {
                    content().padding(.top,padding)
                    VStack {
                        Logo(size: 100, textSize: 18, circleGrid: false)
                            .padding(.top, 20)
                        Spacer()
                    }
                    ButtonShadowSupportLayoutWithBackButton()
                }
            }
        }
    }
}




struct ButtonShadowSupportLayoutWithBackButton : View {
    
    var text = "Emotional Support"
    var color : Color = Color.secondary_2
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                VStack {
                    ButtonShadowBackChevron()
                    Spacer()
                }.padding(.leading,20)
                    .padding(.top,20)
                Spacer()
                VStack{
                    ButtonShadowSupport(text: "Emotional Support", fontSize: 14, height: 28, color: color)
                    Spacer()
                }.padding(.trailing,15).padding(.top,15)
            }
            Spacer()
        }
    }
}
       


