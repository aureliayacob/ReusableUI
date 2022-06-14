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
    let color: Color?
    let icon: Image?
    let foregroundColor: Color?
    let action: () -> Void
    
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
        
        .frame(width: sizeAttributes.width,
               height: sizeAttributes.height,
               alignment: sizeAttributes.alignment)
        .background(background)
        .cornerRadius(sizeAttributes.radius)
        
    }
    
    func getSizeAttributes(by size: ButtonSize) ->
    (width: CGFloat, height: CGFloat, alignment: Alignment, fontSize: CGFloat, radius: CGFloat, strokeWidth: CGFloat){
        switch size {
            // we can use the font size for the icon size because they are same
        case .XXL:
            return(214, 97, .center, 28, 24, 2)
        case .XL:
            return(181, 78, .center, 24, 16, 2)
        case .L:
            return(139, 58, .center, 22, 16, 1)
        case .M:
            return(127, 49, .center, 20, 12, 2)
        case .S:
            return(109, 38, .center, 18, 8, 1)
        case .XS:
            return(94, 27, .center, 16, 8, 1)
        }
        
        
    }
    // TODO -- jagain foreground color
    // DONE -- refactor because we find out that icon can be dynamic by passing svg icon, and the color states are changeable
    func getThemeProperties(by theme: ButtonTheme) ->
    (background: Color, pressedColor: Color, foreground: Color, stroke: Color, disabledFill: Color, disabledStroke: Color) {
        
        let mainColor = color ?? Color.accentColor
        let mainForeground = foregroundColor ?? Color.white
        
        switch theme {
        case .PRIMARY:
            return (mainColor, mainColor.opacity(0.9), mainForeground, Color.clear, Color.theme.buttonFillDisabledState, Color.clear)
        case .SECONDARY:
            return (Color.clear, mainColor.opacity(0.9), mainForeground, mainColor, Color.clear, Color.theme.buttonFillDisabledState)
        case .TERTIARY:
            return (Color.clear, mainColor.opacity(0.9), mainForeground, Color.clear, Color.clear, Color.clear)
        }
    }
    
    public init(label: String, size: ButtonSize, theme: ButtonTheme, color: Color, icon: Image? = nil, foregroundColor: Color? = Color.white, action: @escaping () -> Void) {
        self.label = label
        self.size = size
        self.theme = theme
        self.color = color
        self.icon = icon
        self.action = action
        self.foregroundColor = foregroundColor
    }
}


@available(iOS 13.0.0, *)
@available(macOS 11, *)
struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(label: "aurel", size: .L, theme: .TERTIARY, color: Color.pink, icon: Image(systemName: "heart.fill"), foregroundColor: .yellow, action: {})
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
            icon: nil,
            action: {}),
                    title: "ButtonComponent",
                    category: .control)
    }
}
