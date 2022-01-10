import SwiftUI
import PlaygroundSupport

struct BubbleSort: View {
    
    var body: some View {
        ZStack {
            BackgroundAnimation()
            VStack (spacing: 50){
                // Heading in White font for Bubble
                
                ChartView()
                BubbleMainView()
            }
        }
    }
}

PlaygroundPage.current.setLiveView(BubbleSort())
