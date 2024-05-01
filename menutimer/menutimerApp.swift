//
//  menutimerApp.swift
//  menutimer
//
//  Created by Alex Ryan on 4/29/24.
//

import SwiftUI
import SwiftData

@main
struct menutimerApp: App {

    var body: some Scene {
        MenuBarExtra("", systemImage: "timer.circle") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
    }
}
