//
//  ColorEXT.swift
//  menutimer
//
//  Created by Alex Ryan on 4/29/24.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    public static var touchPadding: Color { return Color(.black.opacity(0.001)) }
}

extension Color {
    
    public static var outlineRed: Color {
        return Color(decimalRed: 55, green: 0, blue: 4).opacity(0.7)
        
    }
    
    public static var shadowRed: Color {
        return Color(decimalRed: 43, green: 0, blue: 10).opacity(0.8)
        
    }
    
    public static var darkRed: Color {
        return Color(decimalRed: 221, green: 31, blue: 59)
        
    }
    
    public static var lightRed: Color {
        return Color(decimalRed: 239, green: 54, blue: 128)
        
    }
    
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
        
    }
    
    
}
