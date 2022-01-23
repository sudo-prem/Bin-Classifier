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

struct MergeSort: View {
    
    var body: some View {
        ZStack {
            
            BackgroundAnimation()
            VStack (spacing: 50){
                // Display Menu
                MergeMenu()
            }
        }
    }
}

PlaygroundPage.current.setLiveView(MergeSort())
