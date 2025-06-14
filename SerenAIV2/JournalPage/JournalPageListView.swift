//
//  JournalPageListView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 19.04.2025.
//

import Foundation
import SwiftUI

struct JournalPageListView : View {
    var body : some View {
        
        JournalPageLayoutInVStack(padding: 0) {
            ZStack(alignment: .bottomTrailing) {
                
                VStack(alignment: .leading, spacing: 20) {
                    HeaderSectionJournalPage()
                        .padding(.top, 40)
                        .padding(.horizontal, 20)
                    
                    JournalList()
                }
                
                FloatingNewEntryButton()
                    .padding(24)
            }

        }
    }
}


struct HeaderSectionJournalPage : View {
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Text("October")
                .font(Font.semiBold(size: 28))
                .foregroundColor(.white)
            Image(systemName: "chevron.down")
                .foregroundColor(.white)
                .font(Font.semiBold(size: 20))
        }
    }
}


struct JournalList: View {
    let entries: [JournalEntry] = [
           .init(
               date: "3 October 2024",
               time: "19:00",
               title: "A heartfelt day: Celebrating My Syster’s 18th Birthday.",
               feeling: "Angry",
               emoji: "😡",
               gradient: LinearGradient(
                   colors: [Color(hex: "350809"), Color(hex: "9B191B")],
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing
               )
           ),
           .init(
               date: "2 October 2024",
               time: "17:24",
               title: "Finding Inspiration and Artistic Succes",
               feeling: "Happy",
               emoji: "😊",
               gradient: LinearGradient(
                   colors: [Color(hex: "00D2FF"), Color(hex: "CFDEF3")],
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing
               )
           ),
           .init(
               date: "1 October 2024",
               time: "18:33",
               title: "Today I got pickpocketed and lost everything that was on me",
               feeling: "Loved",
               emoji: "😍",
               gradient: LinearGradient(
                   colors: [Color(hex: "E53935"), Color(hex: "E35D5B")],
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing
               )
           )
       ]

    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(entries) { entry in
                    JournalEntryCard(entry: entry)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 100)
        }
    }
}


struct JournalEntryCard: View {
    let entry: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(entry.date)
                    .font(Font.light(size: 12))
                    .foregroundColor(.white.opacity(0.9))
                Spacer()
                Text(entry.time)
                    .font(Font.light(size: 12))
                    .foregroundColor(.white.opacity(0.9))
            }
            
            Text(entry.title)
                .font(Font.regular(size: 18))
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)

            HStack {
                Text("Feeling:")
                    .font(Font.bold(size: 14))
                    .foregroundColor(.white.opacity(0.9))
                Text(entry.feeling)
                    .font(Font.bold(size: 14))
                    .foregroundColor(.white)
                Text(entry.emoji)
                    .font(.system(size: 16))
            }
        }
        .padding()
        .background(entry.gradient)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}


struct FloatingNewEntryButton: View {
    var body: some View {
        Button(action: {
            // Action to create a new journal
        }) {
            Image(systemName: "pencil.and.outline")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(18)
                .background(Color.secondary_2)
                .clipShape(Circle())
                .shadow(radius: 6)
        }
    }
}


import SwiftUI

struct JournalEntry: Identifiable {
    let id = UUID()
    let date: String
    let time: String
    let title: String
    let feeling: String
    let emoji: String
    let gradient: LinearGradient
}
