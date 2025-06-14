//
//  DeepBreathingSummary.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 28.04.2025.
//

import Foundation
import SwiftUI


struct DeepBreathingSummary : View {
    var body: some View {
        
        SupportPageLayoutInVStack(padding: 0){
            DeepBreathingSummaryContent()
        }
        
    }
}


struct DeepBreathingSummaryContent : View {
        var body: some View {
        SummaryMoodCardView().padding(.top,160)
        Spacer()
    }
}


struct SummaryMoodCardView: View {

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            SummaryMoodCardHeaderView()
            SummaryMoodCardTitleView()
            HStack {
                Spacer()
                EmojiWrapper()
                Spacer()
            }
            SummaryMoodCardNextButton()
        }
        .padding(20)
        .background(Color.secondary_2)
        .cornerRadius(20)
        .padding(.horizontal, 20)
        .fixedSize(horizontal: false, vertical: false)
    }
}




struct SummaryMoodCardHeaderView: View {
    var body: some View {
        Text("1 October 2024")
            .font(Font.regular(size: 12))
            .foregroundColor(.white)
    }
}


    //Why this is not showed?
struct SummaryMoodCardTitleView: View {
    var body: some View {
        Text("How do you feel after your breathing?")
            .font(Font.light(size: 24))
            .foregroundColor(.white)
            .fixedSize(horizontal: false, vertical: true)
    }
}
struct EmojiWrapper: View {
    
    @State private var selectedMood: String = ""
    
    let tags = [
        TagString(title: "😌"),
        TagString(title: "😊"),
        TagString(title: "😐")
    ]
    
    var selectedBackgroundColor = Color.secondary_2
    var unselectedBackgroundColor = Color.white.opacity(0.3)
    
    var body: some View {
        HStack(spacing: 12) { // Added spacing between buttons
            ForEach(tags, id: \.id) { tag in // Loop through each emoji
                Button(action: {
                    selectedMood = tag.title
                }) {
                    Text(tag.title)
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(
                            Capsule()
                                .fill(selectedMood == tag.title ? selectedBackgroundColor : unselectedBackgroundColor)
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(0.8), lineWidth: 1.2)
                        )
                }
            }
        }
    }
}


struct SummaryMoodCardNextButton: View {
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














