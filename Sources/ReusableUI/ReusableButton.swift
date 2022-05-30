//
//  ReusableButton.swift
//  Comp
//
//  Created by nexsoft nexsoft on 30/05/22.
//

import SwiftUI

@available(macOS 12.0, *)
struct ReusableButton: View {
    var text: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text("\(text)".uppercased())
                .foregroundColor(.white)
        }
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(.indigo)
        .cornerRadius(15)
        .padding()

    }
}

@available(macOS 12.0, *)
struct ReusableButton_Previews: PreviewProvider {
    static var previews: some View {
        ReusableButton(text: "", action: {})
    }
}

@available(macOS 12.0, *)
struct ReusableButtonLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder var views: [LibraryItem] {
   
        LibraryItem(ReusableButton(text: "next", action: {}),
                    title: "NexBtnKu",
                    category: .control)
    }
}
