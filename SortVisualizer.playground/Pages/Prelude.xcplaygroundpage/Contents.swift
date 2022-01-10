import SwiftUI
import PlaygroundSupport

public struct PreludeView: View {
    
    public init() { }
    public var body: some View {
        ZStack {
            BackgroundAnimation()
            // Some welcome message
            // Prompt the user to navigate to the next page to generate dataset
        }
    }
}

PlaygroundPage.current.setLiveView(PreludeView())
