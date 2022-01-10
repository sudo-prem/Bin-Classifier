import SwiftUI
import PlaygroundSupport

struct BubbleSort: View {
    
    var body: some View {
        ZStack {
            BackgroundAnimation()
            BubbleMainView()
        }
    }
}

PlaygroundPage.current.setLiveView(BubbleSort())
