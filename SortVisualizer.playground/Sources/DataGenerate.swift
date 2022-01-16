import SwiftUI
import PlaygroundSupport

func makeList(_ n: Int) -> [Int] {
    return Array(1...n).shuffled()
}

public struct GenerateData: View {
    public init() { }
    @State private var showChart = false
    
    public var body: some View {
        var randomData = [Int]()
        var randomString = randomData.map { String($0) }
        
        ZStack {
            VStack (spacing: 50) {
                if showChart {
                    ChartView()
                } else {
                    Button {
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
                    .buttonBorderShape(.capsule)
                    .opacity(0.9)
                    .shadow(radius: 10)
                }
            }
        }
    }
}
