    //
    //  ContentView.swift
    //  menutimer
    //
    //  Created by Alex Ryan on 4/29/24.
    //

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @StateObject private var vm = TimerViewModel()
    @State private var isTimerPaused = false
    
    var color1 = Color.lightRed
    var color2 = Color.darkRed
    var shadowColor = Color.shadowRed
    var themeColor = Color.outlineRed
    
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 10
    @State private var isTimerRunning = false
    @State private var remainingTime = 0
    @State private var settingsOpen: Bool  = false
    @State private var isTimerTapped: Bool = false
    @State private var timer: Timer?
    
    var options: [String] = ["Pomodoro", "Timer"]
    @State private var selection = "Pomodoro"
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 200
            )
            VStack {
                TitleBar(settingsOpen: $settingsOpen)
//                TabBar(isSelected: isTimerTapped)
//                    .onTapGesture {
//                        isTimerTapped.toggle()
//                    }
                TabBar2(options: options, selection: $selection)
                    .frame(width: 150)
                Spacer()
                
                ZStack {
                    BackgroundProgressView(themeColor: .darkRed)
                    TimeRemaining()
                    TimerProgressView(color1: color1, color2: color2, isTimerRunning: isTimerRunning, isTimerPaused: isTimerPaused, remainingTime: remainingTime)
                }
                
                if selection == "Timer" {
                    TimePicker(hours: $hours, minutes: $minutes, seconds: $seconds)
                    
                    StartResetButtonStack(
                        isTimerRunning: $isTimerRunning,
                        startTimer: startTimer,
                        stopTimer: stopTimer,
                        resetTimer: resetTimer
                    )
                } else {
                    StartResetButtonStack(
                        isTimerRunning: $isTimerRunning,
                        startTimer: startTimer,
                        stopTimer: stopTimer,
                        resetTimer: resetTimer
                    )}
                
            }
            .padding()
                // .frame(width: 340, height: 275)
        }
        
    }
    
        //MARK: Time Functions
    func startTimer() {
        if remainingTime <= 0 {
                // If remaining time is zero or negative, reset the timer
            resetTimer()
        }
        
            // Start or resume the timer
        if remainingTime > 0 {
            isTimerRunning = true
        }
            // Invalidate any existing timer
        timer?.invalidate()
        
            // Create a new Timer instance
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            guard isTimerRunning, remainingTime > 0 else {
                self.stopTimer() // Stop timer if not running or time is up
                return
            }
            remainingTime -= 1 // Update remaining time every second
        }
        isTimerPaused = false
            //            // Enable Focus mode
            //        setFocusMode(enabled: true)
    }
    
    func stopTimer() {
            // Stop or pause the timer
        isTimerRunning = false
            // Invalidate the timer
        timer?.invalidate()
            //            // Disable Focus mode
            //        setFocusMode(enabled: false)
        isTimerPaused = true
    }
    
    func resetTimer() {
            // Reset the timer to the initial time
        remainingTime = hours * 3600 + minutes * 60 + seconds
        stopTimer() // Pause the timer after resetting
    }
    
    func remainingTimeFormatted(from totalSeconds: Int) -> String {
        let hours = remainingTime / 3600
        let minutes = (remainingTime % 3600) / 60
        let seconds = (remainingTime % 3600) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func TimeRemaining() -> some View {
        let totalSeconds = hours * 3600 + minutes * 60 + seconds
        let formattedTime = remainingTimeFormatted(from: totalSeconds)
        
        return Text(formattedTime)
            .font(.title3)
            .bold()
            .scaledToFit()
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .frame(width: 75)
            .alert("timer complete", isPresented: $vm.showingAlert) {
                Button("Continue", role: .cancel) {
                        //code
                }
            }
    }
    
}
