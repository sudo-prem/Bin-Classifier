//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

import SwiftUI
import PlaygroundSupport

public struct PreludeView: View {
    public init() { }
    
    public var body: some View {
        ZStack {
            BackgroundAnimation(shape: "Triangle")
            // Some welcome message
        }
    }
}

PlaygroundPage.current.setLiveView(PreludeView())
