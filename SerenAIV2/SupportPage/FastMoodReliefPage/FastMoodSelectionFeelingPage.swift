//
//  FastMoodSelectionFeelingPage.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 29.04.2025.
//
import Foundation
import SwiftUI



struct FastMoodSelectionFeelingPage : View {
    
    var body: some View {
        SupportPageLayoutInVStack(padding: 0) {
            Spacer()
            FastMoodSelectionFeelingContent()
            Spacer()
        }
    }
    
}



struct FastMoodSelectionFeelingContent : View {
    var body: some View {
        VStack() {
            FeelingContainer()
            FeelingContainerSecond().padding(.top,0)
            ButtonContinue()
                .padding()
        }.background(Color.accent)
            .cornerRadius(30)
            .padding()
    }
}










struct FeelingContainer: View {
    
    @State private var selectedMood: String? = nil
    var tags: [TagString] = [
        TagString(title: "Panicked"),
        TagString(title: "Restless"),
        TagString(title: "Worried"),
        TagString(title: "Followed"),
        TagString(title: "Can't focus"),
        TagString(title: "Sad"),
        TagString(title: "Depressed")
    ]
    
    
    
    var textHeader = "What feelings of anxiety are you feeling:"
    var selectedBackgroundColor = Color.backgroundPrimary
    var unselectedBackgroundColor = Color.white.opacity(0.29)
    var borderColor: Color = Color.white.opacity(0.8)
    
    var footer : String? = "Your emotions aren't wrong - they're messages trying to be heard."

    var body: some View {
        
        
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
                    .foregroundColor(Color.opacedColor) // fixed typo here
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}




struct FeelingContainerSecond: View {
    
    @State private var selectedMood: String? = nil

    var tags : [TagString] = [
        TagString(title: "Public breakdown"),
        TagString(title: "Continous work"),
        TagString(title: "Work deadlines"),
        TagString(title: "Feeling watched"),
        TagString(title: "Looking fat"),
        TagString(title: "Anna not answering"),
    ]
    
    
    
    var textHeader = "Can you recognize any of this triggers:"
    var selectedBackgroundColor = Color.accent
    var unselectedBackgroundColor = Color.white.opacity(0.29)
    var borderColor: Color = Color.white.opacity(0.8)
    
    var footer : String? = "Stay with us, is just a moment, not a lifetime."

    var body: some View {
        
        
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
                    .foregroundColor(Color.opacedColor) // fixed typo here
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}





struct ButtonContinue : View {
    var body: some View {
        Text("Continue")
            .foregroundColor(.white)
            .font(.custom(Font.font_regular, size: 20).weight(.medium))
            .padding(.vertical,10)
            .padding(.horizontal,50)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.secondary_2)
                    .shadow(color: .black.opacity(0.45), radius: 4, x: 0, y: 6)
            )
    }
}

