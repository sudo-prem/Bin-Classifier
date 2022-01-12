import SwiftUI
import PlaygroundSupport

public struct DataView: View {
    
    public init() { }
    public var body: some View {
        DataButtonView()
    }
}

func makeList(_ n: Int) -> [Int] {
    return Array(1...n).shuffled()
}

func getString(_ nums: [String]) -> String{
    var res: String = ""
    for num in nums {
        res.append(num)
    }
    
    return res
}

struct DataButtonView: View {
    @State private var showChart = false
    @State private var buttonString = "Generate Dataset"
    @State private var imageString = "wand.and.stars"
    
    var body: some View {
        var randomData = [Int]()
        var randomString = randomData.map { String($0) }
        
        ZStack {
            VStack (spacing: 50) {
                
                if(showChart) {
                    ChartView()
                }
                
                Button {
                    buttonString = "Discard Dataset"
                    imageString = "xmark.circle.fill"
                    
                    // Generate string with random number
                    randomData = makeList(9) 
                    
                    // Convert integer vector to character vector
                    var randomString = randomData.map { String($0) }
                    
                    // Generate a string from vector
                    var dataString = getString(randomString)
                    
                    // Store the string as global
                    PlaygroundKeyValueStore.current["dataset"] = .string(dataString)
                    
                    withAnimation() {
                        showChart.toggle()
                        if(showChart == false) {
                            buttonString = "Generate Dataset"
                            imageString = "wand.and.stars"
                        }
                    }
                    
                    // Navigate user to move to the next page to visualize using 2D and 3Ds
                        // TODO
                } label: {
                    Label(buttonString, systemImage: imageString)
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

