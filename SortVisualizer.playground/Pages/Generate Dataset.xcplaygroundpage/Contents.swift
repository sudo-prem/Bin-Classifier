import SwiftUI
import PlaygroundSupport

struct GenerateData: View {
    
    var body: some View {
        ZStack {
            BackgroundAnimation()
//            DataView()
            ChartView()
        }
    }
}

PlaygroundPage.current.setLiveView(GenerateData())
