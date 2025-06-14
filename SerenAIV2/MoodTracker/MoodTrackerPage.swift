//
//  MoodTrackerPage.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 17.05.2025.
//

import Foundation
import SwiftUI




struct MoodTrackerPage : View {
    
    var backTarget : BackActionTarget = .global

    var body: some View {
        JournalPageLayoutInVStack(padding: 20,backTarget: backTarget) {
            MoodTrackerPageContent().ignoresSafeArea()
        }
    }
}
struct MoodTrackerPageContent: View {
    
    
    @State private var baseHeight: CGFloat = 0
    @State private var isExpanded = false
   
    
    

    var body: some View {
        GeometryReader { fullProxy in
            ZStack(alignment: .top) {
                
                
                VStack(spacing: 20) {
                    MoodCalendarView()
                    MoodChartViewFeedPage()
                }.frame(width: .infinity, height: .infinity)
                    .background(GeometryReader { geometry in
                        Color.backgroundPrimary.onAppear {
                            baseHeight = geometry.frame(in: .global).height + 20
                        }
                    })
                     

                MoodTrackerInsightsPage(isExpanded: $isExpanded)
                    .background(Color.secondary_2)
                    .cornerRadius(30)
                    .offset(y: isExpanded ? 0 : baseHeight)
                    .animation(.easeInOut(duration: 0.3), value: isExpanded)
            }
        }
        .ignoresSafeArea()
    }
}


// MARK: - Preference Key for Measuring Base Height
struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}




struct MoodTrackerInsightsPage: View {
    
    
    @Binding var isExpanded: Bool
    @StateObject private var viewModel = ChatViewModel()
    @State var selectedEmotionIndex : Int = 0
   

    var body: some View {
        VStack {
            HStack {
                Spacer()
                ChevronButton(isExpanded: isExpanded) {
                    isExpanded.toggle() // 👈 Toggle from inside
                }
                Spacer()
            }
            .padding(.top, 10)

            ScrollView {
                VStack(spacing: 15) {
                    MoodTrackerHeaderSection()
                    Divider().background(Color.white)
                    WhatHappenedView()
                    Divider().background(Color.white)
                    SupportSuggestionsView()
                    Spacer()
                }
                .padding(.top, 20)
            }
            .scrollIndicators(.hidden)
        }
        .background(Color.secondary_2.ignoresSafeArea())
        .clipShape(
            .rect(
                topLeadingRadius: 50,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 50
            )
        )
    }
}


struct ChevronButton: View {
    var isExpanded: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isExpanded ? "chevron.down" : "chevron.up")
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .medium))
                .padding(10)
                .background(Color.white.opacity(0.15))
                .clipShape(Circle())
        }
    }
}


struct SupportSuggestionsView: View {
    var body: some View {
        VStack(spacing: 32) {
            
            // First Section
            SectionView(
                title: "What Led to This Feeling",
                suggestion: "Being present and spontaneous seemed to bring you joy today.",
                actionText: "Speaking random with your sister",
                actionBadge: "Talk about this",
                actionColor: Color(hex: "#A544B7"),
                pillColor: Color(hex: "#A544B7"),
                pillBadgeText: "Have you considered continuing with your..."
            )
            
            Divider()
                .background(Color.white)
                .frame(height: 1)

//            // Second Section
            SectionView(
                title: "How to support yourself",
                suggestion: "Try scheduling space for similar moments tomorrow.",
                actionText: "Plan 15 minutes for regrowth",
                actionBadge: "Try this tomorrow",
                actionColor: Color(hex: "#4BC06B"),
                pillColor: Color(hex: "#4BC06B"),
                pillBadgeText: "Have you considered continuing with your..."
            )
        }.padding(.horizontal,5)
        .background(Color(hex: "#201E91"))
    }
}

struct SectionView: View {
    let title: String
    let suggestion: String
    let actionText: String
    let actionBadge: String
    let actionColor: Color
    let pillColor: Color
    let pillBadgeText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(Font.semiBold(size: 15))
                .foregroundColor(Color.opacedColor)
                .padding(.horizontal,20)
            
            HStack {
                Spacer()
                
                // Suggestion
                Text(suggestion)
                    .font(Font.light(size: 18))
                    .italic()
                    .foregroundColor(.white.opacity(0.8))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 1, dash: [4]))
                    )
                Spacer()
            }
            
            // Row of pills
            HStack(spacing: 5) {
                ForEach(0..<3) { i in
                    if i == 1 {
                        SpeakPillButton(text: actionText, badge: actionBadge, color: actionColor)
                    } else {
                        SuggestionPill(text: pillBadgeText, color: pillColor)
                    }
                }
            }
            
        }
    }
}

struct SpeakPillButton: View {
    let text: String
    let badge: String
    let color: Color

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Text(text)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(color)
                        .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
                )
                .frame(minWidth: 160)

            Text(badge)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .offset(x: 8, y: -10)
        }
    }
}

struct SuggestionPill: View {
    let text: String
    let color: Color

    var body: some View {
        Text(text)
            .font(.system(size: 10))
            .foregroundColor(.white)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(
                Capsule()
                    .fill(color)
                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
            )
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .frame(minWidth: 100)
    }
}






struct WhatHappenedView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("What Happened")
                .font(Font.semiBold(size: 15))
                .foregroundColor(Color.opacedColor)

            VStack(spacing: 20) {
                HappenedCard(
                    title: "Amazing Date",
                    subtitle: "So I meet this fantastic girl that ...",
                    backgroundColor: Color(hex: "#F3D2D2")
                )

                HappenedCard(
                    title: "Ice Cream from this funny...",
                    subtitle: "I went out eating this great ice ...",
                    backgroundColor: Color(hex: "#E7F8F1")
                )
            }
        }.padding(.horizontal,20)
            .padding(.vertical,10)
        .background(Color(hex: "#201E91")) // your main bg
    }
}



struct HappenedCard: View {
    let title: String
    let subtitle: String
    let backgroundColor: Color

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(Font.semiBold(size: 20))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .truncationMode(.tail)

                Text(subtitle)
                    .font(Font.light(size: 15))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }

            Spacer()

            Circle()
                .stroke(Color(hex: "#201E91"), lineWidth: 2)
                .frame(width: 48, height: 48)
                .overlay(
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color(hex: "#201E91"))
                        .font(.system(size: 20, weight: .medium))
                )
        }
        .padding()
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}



struct MoodTrackerHeaderSection : View {
    
    @Binding var emotions : [String]
    @Binding var selectedIndex : Int
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Text("June 9")
                    .font(Font.semiBold(size: 28))
                    .foregroundColor(.white)
                Spacer()
                EmojiCard().padding(.trailing,5)
            }
            
            FocusedText(text: "I was", focusedText: "feeling")
            
            
            
            HStack(spacing: 8) {
                Spacer()
                
                ForEach(emotions.indices,id: \.self){ index in
                    FeelingChip(text: emotions[index], on: selectedIndex == index) {
                        selectedIndex = index
                    }
                }
                Spacer()
            }
        }.padding(.horizontal,20)
    }
}
    
struct FeelingChip: View {
    let text: String
    var on: Bool = false
    var onNext : () -> Void

    var body: some View {
        Text(text)
            .font(Font.light(size: 14))
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .foregroundColor(.white)
            .background(
                Capsule()
                    .fill(on ? Color.secondaryApp : Color.clear)
                    .overlay(
                        Capsule()
                            .stroke(Color.white, lineWidth: 1.5)
                    )
            ).onTapGesture {
                onNext()
            }
    }
}



struct FocusedText: View {
    
    var text : String
    var focusedText : String
    var font1 : Font = Font.light(size: 15)
    var font2 : Font = Font.semiBold(size: 15)
    
    var body : some View {
     
        HStack(spacing: 5) {
            
            Text(text)
                .foregroundColor(Color.opacedGray)
                .font(font1)
            

            Text(focusedText)
                .foregroundColor(Color.opacedColor) // Darker, like the screenshot
                .font(font2)
            
        }
    }
}


struct EmojiCard: View {
    var emoji: String = "😄"

    var body: some View {
        Text(emoji)
            .font(.system(size: 28))
            .padding(7)
            .background(Color.white.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}

