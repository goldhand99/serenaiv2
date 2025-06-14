//
//  SettingsPageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 21.04.2025.
//

import Foundation
import SwiftUI


struct SettingsPageView : View {
    var body: some View {
        JournalPageLayoutInVStack(padding: 20) {
            SettingsPageContent()
        }
    }
}


struct SettingsPageContent : View {
    var body: some View {
        VStack {
            // Title
            Text("Personalize your Journey")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)

            ScrollView {
                VStack(spacing: 30) {
                    
                 
                    SettingsSection(
                        title: "Account & Subscription",
                        content: [
                            SettingsRowData(title: "View/Change Plan"),
                            SettingsRowData(title: "Payment History")
                        ]
                    )

                    SettingsSection(
                        title: "Therapy Preferences",
                        content: [
                            SettingsRowData(title: "Choose preferred therapy method"),
                            SettingsRowData(title: "Select AI voice tone")
                        ]
                    )

                    SettingsSection(
                        title: "Notifications",
                        content: [
                            SettingsRowData(title: "Mood tracking reminders", isToggle: true),
                            SettingsRowData(title: "Daily check-ins", isToggle: true),
                            SettingsRowData(title: "Affirmation of the day", isToggle: true),
                            SettingsRowData(title: "Journaling nudges", isToggle: true)
                        ]
                    )

                    SettingsSection(
                        title: "Support & Feedback",
                        content: [
                            SettingsRowData(title: "Report a bug"),
                            SettingsRowData(title: "Leave Feedback"),
                            SettingsRowData(title: "Contact SerenAI Support")
                        ]
                    )
                    
                    // Footer Quote
                    QuoteSectionSettings()
                        .padding(.bottom, 60)
                }.padding(.horizontal,20)
            }
        }
    }
}
struct SettingsSection: View {
    var title: String
    let content: [SettingsRowData]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Spacer()
                Text(title)
                    .font(Font.semiBold(size: 15))
                    .foregroundColor(.white)
                Spacer()
            }
            
            VStack(spacing: 0) {
                ForEach(Array(content.enumerated()), id: \.element.id) { i, row in
                    VStack(spacing: 0) {
                      
                        if row.isToggle {
                            SettingsToggleRow(title: row.title)
                        }else {
                            SettingsRow(data: row)
                        }
                        if i < content.count - 1 {
                            Divider().background(Color.white)
                        }
                    }
                }
            }
            .background(Color.secondary_2)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 6)
        }
    }
}


struct SettingsRowData: Identifiable {
    let id = UUID()
    let title: String
    var isToggle: Bool = false
}


struct SettingsRow: View {
    let data: SettingsRowData
    
    var body: some View {
        HStack {
            Text(data.title)
                .foregroundColor(.white)
                .font(Font.semiBold(size: 15))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .medium))
        }
        .padding(.horizontal)
        .frame(height: 50)
        
    }
}

struct SettingsToggleRow: View {
    var title: String
    @State private var isOn = false
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
                .font(Font.regular(size: 15)) // custom font if you're using it
                .padding(.leading, 4)

            Spacer()
            
            Toggle("", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: .accentColor)) // accent-colored thumb
                .labelsHidden()
                .scaleEffect(0.85)
        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(Color.white.opacity(0.05))
    }
}

struct QuoteSectionSettings : View {
    var body: some View {
        Text("The world is loud.\nThis space is yours.\n\n— Pop, CEO & CTO of SerenAI")
            .font(Font.light(size: 18))
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.accent)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 6)
    }
}
