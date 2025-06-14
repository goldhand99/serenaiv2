//
//  JournalPageSelectionView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 19.04.2025.
//

import Foundation
import SwiftUI

struct JournalPageMoodSelectionView : View {
    
    var body: some View {
        JournalPageLayout(padding: 0) {
            VStack {
                          Spacer()
                          JournalModeCard()
                          Spacer()
            }
        }
    }
    
}


import SwiftUI

struct JournalModeCard: View {
    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("How would you like to\njournal today?")
                .font(Font.regular(size: 20))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            // Selection buttons
            HStack(spacing: 30) {
                JournalModeButton(icon: "pencil.and.scribble", label: "Write", isFilled: false)
                JournalModeButton(icon: "mic", label: "Talk", isFilled: true)
            }

            // Arrow navigation button
            HStack {
                Spacer()
                ArrowCircleButton()
            }
        }
        .padding()
        .background(Color.secondary_2)
        .cornerRadius(24)
        .padding(.horizontal, 20)
    }
}

struct JournalModeButton: View {
    let icon: String
    let label: String
    let isFilled: Bool

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .strokeBorder(Color.white, lineWidth: isFilled ? 0 : 1.5)
                    .background(isFilled ? Circle().fill(Color.white) : nil)
                    .frame(width: 100, height: 100)

                Image(systemName: icon)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(isFilled ? Color.backgroundPrimary : .white)
            }

            Text(label)
                .font(Font.regular(size: 14))
                .foregroundColor(.white)
        }
    }
}


struct ArrowCircleButton: View {
    var body: some View {
        Button(action: {
            // Handle forward action
        }) {
            Circle()
                .strokeBorder(Color.white, lineWidth: 1.5)
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                )
        }
    }
}
