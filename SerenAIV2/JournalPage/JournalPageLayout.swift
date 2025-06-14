//
//  JournalPageLayout.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 19.04.2025.
//

import Foundation
import SwiftUI



struct JournalPageLayout<Content: View>: View {
    
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


struct JournalPageLayoutInVStack<Content: View>: View {
    
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
                
                VStack {
                    Logo(size: 100, textSize: 18, circleGrid: false)
                        .padding(.top, 20)
                    content().padding(.top,padding)
                    
                }
                ButtonShadowSupportLayoutWithBackButton()
            }
        }
    }
}
