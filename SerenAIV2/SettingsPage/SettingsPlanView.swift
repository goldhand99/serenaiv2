//
//  SettingsPlanView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 21.04.2025.
//

import Foundation
import SwiftUI


struct SettingsPlanView : View {
    var body: some View {
        JournalPageLayoutInVStack(padding: 20) {
        SettingsPlanViewContent()
        }
    }
}


struct SettingsPlanViewContent : View {
    var body: some View {
        VStack {
            Text("View/Change Plan")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
            Text("What you choose for your well-being is always valid.We support your choice, whatever it is.")
                .font(Font.light(size: 15))
                .padding(.top, 2)
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
            
            Spacer()

            SubscriptionCardView(priceMonth: "13", priceYear: "109", membershipName: "Serenity Starter Plan", membershipSubtext: "For those who want to begin their self care journey", features: ["AI Theraphist","Smart Journaling","Mood Tracking","Emergency techniques"]).tag(0).padding(.horizontal,30)
            
                PeriodSeparatorView().padding(.top)

            Spacer()

                ButtonShadow(text: "Cancel Plan", fontSize: 18, height: 48).padding(.horizontal, 32)
                    .padding(.bottom,0).padding(.top)

                Spacer()
        }
    }
}
