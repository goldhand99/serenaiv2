//
//  JournalPageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 09.04.2025.
//

import Foundation
import SwiftUI



struct JournalPageView : View {
    
    var title : String = "Reflect & Express – Your Safe Space to Journal"
    var subtitle : String = "Your thoughts matter. With SerenAI’s Smart Journal, you can express your emotions freely while AI deciphers patterns to help you gain clarity and prevent emotional struggles."
    var currentPage = 0
    var totalPages = 4
    
    
    var body : some View {
        PresentationPageLayout(
            title:title,
            subtitle: subtitle,
            currentPage: 1,
            totalPages: 4
        ) {
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                
                HeaderTextBulletPoint()
               
                BulletPoint(title: "Writea your thoughts & feelings –",description: "Journaling helps clear your mind.")
                BulletPoint(title: "AI analyzes emotions –", description: "SerenAI detects emotional patterns in your writing.")
                BulletPoint(title:  "Receive insights & guidance –",
                            description:"Get personalized suggestions to improve your mental well-being.")

                Spacer()

            }
            .padding(.horizontal, 24)
            
        }
    }
    
}


struct HeaderTextBulletPoint : View {
    
    var body : some View {
        Text("How smart journaling works:")
            .font(Font.light(size: 28))
            .foregroundColor(.white)
            .padding(.top, 20)
            .overlay(
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundColor(.white.opacity(0.9)),
                alignment: .bottom
            )
    }
    
}

struct BulletPoint: View {
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .fill(Color.white)
                .frame(width: 6, height: 6)
                .padding(.top, 6)
            
            (
                Text(title)
                    .font(Font.medium(size: 14)) +
                Text("  \(description)")
                    .font(Font.light(size: 14))
            )
            .foregroundColor(.white)
        }
    }
    
}







