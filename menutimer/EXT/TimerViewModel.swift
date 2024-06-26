//
//  TimerViewModel.swift
//  menutimer
//
//  Created by Alex Ryan on 4/29/24.
//

import SwiftUI

@Observable final class TimerViewModel: ObservableObject {
    
    var isActive = false
    var showingAlert = false
    var time: String = "5:00"
    var minutes: Float = 5.0 {
        didSet {
            self.time = "\(Int(minutes)):00"
        }
    }
    
    private var initialTime = 0
    private var endDate = Date()
    
    func start(seconds: Float) {
        self.initialTime = Int(seconds)
        self.endDate = Date()
        self.isActive = true
        self.endDate = Calendar.current.date(byAdding: .second, value: Int(seconds), to: endDate)!
    }
    
    func reset() {
        self.minutes = Float(initialTime)
        self.isActive = false
        self.time = "\(Int(minutes)):00"
    }
    
    func updateCountdown() {
        guard isActive else { return }
        
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        
        if diff <= 0 {
            self.isActive = false
            self.time = "0:00"
            self.showingAlert = true
            return
        }
        
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        self.minutes = Float(minutes)
        self.time = String(format: "%d:%02d", minutes, seconds)
    }
}
