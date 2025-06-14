//
//  TheraphistToneView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 22.04.2025.
//

import Foundation
import SwiftUI


struct TheraphistToneView : View {
    var body: some View {
        JournalPageLayoutInVStack(padding: 0) {
            TheraphistToneContent()
        }
    }
}


struct TheraphistToneContent : View {
    var body: some View {
        VStack {
            Text("Select Theraphist Tone")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
                .foregroundColor(.white)
            Text("Choose the voice that speaks to you.")
                .font(Font.light(size: 15))
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top, 2)
                        
            TheraphistToneSection().padding(.top,0)
            VoiceTypeSelector()
        }
    }
}


struct TheraphistToneSection: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(spacing: 10) {
            LazyVGrid(columns: columns, spacing: 10) {
                VoiceToneCard(
                    title: "Calm & Reassuring",
                    subtitle: "Ideal for anxiety or overwhelm",
                    tags: [
                        TagData(label: "Soft", color: Color(hex: "#E4A5A2")),
                        TagData(label: "Steady", color: Color(hex: "#B3CEE2")),
                    ],
                    emoji: "🧘"
                ).fixedSize(horizontal: false, vertical: true)
                
                VoiceToneCard(
                    title: "Direct & Empowering",
                    subtitle: "Problem-solving and action",
                    tags: [
                        TagData(label: "Clear", color: Color(hex: "#B2D89A")),
                        TagData(label: "Focused", color: Color(hex: "#7833A3"))
                    ],
                    emoji: "🎯"
                ).fixedSize(horizontal: false, vertical: true)
                
                VoiceToneCard(
                    title: "Warm & Nurturing",
                    subtitle: "For reflection and healing",
                    tags: [
                        TagData(label: "Support", color: Color(hex: "#E45645")),
                        TagData(label: "Gently", color: Color(hex: "#C0E69B")),
                    ],
                    emoji: "🫶"
                ).fixedSize(horizontal: false, vertical: true)
                
                VoiceToneCard(
                    title: "Thoughtful & Neutral",
                    subtitle: "Lets you guide the tone",
                    tags: [
                        TagData(label: "Curious", color: Color(hex: "#E2C05C")),
                        TagData(label: "Open", color: Color(hex: "#A8A2D4")),
                    ],
                    emoji: "🧠",
                    selected: true
                ).fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
    }
}


struct VoiceToneCard: View {
    var title: String
    var subtitle: String
    var tags: [TagData]
    var emoji: String
    var selected : Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Title and Subtitle
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(Font.semiBold(size: 16))
                    .foregroundColor(.white)

                Text(subtitle)
                    .font(Font.light(size: 13))
                    .foregroundColor(.white.opacity(0.8))
            }

            // Tags
            WrapTagView(tags: tags)

            Spacer(minLength: 10) // 👈 Add spacing between tags and footer

            
            // Footer Row
            HStack {
                Text(emoji)
                    .font(.system(size: 24))
                    .padding(6)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)

                Spacer()

                Image(systemName: "play.fill")
                    .foregroundColor(Color.backgroundPrimary)
                    .padding(10)
                    .background(Circle().fill(Color.white.opacity(0.9)))
            }
        }
        .padding()
        .background(selected ? Color.secondary_2 : Color.backgroundPrimary)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
    }
}

struct TagData: Identifiable {
    let id = UUID()
    let label: String
    let color: Color
}

struct WrapTagView: View {
    let tags: [TagData]

    var body: some View {
        HStack {
            FlexibleView(
                data: tags,
                spacing: 8,
                alignment: .leading
            ) { tag in
                Text(tag.label)
                    .font(.regular(size: 13))
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(tag.color)
                    .cornerRadius(12)
            }
        }
    }
}


struct VoiceTypeSelector: View {
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Choose the sound that makes you feel safe.")
                             .font(.system(size: 16, weight: .light, design: .default).italic())
                             .foregroundColor(.white.opacity(0.7))
    
            // Choice Buttons
            HStack(spacing: 16) {
                VoiceOptionButton(label: "female", closed: true)
                VoiceOptionButton(label: "male")
                VoiceOptionButton(label: "no preference")
            }
Spacer()
            // Not sure? text
            Text("Not sure?")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white.opacity(0.8))

            // AI Match Button

            ButtonShadow(text: "Let SerenAI match a tone for me", fontSize: 18, height: 48)
                .padding(.horizontal, 16)
        }
        .padding()
    }
}


struct VoiceOptionButton: View {
    var label: String
    var closed : Bool = false

    var body: some View {
        Button(action: {
            // Handle selection
        }) {
            Text(label)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 24)
                .background(!closed ? Color.clear : Color.secondary_2)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.white.opacity(0.8), lineWidth: 1.5)
                )
        }
    }
}
