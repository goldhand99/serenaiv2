//
//  MoodTrackingPageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 09.04.2025.
//

import Foundation
import SwiftUI


struct MoodTrackingPageView: View {
    
    var body : some View {
        PresentationPageLayout(
            title: "Smart Mood Tracking – A Gentle Path to Clarity",
            subtitle: "Check in with yourself daily, recognize emotional patterns, and gain gentle insights to support your well-being.",
            currentPage: 2,
            totalPages: 4
        ) {
            
            VStack(spacing: 70) {
                VStack(alignment: .leading, spacing: 50) {
                    // Bullet points
                    BulletPoint(
                        title: "SerenAI offers gentle guidance",
                        description: "SerenAI gently tracks your moods to help you recognize emotional patterns and trends."
                    )
                    
                    BulletPoint(
                        title: "Discover what shapes your well-being",
                        description: "Gain insights into how daily experiences impact your emotions and find ways to nurture balance."
                    )
                }.padding(.trailing,100)
                    .padding(.leading,50)
                
                MoodChartView().frame(height: 150)
                Spacer()

                
            }.padding(.top,20)
        }
    }
}




struct MoodChartView: View {
    let moodData: [(time: String, moodLevel: Int, emoji: String)] = [
        ("08:00", 1, "😁"),
        ("10:00", 0, "😄"),
        ("13:00", 2, "🙂"),
        ("14:00", 4, "😡"),
        ("15:00", 3, "😢"),
        ("18:00", 2, "😐")
    ]
    
    let moodLabels = ["Happy", "Calm", "Uncertain", "Sad", "Angry"]
    
    let chartPadding: CGFloat = 50 // for Y-axis labels

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width - chartPadding
            let height = geo.size.height - 30 // leave space for time labels

            let stepX = width / CGFloat(moodData.count - 1)
            let stepY = height / CGFloat(moodLabels.count - 1)

            ZStack {
                // Horizontal Y-axis lines + labels
                ForEach(0..<moodLabels.count, id: \.self) { i in
                    let y = CGFloat(i) * stepY
                    Group {
                        // Mood level label
                        Text(moodLabels[i])
                            .font(Font.medium(size: 12))
                            .foregroundColor(.white)
                            .position(x: chartPadding/3 , y: y)

                        // Guideline
                        Path { path in
                            path.move(to: CGPoint(x: chartPadding, y: y))
                            path.addLine(to: CGPoint(x: chartPadding + width, y: y))
                        }
                        .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 1, dash: [4]))
                    }
                }

                //Draw the path
                Path { path in
                    var points: [CGPoint] = moodData.enumerated().map { index, data in
                        let x = chartPadding + CGFloat(index) * stepX
                        let y = CGFloat(data.moodLevel) * stepY
                        return CGPoint(x: x, y: y)
                    }

                    // 💡 Pad start and end to ensure smoothness
                    if let first = points.first, let last = points.last {
                        points.insert(first, at: 0)
                        points.append(last)
                    }

                    guard points.count >= 4 else { return }

                    path.move(to: points[1])

                    for i in 1 ..< points.count - 2 {
                        let p0 = points[i - 1]
                        let p1 = points[i]
                        let p2 = points[i + 1]
                        let p3 = points[i + 2]

                        // Catmull-Rom to Bézier conversion
                        let control1 = CGPoint(
                            x: p1.x + (p2.x - p0.x) / 6,
                            y: p1.y + (p2.y - p0.y) / 6
                        )
                        let control2 = CGPoint(
                            x: p2.x - (p3.x - p1.x) / 6,
                            y: p2.y - (p3.y - p1.y) / 6
                        )

                        path.addCurve(to: p2, control1: control1, control2: control2)
                    }
                }
                .stroke(Color.white, lineWidth: 2)


                // Emoji points
                ForEach(Array(moodData.enumerated()), id: \.offset) { index, data in
                    let x = chartPadding + CGFloat(index) * stepX
                    let y = CGFloat(data.moodLevel) * stepY

                    Text(data.emoji)
                        .font(.system(size: 24))
                        .position(x: x, y: y)
                }

                // X-axis time labels
                VStack {
                    Spacer()
                    
                    HStack(spacing: 0) {
                        ForEach(moodData.indices, id: \.self) { i in
                            
                            Text(moodData[i].time)
                                .font(.custom(Font.font_regular, size: 11))
                                .foregroundColor(.white)
                                .frame(width: stepX, alignment: .center)
                            
                        }

                    }
                    .padding(.leading, chartPadding/2)
                }
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 32)
    }
}
