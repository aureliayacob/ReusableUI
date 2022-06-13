//
//  Color+Theme.swift
//  
//
//  Created by nexsoft nexsoft on 13/06/22.
//

import Foundation

import Foundation
import SwiftUI

@available(macOS 10.15, *)
extension Color {
    static let theme = ColorTheme()
}

@available(macOS 10.15, *)
struct ColorTheme {
    
    // Main
    let defaultColor = Color("DefaultColor")
    
    // Button disabled state
    let buttonFillDisabledState = Color("ButtonDisabled.Fill")
    let buttonForegroundDisabledState = Color("ButtonDisabled.Foreground")
    
    //Input disabled state
    let inputBackgroundDisabledState = Color("InputDisabled.Fill")
    let inputForegroundDisabledState = Color("InputDisabled.Foreground")
    let inputPrimaryText = Color("InputText.Primary")
    
    
    
    
    
}

    
    
    
