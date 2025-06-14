//
//  PrefferedTheraphyView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 21.04.2025.
//

import Foundation
import SwiftUI


struct PrefferedTheraphyView : View {
    var body: some View {
        JournalPageLayoutInVStack(padding: 0) {
            PrefferedTheraphyContent()
        }
    }
}


struct PrefferedTheraphyContent : View {
    var body: some View {
        VStack {
            Text("Preffered theraphy")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
                .foregroundColor(.white)
            Text("Different paths work for different people. Start with what feels safe.")
                .font(Font.light(size: 15))
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top, 2)
                        
            PrefferedTheraphySection().padding(.top,10)

        }
    }
}

struct PrefferedTheraphySection : View {
    var body: some View {
        VStack{
            TherapyCarousel()
            TherapyTagSection()
        }
    }
}


struct TherapyData {
    var title: String
    var description: String
    var selected : Bool?
}

struct TherapyCard: View {
    var title: String
    var description: String
    var selected : Bool = false

    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top,5)

            Text(description)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)

            Button(selected ? "Selected" : "Select") {}
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 24)
                .background(RoundedRectangle(cornerRadius: 10).fill(!selected ? Color.secondary_2 : Color.blue))
                .padding(.bottom,5)
        }.frame(width: 300, height: 140)

        .padding()
//        .background(Color(hex: "#2C2ABF"))
        .background(!selected ? Color.accent : Color.secondary_2)
        .cornerRadius(26)
        .shadow(radius: 5)
    }
}



struct TherapyCarousel: View {
    let cards = [
        TherapyData(title: "Narrative Therapy", description: "Explore your life story and reshape how you understand yourself."),
        TherapyData(title: "Cognitive Behavioral Therapy", description: "Tools to challenge unhelpful thoughts and build healthier patterns."),
        TherapyData(title: "Mindfulness-Based Therapy", description: "Gentle awareness practices to ground yourself in the present."),
        TherapyData(title: "Solution-Focused Therapy", description: "Short-term focus on building solutions."),
        TherapyData(title: "Humanistic Therapy", description: "Self-growth and emotional healing.",selected: true)
    ]
    
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(cards.indices, id: \.self) { index in
                    ZStack {
                        TherapyCard(
                            title: cards[index].title,
                            description: cards[index].description,
                            selected: cards[index].selected ?? false
                        )
                        .padding()
                    }
                    .cornerRadius(18)
                    .shadow(radius: 5)
                    .scaleEffect(1.0 - abs(distance(index)) * 0.2)
                    .opacity(1.0 - abs(distance(index)) * 0.3)
                    .offset(x: myXOffset(index), y: 0)
                    .zIndex(1.0 - abs(distance(index)) * 0.1)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        draggingItem = snappedItem + value.translation.width / 300 // smaller sensitivity
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            let dragThreshold: CGFloat = 50 // How much you need to drag to trigger switch
                            
                            if value.translation.width < -dragThreshold {
                                // Swipe left → next card
                                snappedItem = (snappedItem - 1).remainder(dividingBy: Double(cards.count))
                            } else if value.translation.width > dragThreshold {
                                // Swipe right → previous card
                                snappedItem = (snappedItem + 1).remainder(dividingBy: Double(cards.count))
                            }
                            
                            draggingItem = snappedItem // lock dragging to snapped
                        }
                    }
            )
            
            HStack(spacing: 8) {
                ForEach(cards.indices, id: \.self) { index in
                    Circle()
                        .fill(currentIndex == index ? Color.primary : Color.primary.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            
        }
        
    }
    
    var currentIndex: Int {
        let index = Int(-snappedItem).modulo(cards.count)
        return index
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(cards.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(cards.count) * distance(item)
        return sin(angle) * 200
    }
}

struct TherapyTagSection: View {
    var body: some View {
        VStack(spacing: 10) {
            
            // Section 1: When to use it
            TagGroupCard(
                text: "When to", focusedText: "use it",
                tags: ["repetitive thoughts", "overthinking", "exhausted"], color: Color.secondaryApp.opacity(0.85), colorTags: .accent
            )

            // Section 2: What you may discover
            TagGroupCard(
                text: "What you may", focusedText: "discover",
                tags: ["identity", "past experiences", "emotions"], color: .accent.opacity(0.85), colorTags: .white.opacity(0.29)
            ).padding(.top,20)

            Spacer()
            // Footer Description
            Text("Therapy style refers to the way emotional support is delivered. Some people prefer structure, others prefer reflection. There’s no wrong choice.")
                .font(Font.bold(size: 14))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 24).ignoresSafeArea()
        }
        .padding(.vertical, 0)
        .padding(.top,20)
    }
}

struct TagGroupCard: View {
    var text : String
    var focusedText: String  
    var tags: [String]
    var footnote: String? = nil
    var color : Color
    var colorTags : Color


    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            FocusedText(text: text, focusedText: focusedText,font1: Font.semiBold(size: 15))
            

            WrapTagsViewString(tags: tags.map { TagString(title: $0) }, color: colorTags).padding(.top)

            if let note = footnote {
                Text(note)
                    .font(.system(size: 13))
                    .italic()
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding()
        .background(color)
        .cornerRadius(24)
        .padding(.horizontal, 16)
    }
}

struct TagString: Identifiable {
    let id = UUID()
    let title: String
}


struct WrapTagsViewString: View {
    let tags: [TagString]
    var color: Color

    var body: some View {
        FlexibleView(data: tags, spacing: 10, alignment: .leading) { tag in
            Text(tag.title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                                    Capsule()
                                        .fill(color)
                                        .overlay(
                                            Capsule()
                                                .stroke(Color.white.opacity(0.8), lineWidth: 1.2)
                                        )
                                        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4) // Shadow only at the bottom
                                )
        }
    }
}







//
//
//struct TherapyCarousel: View {
//    let cards = [
//        TherapyData(title: "Narrative Therapy", description: "Explore your life story and reshape how you understand yourself."),
//        TherapyData(title: "Cognitive Behavioral Therapy", description: "Tools to challenge unhelpful thoughts and build healthier patterns."),
//        TherapyData(title: "Mindfulness-Based Therapy", description: "Gentle awareness practices to ground yourself in the present."),
//        TherapyData(title: "Solution-Focused Therapy", description: "Short-term focus on building solutions."),
//        TherapyData(title: "Humanistic Therapy", description: "Self-growth and emotional healing.")
//    ]
//
//    @State private var selectedIndex = 0
//
//    var body: some View {
//        VStack(spacing: 5) {
//            TabView(selection: $selectedIndex) {
//                ForEach(cards.indices, id: \.self) { index in
//                    TherapyCard(
//                        title: cards[index].title,
//                        description: cards[index].description
//                    )
//                    .padding(.horizontal, 8)
//                    .tag(index)
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .frame(height: 180)
//            // Custom Dots
//            HStack(spacing: 8) {
//                ForEach(cards.indices, id: \.self) { index in
//                    Circle()
//                        .fill(index == selectedIndex ? Color.white : Color.white.opacity(0.4))
//                        .frame(width: 8, height: 8)
//                }
//            }
//        }
//    }
//}




//struct FocusedText: View {
//    
//    var text : String
//    var focusedText : String
//    var font1 : Font = Font.light(size: 15)
//    var font2 : Font = Font.semiBold(size: 15)
//    
//    var body : some View {
//     
//        HStack(spacing: 5) {
//            
//            Text(text)
//                .foregroundColor(Color.opacedGray)
//                .font(font1)
//            
//
//            Text(focusedText)
//                .foregroundColor(Color.opacedColor) // Darker, like the screenshot
//                .font(font2)
//            
//        }
//    }
//}
