//
//  JournalPageAppView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 19.04.2025.
//

import Foundation
import SwiftUI



import SwiftUI


struct JournalPageAppView : View {
    var body: some View {
        JournalPageLayout(padding: 140) {
            JournalPageAppContent()
        }
    }
}


struct JournalPageAppContent: View {
    var body: some View {
        ZStack {

            Color.secondary_2.ignoresSafeArea().clipShape(
                .rect(
                    topLeadingRadius: 70,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 70
                )
            )
            
            VStack(alignment: .leading, spacing: 24) {
                JournalHeaderView()
                // Grateful Section
                          JournalSection(
                              title: "Things I’m Grateful For:",
                              paragraphs: [
                                  (
                                      "•The opportunity to celebrate with my sister birthday which I love her very much.",[]
                                  ),
                                  (
                                      "•It is a really beautiful day outside",
                                      []
                                  )
                              ]
                          )

                          // Discomfort Section
                          JournalSection(
                              title: "Situations that caused discomfort:",
                              paragraphs: [
                                (
                                    "•The opportunity to celebrate with my sister birthday which I love her very much.It is really a nice loving day.",
                                    [("The opportunity to celebrate with my sister birthday which I love her very much.It is really a nice loving day.", Color.highlightedColour)]
                                )
                              ], showSpeakLater: true
                          )

                          // Highlight of Day
                          JournalSection(
                              title: "Highlight of  day:",
                              paragraphs: [
                                  (
                                      """
                                      •The opportunity to celebrate with my sister birthday which I love her very much.
                                      It is a really beautiful day outside and I have really enjoyed everything from the food from the meeting with the pizza guy. \
                                      I have some doubts cause I am starting so many projects and I don’t know how I will approach all of them.
                                      """,
                                      [("The opportunity to celebrate with my sister birthday which I love her very much.", .unlightedColour)]
                                  )
                              ]
                          )

                ContinueIndicator()

                Spacer()

                JournalFooterActions()
            }
            .padding()
            .padding(.horizontal,10)
            .padding(.top,20)
            .padding(.bottom,20)
        }.ignoresSafeArea()
    }
}








struct JournalHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("3 October 2024")
                .font(Font.regular(size: 14))
                .foregroundColor(.white)

            Text("A Heartfelt Day: Celebrating on My Sister’s 18th Birthday")
                .font(Font.semiBold(size: 20))
                .foregroundColor(.white)
        }
    }
}



struct ContinueIndicator: View {
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .frame(width: 6, height: 6)
                .foregroundColor(.white)

            Text("Tap here to continue…")
                .font(Font.light(size: 14))
                .foregroundColor(.white.opacity(0.7))

            Spacer()
        }
    }
}


struct JournalFooterActions: View {
    var body: some View {
        HStack {
            Spacer()
            HStack(spacing: 24) {
                ForEach(["camera", "bold", "list.bullet", "sparkles"], id: \.self) { icon in
                    Circle()
                        .fill(Color.secondary_2)
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: icon)
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                        )
                }
            }
            .padding(10)
            .background(Color.backgroundPrimary)
            .cornerRadius(50)
            Spacer()
        }
    }
}







struct JournalSection: View {
    let title: String
    var paragraphs: [(text: String, highlights: [(String, Color)])] = []
    var showSpeakLater: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(Font.semiBold(size: 14))
                .foregroundColor(.white)

            ForEach(0..<paragraphs.count, id: \.self) { i in

                        HighlightedTextView(
                            text: paragraphs[i].text,
                            highlights: paragraphs[i].highlights,
                            needsButton: showSpeakLater
                        )
                
            }
        }
    }
}






struct HighlightedTextView: View {
    var text: String
    var highlights: [(String, Color)]
    var needsButton = false
    
    var body: some View {
        let attributed = NSMutableAttributedString(string: text)
        
        for (substring, color) in highlights {
            if let range = text.range(of: substring) {
                let nsRange = NSRange(range, in: text)
                attributed.addAttributes([
                    .foregroundColor: UIColor.white,
                    .strokeColor: UIColor(color),
                    .strokeWidth: -2,
                    .backgroundColor: UIColor(color),
                    .font: UIFont.systemFont(ofSize: 14)
                ], range: nsRange)
            }
        }
        
        return Text(AttributedString(attributed))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}




struct SpeakLaterBadge: View {
    var body: some View {
        Text("Speak Later")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color.backgroundPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}


struct SpeakLaterSuggestionBubble: View {
    var message: String

    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            // Badge slightly lifted
            SpeakLaterBadge()
                .offset(y: 4)
                .padding(.trailing,30)
                .zIndex(1)

            // The bubble
            Text(message)
                .font(Font.regular(size: 12))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .fill(Color.highlightedColour)
                )
        }
        .padding(.horizontal)
    }
}
















