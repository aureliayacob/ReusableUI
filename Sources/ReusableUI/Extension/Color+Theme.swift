//
//  Color+Theme.swift
//  
//
//  Created by nexsoft nexsoft on 13/06/22.
//

import Foundation
import SwiftUI

@available(macOS 10.15, *)
public extension Color {
    static let theme = ColorTheme()
}

@available(macOS 10.15, *)
public struct ColorTheme {
    
    // Main
    public let defaultColor = Color("DefaultColor", bundle: .module)
    
    // Button disabled state
    let buttonFillDisabledState = Color("ButtonDisabled.Fill", bundle: .module)
    let buttonForegroundDisabledState = Color("ButtonDisabled.Foreground", bundle: .module)
    
    //Input disabled state
    let inputBackgroundDisabledState = Color("InputDisabled.Fill", bundle: .module)
    let inputForegroundDisabledState = Color("InputDisabled.Foreground", bundle: .module)
    let inputPrimaryText = Color("InputText.Primary", bundle: .module)
    
    
    
    
    
}

    
    
    
