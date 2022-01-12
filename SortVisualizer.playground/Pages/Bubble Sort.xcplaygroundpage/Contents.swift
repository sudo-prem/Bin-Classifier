import SwiftUI
import PlaygroundSupport

struct BubbleSort: View {
    
    var body: some View {
        ZStack {
            
            BackgroundAnimation()
            VStack (spacing: 50){
                // Display Contents
                BubbleMainView()
            }
        }
    }
}

PlaygroundPage.current.setLiveView(BubbleSort())
