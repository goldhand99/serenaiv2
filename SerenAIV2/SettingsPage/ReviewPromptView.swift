//
//  ReviewPromptView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 21.04.2025.
//

import Foundation
import SwiftUI

struct ReviewPromptSection: View {
    var body: some View {
        VStack(spacing: 5) {
            // Title
            Text("Share your voice publicly too")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            // Stars
            HStack(spacing: 12) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.white.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

            // Message text
            VStack(spacing: 4) {
                Text("As a thank you for your review,")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Text("Enjoy a free month of Serenity.")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
//            Spacer()
            Text("No matter the rating, your truth matters")
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
            // CTA Button
            ButtonShadowUnpadded(text: "Leave us a review", fontSize: 18, height: 48)
        }
    }
}
