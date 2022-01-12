import SwiftUI
import PlaygroundSupport


struct GraphUpdate: View {
    var data: [Int]
    var col: Color
    
    var body: some View {
        HStack (alignment: .lastTextBaseline){
            ForEach(0..<data.count) { d in
                let temp: CGFloat =  CGFloat(data[d] * 45)
                
                VStack {
                    Rectangle()
                        .fill(col)
                        .frame(width: 40, height: temp)
                        .cornerRadius(5)
                        .shadow(radius: 3)
                    Text("\(data[d])")
                        .foregroundColor(Color.black)
                        .opacity(0.7)
                }
            }
        }
    }
}


struct GraphView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var isSorted = false
    var data = DataFunctions().getData()
    
    public var body: some View {
        VStack (spacing: 30) {
            GraphUpdate(data: data, col: .red)
        }
        .frame(width: 580, height: 580)
        .background(Color.white)
        .opacity(0.85)
        .cornerRadius(15)
        .shadow(radius: 10)
        .onReceive(timer, perform: { _ in
        })
    }
}

public struct Bubble2D: View {
    public init() { }
    
    public var body: some View {
        GraphView()
    }  
}    
