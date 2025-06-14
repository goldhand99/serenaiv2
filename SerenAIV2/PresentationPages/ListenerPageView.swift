//
//  ListenerPageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 04.04.2025.
//

import Foundation
import SwiftUI



struct ListenerPageView : View {
    
    var title : String = "Talk, Share, Heal—Your AI Listener is Here."
    var subtitle : String = "Whatever’s on your mind, SerenAI is here to listen. Whether you need support with stress, relationships, or just a space to reflect, SerenAI adapts to you."
    var currentPage = 0
    var totalPages = 4
    
    var body : some View {
        PresentationPageLayout(
            title: title,
            subtitle: subtitle,
            currentPage: currentPage,
            totalPages: totalPages
        ) {
            VStack(spacing: 0) {
                Text("It’s okay to rest. You’re doing your best, and that’s enough.Tell me more.")
                    .foregroundColor(.white)
                    .font(Font.light(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,40)
                    .padding(.top,40)
                
                Spacer()
                
            // Control buttons
                HStack(spacing: 5) {
                    SmallCircleButton(systemIcon: "ellipsis.message").padding(.top,75)
                    
                    VStack(spacing: 30) {
                        LargeCircleButton(systemIcon: "square")
                        Text("05:00")
                            .foregroundColor(.white)
                            .font(.custom(Font.font_regular, size: 14))
                    }
                    
                    SmallCircleButton(systemIcon: "gearshape").padding(.top,75)
                }.padding(.bottom,10)

                
                 
            }.padding(.top,100)
        }
    }
}



struct SmallCircleButton: View {
    let systemIcon: String
    var size : CGFloat  = 70
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: size, height: size)
                .shadow(radius: 3)
            
            Image(systemName: systemIcon)
                .foregroundColor(Color.secondary_2)
                .font(.system(size: 20, weight: .medium))
        }
    }
}

struct LargeCircleButton: View {
    let systemIcon: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 90, height: 90)
                .shadow(radius: 4)
            
          RoundedSquareRadioButton()
        }
    }
}



struct RoundedSquareRadioButton: View {
    var strokeColor: Color = Color(hex:"#B3342F")
    var lineWidth: CGFloat = 2
    var size: CGFloat = 30
    var cornerRadius: CGFloat = 10

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .stroke(strokeColor, lineWidth: lineWidth)
            .frame(width: size, height: size)
    }
}

    
    
    
