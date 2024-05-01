    //
    //  TabBar.swift
    //  menutimer
    //
    //  Created by Alex Ryan on 4/29/24.
    //

import SwiftUI

struct TabBar: View {
    
    var isSelected: Bool = false
    
    var body: some View {
        ZStack(alignment: !isSelected ? .leading : .trailing) {
            Capsule(style: .continuous)
                .frame(width: 200, height: 25)
                .foregroundStyle(Color.darkRed)
            HStack {
                Text("Pomodoro")
                    .foregroundStyle(.white)
                Spacer()
                Text("Timer")
                    .foregroundStyle(.white)
                    .padding(10)
            }
            .padding(20)
            Capsule()
                .frame(width: 100, height: 25)
                .foregroundStyle(Color.shadowRed.opacity(0.5))
            
        }
        .frame(width: 200, height: 25)
    }
}


#Preview {
    TabBar(isSelected: false)
}

