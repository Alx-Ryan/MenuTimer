//
//  TitleBar.swift
//  menutimer
//
//  Created by Alex Ryan on 4/29/24.
//

import SwiftUI

struct TitleBar: View {
    @Binding var settingsOpen: Bool
    
    var body: some View {
        HStack(spacing: 30){
            HStack(spacing: 6) {
                Image(systemName: "timer.circle")
                Text("Focus Timer")
            }
            
            Button(action: {
                if(settingsOpen) {
                    withAnimation(.snappy) {
                        settingsOpen.toggle()
                    }
                }
                else {
                    withAnimation(.snappy) {
                        settingsOpen.toggle()
                    }
                }
            }) {
                Label("Toggle", systemImage: settingsOpen ? "chevron.backward.circle.fill" : "gearshape.fill")
                    .labelStyle(.iconOnly)
            }
            .buttonStyle(.plain)
        }
        .padding(.top, 6)
    }
}

#Preview {
    VStack {
        TitleBar(settingsOpen: .constant(false))
        TitleBar(settingsOpen: .constant(true))
    }
}
