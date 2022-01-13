import SwiftUI
import Foundation
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

// Main Algorithm
func bubbleSort(myData: [Int]) -> [Int]{
    var data: [Int] = myData
    
    for i in 0..<data.count-1 {
        for j in 0..<data.count-1 {
            if data[j] > data[j+1] {
                data.swapAt(j, j+1)
                return data
            }
        }
    } 
    
    return data
}

struct GraphView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var isSorted = false
    
    public var body: some View {
        var data = DataFunctions().getData()
        VStack (spacing: 30) {
            if !isSorted {
                withAnimation() {
                    GraphUpdate(data: data, col: .red)
                }
            }
        }
        .frame(width: 580, height: 580)
        .background(Color.white)
        .opacity(0.85)
        .cornerRadius(15)
        .shadow(radius: 10)
        .onReceive(timer, perform: { _ in
            var myData = data
            myData = bubbleSort(myData: myData)
            DataFunctions().putData(data: myData)
        })
    }
}

public struct Bubble2D: View {
    public init() { }
    
    public var body: some View {
        GraphView()
    }  
}    
