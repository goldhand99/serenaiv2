//
//  DeepBreathingAnimation.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 28.04.2025.
//

import Foundation
import SwiftUI


struct DeepBreathingAnimationPage : View {
    var body: some View {
        SupportPageLayoutInVStack(padding: 0) {
            DeepBreathingAnimationContent()
        }
    }
}

struct DeepBreathingAnimationContent : View {
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
                .padding(.top, 10)
            DeepBreathingPhaseView().padding(.top)
        }
    }
}



struct DeepBreathingPhaseView: View {
    
    enum Phase {
        case inhale
        case hold
        case exhale
    }
    
    @State private var phase: Phase = .inhale
    @State private var circleSize: CGFloat = 150
    
    @State private var dynamicFontSize: CGFloat  = 24

    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            ZStack {
                Circle()
                    .strokeBorder(Color.white.opacity(0.8), lineWidth: 3)
                    .frame(width: circleSize, height: circleSize)
                    .animation(.easeInOut(duration: 4), value: circleSize)
                
                Text(phaseText)
                    .font(Font.semiBold(size: dynamicFontSize))
                    .foregroundColor(.white)

            }.frame(width: 280, height: 280) // 👈 FIXED frame size

            
            Text(phaseSubtitle)
                .font(Font.light(size: 28))
                .italic()
                .foregroundColor(.white.opacity(0.8))
                .padding(.top, 10)
            
            Spacer()
            
            BreathingProgressRing()
            Spacer()
        }
        .onAppear {
            startBreathingAnimation()
        }
        .padding(.horizontal, 30)
    }
    
    private var phaseText: String {
        switch phase {
        case .inhale: return "Breathe In"
        case .exhale: return "Breathe Out"
        case .hold: return "Hold"
        }
    }
    
    private var phaseSubtitle: String {
        switch phase {
        case .inhale: return "Invite calm"
        case .exhale: return "Let go"
        case .hold: return "You're safe"
        }
    }
    
    private func startBreathingAnimation() {
        switchToPhase(.inhale)
        
        Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { _ in
            withAnimation {
                switch phase {
                case .inhale:
                    switchToPhase(.hold)
                case .hold:
                    switchToPhase(.exhale)
                case .exhale:
                    switchToPhase(.inhale)
                }
            }
        }
    }
    
    private func switchToPhase(_ newPhase: Phase) {
        phase = newPhase
        
        switch newPhase {
        case .inhale:
            circleSize = 250 // Expand
        case .hold:
            // Keep size as it is (don't change)
            break
        case .exhale:
            circleSize = 150 // Contract
        }
    }
}


struct BreathingProgressRing: View {
    
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            
            // Background ring
            Circle()
                .stroke(Color.white.opacity(0.3), lineWidth: 2.5)
            
            // Animated progress ring
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .rotationEffect(.degrees(-90)) // Start from top
                .animation(.easeInOut(duration: 4), value: progress)
        }
        .frame(width: 30, height: 30)
        .onAppear {
            startProgress()
        }
    }
    
    private func startProgress() {
        progress = 0.0
        withAnimation(Animation.linear(duration: 4).repeatForever(autoreverses: false)) {
            progress = 1.0
        }
    }
}



