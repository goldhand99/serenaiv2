//
//  FastMoodReliefRecordPage.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 29.04.2025.
//

import Foundation
import SwiftUI



struct FastMoodReliefRecordPage : View {
    var body: some View {
        SupportPageLayoutInVStack(padding: 0) {
            FastMoodReliefRecordContent().padding(.top)
            Spacer()
        }
    }
}


struct FastMoodReliefRecordContent: View {
    var body: some View {
        VStack(spacing: 24) {
            
            // Top title
            Text("Say it out lod - just for you.")
                .font(Font.semiBold(size: 15))
                .foregroundColor(Color.white.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 35)
            
            // Mic button and caption centered
            VStack(spacing: 8) {
                SmallCircleButton(systemIcon: "mic",size:100)
                Text("Tap to say it out loud")
                    .font(Font.regular(size: 12))
                    .foregroundColor(Color.white.opacity(0.8))
            }
            .frame(maxWidth: .infinity)
            
            // Text field section aligned leading
            TextFieldFastRelief()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 2)
            
            // Explanation text block
            Text("""
            You’re feeling Anxious.
            That’s okay. It’s your brain trying to protect you.✨
            Why?
            This normalizes the emotion,
            reduces shame, and engages metacognition (naming the emotion creates distance).
            """)
            .font(Font.light(size: 15))
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top)
            
            Spacer(minLength: 12)
            
            // Bottom message and button centered
            VStack(spacing: 12) {
                Text("Stay with us, is just a moment not a lifetime")
                    .font(.system(size: 12))
                    .italic(true)
                    .foregroundColor(Color.opacedColor)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                
                ButtonContinue()
            }
        }
        .padding()
        .background(Color.accent)
        .cornerRadius(30)
        .padding(.horizontal,20)
    }
}






struct TextFieldFastRelief : View {
    @State private var title: String = ""

    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Text("Now write it down-just one word or phrase")
                .font(Font.semiBold(size: 15))
                .foregroundColor(Color.white.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .center)
            
            TextField("Briefly describe the issue", text: $title)
                .font(Font.light(size: 13))
                .foregroundColor(.white)
                .padding(.bottom, 4)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white),
                    alignment: .bottom
                ).padding(.horizontal,10)
                .padding(.top)
        }.padding(.top,20)
    }
}
