import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                BackgroundAnimation(shape: "Circle")
                MainMenu()
            }
        }
    }
}
