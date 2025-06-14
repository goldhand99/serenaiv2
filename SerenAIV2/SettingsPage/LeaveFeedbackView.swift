//
//  LeaveFeedbackView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 22.04.2025.
//

import Foundation
import SwiftUI


struct LeaveFeedbackView : View {
    var body: some View {
        JournalPageLayoutInVStack(padding: 20) {
            LeaveFeedbackContent()
        }
    }
}


struct LeaveFeedbackContent : View {
    var body: some View {
        VStack {
            Text("Leave a feedback")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
                .foregroundColor(.white)
            Text("Your voice helps shape this space.")
                .font(Font.light(size: 15))
                .padding(.top, 2)
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

            IssueForm(attachPhotoOn: false,backgroundColor: Color.secondaryApp,padding: 40).padding(.top)
            ReviewPromptSection().padding(.top)
        }
    }
}

