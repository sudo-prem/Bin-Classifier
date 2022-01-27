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

struct InsertionSort: View {
    
    var body: some View {
        ZStack {
            BackgroundAnimation(shape: "Rectangle")
            VStack (spacing: 50) {
                // Display Menu
                InsertionMenu()
            }
        }
    }
}

PlaygroundPage.current.setLiveView(InsertionSort())
