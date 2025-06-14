//
//  DeepBreathingStartPage.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 28.04.2025.
//

import Foundation
import SwiftUI


struct DeepBreathingStartPage : View {
    var body: some View {
        SupportPageLayoutInVStack(padding: 0) {
            DeepBreathingContent()
        }
    }
}

struct DeepBreathingContent : View {
    var body: some View {
        VStack() {
            Text("Deep breathing")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
                .foregroundColor(.white)
            Text("Use your breath to help calm body and mind")
                .font(Font.light(size: 15))
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top, 5)
            DeepBreathingSection().padding(.top)
        }
    }
}



struct DeepBreathingSection : View  {
    var body : some View {
        
        VStack(spacing:20){
            CircleStart()
            SelectionContainer()
            SelectionContainer(tags:[ TagString(title: "Relax & ground"),
                                      TagString(title: "Clear & Calm"),
                                      TagString(title: "Energize & Focus")],textHeader: "Choose your breath effect",selectedBackgroundColor: Color.backgroundPrimary, backgroundColor: Color.accent,footer: "Different breath rhythms activate different brain states. Choose what your body needs most right now.")
        }
        
    }
}


struct CircleStart : View {
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.white.opacity(0.7), lineWidth: 2)
            
            Text("Start")
                .foregroundColor(.white)
                .font(Font.bold(size: 20))
        }
    }
}


struct SelectionContainer: View {
    
    @State private var selectedMood: String? = nil
    var tags: [TagString] = [
        TagString(title: "Sad"),
        TagString(title: "Anxious"),
        TagString(title: "Stressed"),
        TagString(title: "Overwhelmed"),
        TagString(title: "Feeling Low")
    ]
    
    var textHeader = "How are you feeling today?"
    var selectedBackgroundColor = Color.accent
    var unselectedBackgroundColor = Color.white.opacity(0.29)
    var borderColor: Color = Color.white.opacity(0.8)
    var backgroundColor = Color.secondary_2
    var footer : String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // Left-aligned header
            Text(textHeader)
                .font(Font.semiBold(size: 15))
                .foregroundColor(Color.white.opacity(0.8)) // fixed typo here
                .padding(.top, 16)
                .padding(.leading, 20)
            

            FlexibleView(data: tags, spacing: 10) { tag in
                Button(action: {
                    selectedMood = tag.title
                }) {
                    Text(tag.title)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(selectedMood == tag.title ? selectedBackgroundColor : unselectedBackgroundColor)
                        )
                        .overlay(
                            Capsule()
                                .stroke(borderColor, lineWidth: 1.2)
                        )
                }
            }.padding()
            
            
            if (footer != nil) {
                Text(footer!)
                    .font(Font.light(size: 12))
                    .italic()
                    .foregroundColor(Color.white) // fixed typo here
                    .padding(.horizontal)
                    .padding(.bottom)
            }

        }
        .background(backgroundColor)
        .cornerRadius(20)
        .padding(.horizontal)
        .fixedSize(horizontal: false, vertical: true)
    }
}







