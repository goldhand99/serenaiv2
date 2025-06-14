//
//  EntryFeedPageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 16.04.2025.
//

import Foundation
import SwiftUI


struct EntryFeedPageView : View {
    
    var body : some View {
        ZStack() {
            Color.backgroundPrimary.ignoresSafeArea()
            
            
            ZStack{

                
                VStack() {
                    //Where should i add here th ebutton to look the same
                    Logo(size: 100, textSize: 18, circleGrid: false)
                        .padding(.top, 20)
                    MoodCardView().padding(.top,160)
                    Spacer()
                }
                
                ButtonShadowSupportLayout()
            }
            
        }
        
    }
}



struct ButtonShadowSupportLayout : View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Spacer()
                VStack{
                    ButtonShadowSupport(text: "Emotional Support", fontSize: 14, height: 28)
                    Spacer()
                }.padding(.trailing,15).padding(.top,15)
            }
            Spacer()
        }
    }
}
            
            


struct ButtonShadowSupport : View {
    
    var text : String
    var fontSize : CGFloat
    var height : CGFloat
    var color : Color = Color.secondary_2
    
    var body : some View {
        
        ZStack {
            // Main button background
            RoundedRectangle(cornerRadius: 40)
                .fill(color) //
                .frame(height: height).blur(radius: 2)
                .shadow(color: .white.opacity(0.25), radius: 4,x:0,y:6)
            
            Text(text)
                .foregroundColor(.white)
                .font(.custom(Font.font_regular, size: fontSize).weight(.medium))
                .padding(.horizontal,20)
        }.fixedSize()
    }
    
}

struct ButtonShadowBackChevron: View {
    var size: CGFloat = 35 // default size

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.secondary_2)
                .frame(width: size, height: size)
                .blur(radius: 2)
                .shadow(color: .white.opacity(0.25), radius: 4, x: 0, y: 6)

            Image(systemName: "chevron.left")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.white)
        }
    }
}

struct MoodCardView: View {
    @State private var selectedMood: String = "😄"

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            MoodCardDateView()
            MoodCardTitleView()
            MoodSelectorView(selectedMood: $selectedMood)
            MoodCardNextButton()
        }
        .padding(20)
        .background(Color.secondary_2)
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}


struct MoodCardDateView: View {
    var body: some View {
        Text("1 October 2024")
            .font(Font.regular(size: 12))
            .foregroundColor(.white)
    }
}

struct MoodCardTitleView: View {
    var body: some View {
        Text("How are you feeling today?")
            .font(Font.light(size: 24))
            .foregroundColor(.white)
    }
}

struct MoodSelectorView: View {
    @Binding var selectedMood: String
    
    var body: some View {
        HStack {
            Spacer()

            Text("Today’s mood")
                .font(Font.medium(size: 16))
                .foregroundColor(.white)
            
            HStack(spacing: 8) {
                Text(selectedMood)
                    .font(.system(size: 30))
                Image(systemName: "chevron.down")
                    .font(.system(size: 14))
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 14)
            .background(Color.secondaryApp)
            .cornerRadius(14)
            Spacer()
         }
    }
}

struct MoodCardNextButton: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                // Navigate to next step
            }) {
                Circle()
                    .strokeBorder(Color.white, lineWidth: 1.5)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                    )
            }
        }
    }
}






