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
