//
//  SettingsPaymentView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 21.04.2025.
//

import Foundation
import SwiftUI

struct SettingsPaymentsView : View {
    var body: some View {
        JournalPageLayoutInVStack(padding: 20) {
            Text("Payment History")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
            Text("Self-care is the kind of wealth that lasts.")
                .font(Font.light(size: 15))
                .padding(.top, 2)
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
           
            SettingsPaymentsContent()
            Spacer()
        }
    }
}

struct SettingsPaymentsContent : View {
    let mockEntries = [
        PaymentEntry(month: "January", amount: 13.99),
        PaymentEntry(month: "February", amount: 13.99),
        PaymentEntry(month: "March", amount: 28.99)
    ]
    
    var body: some View {
        VStack {
            PaymentHistoryBox(entries: mockEntries)
        }
    }
    
}


struct PaymentHistoryBox: View {
    let entries: [PaymentEntry]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(entries.indices, id: \.self) { i in
                HStack {
                    Text(entries[i].month)
                        .foregroundColor(.white)
                        .font(Font.light(size: 14))
                    Spacer()
                    Text(String(format: "%.2f$", entries[i].amount))
                        .foregroundColor(.white)
                        .font(Font.light(size: 14))
                }
                .padding(.vertical, 12)
                .padding(.horizontal,20)

                if i < entries.count - 1 {
                    Divider().background(Color.white.opacity(0.5))
                }
            }
        }
        .background(Color.secondary_2)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding(.horizontal)
    }
}

struct PaymentEntry {
    let month: String
    let amount: Double
}
