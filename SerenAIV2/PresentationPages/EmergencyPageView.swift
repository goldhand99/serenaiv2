//
//  EmergencyPageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 09.04.2025.
//

import Foundation
import SwiftUI

struct EmergencyPageView : View {
    
    var body: some View {
        PresentationPageLayout(
            title: "Stay Grounded – Your Emergency Support",
            subtitle: "When emotions feel overwhelming, SerenAI provides immediate grounding techniques and support to help you regain control.",
            currentPage: 0,
            totalPages: 4
        ) {
            VStack(spacing: 24) {
                // Emotional Support Button (styled capsule)
            
                ButtonShadow(text: "Emotional Support",fontSize: 14,height: 30).padding(.horizontal,120)
                
                // Bullet points
                VStack(alignment: .leading, spacing: 18) {
                    BulletPoint(
                        title: "🫁 Deep Breathing",
                        description: "Take slow, deep breaths to relax your body and calm your mind."
                    )
                    
                    BulletPoint(
                        title: "👐 Sensory Grounding",
                        description: "Place your hands on a solid surface, feel its texture, and focus on the present moment. Engaging your senses helps bring stability."
                    )
                    
                    BulletPoint(
                        title: "💬 Positive Affirmations",
                        description: "Speak to yourself with kindness. Repeat soothing phrases like, \"I am safe. I am in control. This moment will pass.\""
                    )
                    
                    BulletPoint(
                        title: "📞 Immediate Support",
                        description: "Need extra help? Call an emergency support line based on your membership plan for direct assistance."
                    )
                }
                .padding(.horizontal, 24)
                .padding(.top,30)
            }
            .padding(.top, 20)
        }
    }
    
}



