//
//  PresentationPageLayout.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 09.04.2025.
//

import Foundation
import SwiftUI

struct PresentationPageLayout<Content: View>: View {
    
     let title: String
     let subtitle: String
     let content: () -> Content
     let currentPage: Int
     let totalPages: Int

     init(
         title: String,
         subtitle: String,
         currentPage: Int,
         totalPages: Int,
         @ViewBuilder content: @escaping () -> Content
     ) {
         self.title = title
         self.subtitle = subtitle
         self.currentPage = currentPage
         self.totalPages = totalPages
         self.content = content
     }
    
    
    var body: some View {
        ZStack {
            // Background color
            Color.backgroundPrimary
                .ignoresSafeArea()
            
            // Gradient lines pinned to bottom
            VStack {
                Spacer()
                GradientLines()
            }
            .ignoresSafeArea(edges: .bottom)
            
            // Main content
            VStack {
                // Logo at top
                Logo(size: 100, textSize: 18, circleGrid: false)
                .padding(.top, 20) // Distance from top
                
                Spacer()
                
                // "Next" button in the middle between logo and bottom
               NextButton()
                
                Spacer()
            }
            .padding(.bottom, 80) // Control vertical positioning better
            // 🔥 HeaderSection overlaid, does not affect layout flow
            VStack {
                
                Spacer().frame(height: 175) // Adjust this to position the header correctly under the logo
                HeaderSection(
                    title: title,
                    subtitle: subtitle
                )
                .padding(.horizontal, 32)
                
                content()
                
                Spacer()
            }
            
            // ✅ Page Indicator (overlayed above GradientLines, but below main content)
            VStack {
                Spacer()
                PageIndicator(currentPage: currentPage, totalPages: totalPages)
                    .padding(.bottom, 5) // Adjust this to float above the gradient lines
            }
            
            
        }
    }
}





struct HeaderSection: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment:.leading,spacing: 30) {
            Text(title)
                .foregroundColor(.white)
                .font(.custom(Font.font_regular, size: 28).weight(.semibold))
                .multilineTextAlignment(.leading)

            Text(subtitle)
                .foregroundColor(.white.opacity(1))
                .font(.custom(Font.font_regular, size: 18).weight(.regular))                .multilineTextAlignment(.leading)
        }
    }
}


struct NextButton : View {
    var body : some View {
        HStack {
            Spacer()
            Text("Next")
                .foregroundColor(.white)
                .font(.custom("Inter-Regular", size: 16))
                .padding(.trailing, 32)
        }
    }
}




struct LogoSmall : View {
    
    var body : some View {
        ZStack {
            Circle()
                .fill(Color.logoSmallColour.opacity(0.8))
                .frame(width: 100, height: 100)
                .shadow(color: .white.opacity(0.5), radius: 30)
            
            Text("SerenAI")
                .foregroundColor(.white)
                .font(.custom("Inter-Regular", size: 18))
        }.padding(.top,10)
    }
    
}




//make me multiple lines like this so i can use them
struct GradientLines : View {
    
    let lineCount: Int = 13
    let minHeight: CGFloat = 100
    let maxHeight: CGFloat = 300
    let lineWidth: CGFloat = 8
    let spacing: CGFloat = 10
    
    var body: some View {
        HStack(alignment: .bottom, spacing: spacing) {
            ForEach(0..<lineCount, id: \.self) { _ in
                GradientBlurredLine(height: CGFloat.random(in: minHeight...maxHeight))
            }
        }
    }
    
}






struct GradientBlurredLine: View {
    var height : CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 1)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(1),
                        Color.white.opacity(0.4),
                        Color.white.opacity(0.2)

                    ]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .frame(width: 20, height: height)
            .blur(radius: 3)
    }
}


struct PageIndicator: View {
    let currentPage: Int
    let totalPages: Int

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<totalPages, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.white : Color.white.opacity(0.3))
                    .frame(width: index == currentPage ? 10 : 8, height: index == currentPage ? 10 : 8)
                    .animation(.easeInOut(duration: 0.2), value: currentPage)
            }
        }
    }
}
