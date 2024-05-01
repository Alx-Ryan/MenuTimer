//
//  StartResetButtonStack.swift
//  menutimer
//
//  Created by Alex Ryan on 4/29/24.
//

import SwiftUI

struct StartResetButtonStack: View {
    @Binding var isTimerRunning: Bool
    let startTimer: () -> Void
    let stopTimer: () -> Void
    let resetTimer: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                isTimerRunning.toggle()
                if isTimerRunning {
                    startTimer()
                } else {
                    stopTimer()
                }
            }) {
                Text(isTimerRunning ? "Stop" : "Start")
            }
            
            Button("Reset") {
                resetTimer()
            }
        }
    }
}

#Preview {
    VStack {
        StartResetButtonStack(isTimerRunning: .constant(false)) { 
            
        } stopTimer: { 
            
        } resetTimer: { 
            
    }
        
        StartResetButtonStack(isTimerRunning: .constant(true)) { 
            
        } stopTimer: { 
            
        } resetTimer: { 
            
        }
    }

}
