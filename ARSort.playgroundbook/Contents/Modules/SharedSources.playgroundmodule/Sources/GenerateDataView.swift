import SwiftUI
import PlaygroundSupport

public struct GenerateDataView: View {
    @State private var showChart = false
    
    // Public init to use in other views
    public init() { }
    
    private func makeList(_ n: Int) -> [Int] {
        return Array(1...n).shuffled()
    }
    
    public var body: some View {
        var randomData = [Int]()
        
        ZStack {
            VStack (spacing: 21) {
                if showChart {
                    ChartView()
                    
                    Button {
                        // Add Sound Effect
                        SoundManager.instance.playSound(sound: .button)
                        
                        // Add Animation
                        withAnimation() {
                            showChart = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .frame(width: 14 , height: 14)
                            .font(.system(size: 21))
                    }
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .shadow(radius: 10)
                } else {
                    Button {
                        // Add Sound Effect
                        SoundManager.instance.playSound(sound: .button)
                        
                        // Generate string with random number
                        randomData = makeList(9)
                        
                        // Stores data globally
                        DataFunctions().putData(data: randomData)
                        
                        withAnimation() {
                            showChart.toggle()
                        }
                    } label: {
                        Label("Generate Dataset", systemImage: "wand.and.stars")
                            .frame(width: 200 , height: 50, alignment: .center)
                            .font(.system(size: 20))
                    }
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .shadow(radius: 10)
                }
            }
        }
    }
}
