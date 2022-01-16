import SwiftUI
import PlaygroundSupport

struct InsertionSort: View { 
    
    var body: some View {
        ZStack {
            
            VStack (spacing: 50){
                // Display Menu
                InsertionMenu()
            }
        }
    }
}

PlaygroundPage.current.setLiveView(InsertionSort())
