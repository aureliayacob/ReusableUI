//
//  ReusableButton.swift
//  Comp
//
//  Created by nexsoft nexsoft on 30/05/22.
//

import SwiftUI

@available(macOS 12.0, *)
@available(iOS 15.0, *)

public struct ReusableButton: View {
    public var text: String
    public var action: () -> Void
    public var body: some View {
        Button {
            action()
        } label: {
            Text("\(text)".uppercased())
                .foregroundColor(.white)
        }
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(.pink)
        .cornerRadius(15)
        .padding()

    }
    
    public init(text: String, action: @escaping () -> Void){
        self.text = text
        self.action = action
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
struct ReusableButton_Previews: PreviewProvider {
    static var previews: some View {
        ReusableButton(text: "", action: {})
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
struct ReusableButtonLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder var views: [LibraryItem] {
   
        LibraryItem(ReusableButton(text: "next", action: {}),
                    title: "NexBtnKu",
                    category: .control)
        
       
    }
}
