import SwiftUI
import PlaygroundSupport

public struct DataView: View {
    
    public init() { }
    public var body: some View {
        DataButtonView()
    }
}

func makeList(_ n: Int) -> [Int] {
    return (0..<n).map { _ in .random(in: 1...10) }
}

struct DataButtonView: View {
    @State private var showChart = false
    @State private var buttonString = "Create Dataset"
    
    var body: some View {
        var randomData: [Int] = makeList(9)
        // var randomString = randomData.map { String($0) }
        
        
        ZStack {
            VStack (spacing: 50) {
                if(showChart) {
                    ChartView()
                }
                
                Button {
                    buttonString = "Change Dataset"
                    randomData = makeList(9) 
                    
                    PlaygroundKeyValueStore.current["dataset"] = array.([])
                    
                    withAnimation() {
                        showChart = true
                    }
                    
                    // Store a dataset as global
                    
                    // Navigate user to move to the next page to visualize using 2D and 3Ds
                } label: {
                    Label(buttonString, systemImage: "wand.and.stars")
                        .frame(width: 200 , height: 50, alignment: .center)
                        .font(.system(size: 20))
                }
                .foregroundColor(.red)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .buttonBorderShape(.capsule)
                .opacity(0.9)
            }
        }
    }
}

