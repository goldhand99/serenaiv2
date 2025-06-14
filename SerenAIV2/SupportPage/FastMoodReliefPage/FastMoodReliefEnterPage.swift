//
//  FastMoodReliefEnterPage.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 29.04.2025.
//

import Foundation
import SwiftUI



struct FastMoodReliefEnterPage : View {
    
    var body: some View {
        
        SupportPageLayoutInVStack(padding: 0) {
            FastMoodReliefEnterPageContent()
        }
    }
}


struct FastMoodReliefEnterPageContent : View {
    var body: some View {
        VStack() {
            Text("Fast Mood Relief")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
                .foregroundColor(.white)
            
            Text("Remember that you are strong, and this too shall pass")
                .font(Font.light(size: 15))
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
                .foregroundColor(.white).padding(.top,5)
            
            FastMoodReliefEnterPageSection().padding(.top)
        }
    }
}

struct FastMoodReliefEnterPageSection : View {
    
    
    
    var body: some View {
        VStack(alignment: .center) {
        
            EmotionSelectorView()
            Divider().background(Color.white).padding(.horizontal,20)
            EmotionContainer().padding(.top)
            Spacer()
        }
    }
}



struct EmotionSelectorView: View {
    private let emotions = [
        ("Anxious", Color(hex:"#6F55DF")),
         ("Stressed", Color(hex:"#C668A5")),
         ("Sad", Color(hex:"#3C56F3")),
         ("Angry", Color(hex:"#D8765D"))
    ]
    @State var selectedButton : String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Tap the emotion that feels closest.\nWe'll help you through it.")
                .font(Font.medium(size: 14))
                .padding(.top, 0)
                .foregroundColor(.white)
                .fixedSize()
            
            
            Text("I feel:")
                .font(Font.semiBold(size: 15))
                .foregroundColor(Color.opacedColor)
                .padding(.leading,15)
            

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(emotions, id: \.0) { emotion, color in
                    EmotionButton(
                        title: emotion,
                        color: color,
                        isSelected: selectedButton == emotion
                    ) {
                        selectedButton = emotion
                    }
                }
            }
        }
        .padding(.horizontal,40)
        .padding()
    }
}

struct EmotionButton: View {
    let title: String
    let color: Color
    let isSelected: Bool
    let action : () -> Void
    
    @State private var isPressed: Bool = false

    
    var body: some View {
        Text(title)
            .font(Font.bold(size: 15))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 45)
            .background(!isSelected ? color.opacity(0.75) : color)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(isSelected ? Color.white : Color.clear, lineWidth: 2)
            )
        
        
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
            .scaleEffect(isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: isSelected)
            .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isPressed)
            .onTapGesture {
                isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPressed = false
                    action()
                }
            }
    }
    

}




struct EmotionContainer: View {
    
    @State private var selectedMood: String? = nil
    var tags: [TagString] = [
        TagString(title: "Sad"),
        TagString(title: "Anxious"),
        TagString(title: "Stressed"),
        TagString(title: "Overwhelmed"),
        TagString(title: "Feeling Low")
    ]
    
    var textHeader = "Today's moods:"
    var selectedBackgroundColor = Color.backgroundPrimary
    var unselectedBackgroundColor = Color.white.opacity(0.29)
    var borderColor: Color = Color.white.opacity(0.8)
    var backgroundColor = Color.secondary_2
    var footer : String? = "Every emotion has its message. Let's responsd with care, \n not pressure."
    
    var body: some View {
        VStack(){
            
            
            ZStack(alignment:.bottomTrailing) {
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    // Left-aligned header
                    Text(textHeader)
                        .font(Font.semiBold(size: 15))
                        .foregroundColor(Color.white.opacity(0.8)) // fixed typo here
                        .padding(.top, 35)
                        .padding(.leading, 20)
                    
                    
                    
                    FlexibleView(data: tags, spacing: 10) { tag in
                        Button(action: {
                            selectedMood = tag.title
                        }) {
                            Text(tag.title)
                                .font(Font.medium(size:15))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
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
                
                
                
                //This i want it at the top as it is
                FeelingShadow(text: "Start", fontSize: 16, height: 40)
                    .offset(y:20)
                    .padding(.trailing,40)
                
                
            }

        }
    }
}


struct FeelingShadow: View {
    var text: String
    var fontSize: CGFloat
    var height: CGFloat

    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.custom(Font.font_regular, size: fontSize).weight(.medium))
            .padding(.horizontal, 20)
            .frame(height: height)
            .background(
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(Color(hex:"#30BF50"))
                    .blur(radius: 2)
                    .shadow(color: .white.opacity(0.25), radius: 4, x: 0, y: 6)
            )
    }
}


