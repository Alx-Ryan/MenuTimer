//
//  ProgressViews.swift
//  menutimer
//
//  Created by Alex Ryan on 4/29/24.
//

import SwiftUI

struct ProgressViews: View {
    let themeColor: Color
    let color1: Color
    let color2: Color
    let isTimerRunning: Bool
    let isTimerPaused: Bool
    let remainingTime: Int
    
    var body: some View {
        ZStack {
            BackgroundProgressView(themeColor: themeColor)
            TimerProgressView(color1: color1, color2: color2, isTimerRunning: isTimerRunning, isTimerPaused: isTimerPaused, remainingTime: remainingTime)
        }
    }
}

struct BackgroundProgressView: View {
    let themeColor: Color
    
    var body: some View {
        Circle()
            .trim(from: 0.1, to: 0.9)
            .rotation(.degrees(90))
            .stroke(themeColor,
                    style: StrokeStyle(lineWidth: 10, lineCap: .round))
            .scaledToFit()
            .frame(width: 200, height: 100)
            .padding(.top, 5)
    }
}

struct TimerProgressView: View {
    let color1: Color
    let color2: Color
    let isTimerRunning: Bool
    let isTimerPaused: Bool
    let remainingTime: Int
    
    var body: some View {
        Circle()
            .trim(from: 0.1, to: isTimerRunning && !isTimerPaused ? 0.9 : 0.101)
            .rotation(.degrees(90))
            .stroke(
                AngularGradient(
                    gradient: Gradient(colors: [color1, color2]),
                    center: .center,
                    startAngle: .degrees(90),
                    endAngle: .degrees(450)
                ),
                style: StrokeStyle(lineWidth: 10, lineCap: .round)
            )
            .scaledToFit()
            .frame(width: 200, height: 100)
            .padding(.top, 5)
            .animation(.linear(duration: isTimerRunning && !isTimerPaused ? TimeInterval(remainingTime) : 0.5), value: isTimerRunning && !isTimerPaused)
    }
}
#Preview {
    ProgressViews(themeColor: .blue, color1: Color.darkRed, color2: .lightRed, isTimerRunning: true, isTimerPaused: true, remainingTime: 40)
}
