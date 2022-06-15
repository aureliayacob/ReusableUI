//
//  ButtonComponent.swift
//  iOSComponents
//
//  Created by nexsoft nexsoft on 08/06/22.
//
import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct ButtonComponent: View {
    
    let label: String
    let size: ButtonSize
    let theme: ButtonTheme
    let color: Color
    let icon: Image?
    let foregroundColor: Color?
    let action: () -> Void
    //to custom the width
    var width: CGFloat?
    var maxWidth: CGFloat?
    
    @Environment(\.isEnabled) var isEnabled
    
    public var body: some View {
        
        let sizeAttributes = getSizeAttributes(by: size)
        let themeProperties = getThemeProperties(by: theme)
        
        let background = RoundedRectangle(cornerRadius: sizeAttributes.radius)
            .stroke(isEnabled ? themeProperties.stroke : themeProperties.disabledStroke,
                    lineWidth: sizeAttributes.strokeWidth)
            .background(isEnabled ? themeProperties.background : themeProperties.disabledFill)
        
        Button(action: action) {
            if let icon = icon {
                icon
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(isEnabled ? themeProperties.foreground : Color.theme.buttonForegroundDisabledState)
                    .frame(width: sizeAttributes.fontSize, height: sizeAttributes.fontSize)
            }
            
            Text("\(label)")
                .foregroundColor(isEnabled ? themeProperties.foreground : Color.theme.buttonForegroundDisabledState)
                .font(.system(size: sizeAttributes.fontSize))
        }
        .padding(.horizontal, sizeAttributes.paddingHorizontal)
        .padding(.vertical, sizeAttributes.paddingVertical)
        .frame(width: width ?? nil)
        .background(background)
        .cornerRadius(sizeAttributes.radius)
    }
    
    func getSizeAttributes(by size: ButtonSize) ->
    (paddingHorizontal: CGFloat, paddingVertical: CGFloat, fontSize: CGFloat, radius: CGFloat, strokeWidth: CGFloat){
        switch size {
            // we can use the font size for the icon size because they are same
        case .XXL:
            return(32, 32,  28, 24, 2)
        case .XL:
            return(32, 24, 24, 16, 2)
        case .L:
            return(24, 16, 22, 16, 2)
        case .M:
            return(20, 12, 20, 12, 2)
        case .S:
            return(16, 8,  18, 8, 1)
        case .XS:
            return(8, 4, 16, 8, 1)
        }
    }
    
    // DONE -- refactor because we find out that icon can be dynamic by passing svg icon, and the color states are changeable
    func getThemeProperties(by theme: ButtonTheme) ->
    (background: Color, pressedColor: Color, foreground: Color, stroke: Color, disabledFill: Color, disabledStroke: Color) {
        
        let mainForeground = foregroundColor ?? Color.white
        
        switch theme {
        case .PRIMARY:
            return (color, color.opacity(0.9), mainForeground, Color.clear, Color.theme.buttonFillDisabledState, Color.clear)
        case .SECONDARY:
            return (Color.clear, color.opacity(0.9), color, color, Color.clear, Color.theme.buttonFillDisabledState)
        case .TERTIARY:
            return (Color.clear, color.opacity(0.9), color, Color.clear, Color.clear, Color.clear)
        }
    }
    
    public init(label: String, size: ButtonSize, theme: ButtonTheme, color: Color, action: @escaping () -> Void, icon: Image? = nil, foregroundColor: Color? = Color.white, width: CGFloat? = nil, maxWidth: CGFloat? = nil) {
        self.label = label
        self.size = size
        self.theme = theme
        self.color = color
        self.icon = icon
        self.action = action
        self.foregroundColor = foregroundColor
        self.width = width
        self.maxWidth = maxWidth
    }
}

public enum ButtonTheme {
    case PRIMARY
    case SECONDARY
    case TERTIARY
}

public enum ButtonSize {
    case XXL
    case XL
    case L
    case M
    case S
    case XS
}

// Add to library
@available(iOS 14.0, *)
@available(macOS 11.0, *)
struct ReusableLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder var views: [LibraryItem] {
        LibraryItem(ButtonComponent(
            label: "",
            size: .L,
            theme: .PRIMARY,
            color: Color.theme.defaultColor,
            action: {}, icon: nil),
                    title: "ButtonComponent",
                    category: .control)
    }
}
