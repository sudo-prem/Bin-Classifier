import SwiftUI
import Foundation
import PlaygroundSupport


// Merge Sort
func mergeSort(myData: [Int]) {
    var data: [Int] = myData
    
    for i in 0..<data.count-1 {
        for j in 0..<data.count-1 {
            if data[j] > data[j+1] {
                data.swapAt(j, j+1)
                DataFunctions().putData(data: data)
                return
            }
        }
    } 
}


struct GraphUpdate: View {
    var data: [Int]
    
    var body: some View {
        HStack (alignment: .lastTextBaseline){
            ForEach(0..<data.count) { d in
                let temp: CGFloat =  CGFloat(data[d] * 45)
                
                VStack {
                    Rectangle()
                        .fill(.red)
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

public struct Merge2D: View {
    public init() { }
    
    // Data members
    let timer = Timer.publish(every: 1.2, on: .main, in: .common).autoconnect()
    @State var isSorted = false
    @State var refresh: Bool = true
    
    public var body: some View {
        var data = DataFunctions().getData()
        
        VStack (spacing: 30) {
            if refresh {
                withAnimation() {
                    GraphUpdate(data: data)
                }
            }
        }
        .frame(width: 580, height: 580)
        .background(Color.white)
        .opacity(0.85)
        .cornerRadius(15)
        .shadow(radius: 10)
        .onReceive(timer, perform: { _ in
            mergeSort(myData: data)
            refresh.toggle()
            refresh.toggle()
        })
    }
}
