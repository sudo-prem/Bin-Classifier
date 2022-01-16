import SwiftUI
import PlaygroundSupport

public struct PreludeView: View {
    public init() { }
    
    public var body: some View {
        ZStack {
            BackgroundAnimation()
            // Some welcome message
        }
    }
}

PlaygroundPage.current.setLiveView(PreludeView())
