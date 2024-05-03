    //
    //  TimePicker.swift
    //  menutimer
    //
    //  Created by Alex Ryan on 4/29/24.
    //

import SwiftUI

struct TimePicker: View {
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    
    var body: some View {
        HStack(alignment: .top) {
            Picker("Hours", selection: $hours) {
                ForEach(0..<24) { hour in
                    Text("\(hour)").tag(hour)
                }
            }
            .frame(width: 98)
           // .pickerStyle(.inline)
            .pickerStyle(.menu)
            
            Picker("Minutes", selection: $minutes) {
                ForEach(0..<60, id: \.self) { minute in
                    if minute < 5 || minute % 5 == 0 {
                        Text("\(minute)").tag(minute)
                    }
                }
            }
            .frame(width: 110)
                // .pickerStyle(.inline)
            .pickerStyle(.menu)
            
            Picker("Seconds", selection: $seconds) {
                ForEach(0..<61, id: \.self) { second in
                    if second % 5 == 0 {
                        Text("\(second)").tag(second)
                    }
                }
            }
            .frame(width: 115)
                // .pickerStyle(.inline)
            .pickerStyle(.menu)           
        }
        .padding()
    }
    
}

struct TimePickerPreview: View {
    @State private var hours: Int = 1
    @State private var minutes: Int = 30
    @State private var seconds: Int = 0
    
    var body: some View {
        TimePicker(hours: $hours, minutes: $minutes, seconds: $seconds)
    }
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerPreview()
    }
}
