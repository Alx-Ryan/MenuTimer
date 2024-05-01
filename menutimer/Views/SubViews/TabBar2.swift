//
//  TabBar2.swift
//  menutimer
//
//  Created by Alex Ryan on 4/30/24.
//

import SwiftUI

struct TabBar2: View {
    
    var options: [String] = ["Pomodoro", "Timer"]
    @Binding var selection: String
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(options, id: \.self) { option in
                VStack(spacing: 6) {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .frame(width: 50)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                }
                .padding(.top, 8)
                .background(.touchPadding)
                .foregroundStyle(selection == option ? Color.darkRed : Color.lightRed)
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value: selection)
    }
}

fileprivate struct BumbleFilterViewPreview: View {
    
    var options: [String] = ["Everyone", "Trending"]
    @State private var selection = "Everyone"
    
    var body: some View {
        TabBar2(options: options, selection: $selection)
    }
}

#Preview {
    BumbleFilterViewPreview()
        .padding()
        .frame(width: 300)
}
