import SwiftUI

public extension Color {
    public static let theme = ColorTheme()
}

public struct ColorTheme {
    
    // Main
    public let defaultColor = Color("DefaultColor", bundle: .module)
    
    
    // Button disabled state
    public let buttonFillDisabledState = Color("ButtonFillDisabledState")
    public let buttonForegroundDisabledState = Color("ButtonForegroundDisabledState")
    
    //Input disabled state
    public let inputBackgroundDisabledState = Color("InputBackgroundDisabledState")
    public let inputForegroundDisabledState = Color("InputForegroundDisabledState")
    public let inputPrimaryText = Color("InputPrimaryText")
    
    
    
    
    
}
