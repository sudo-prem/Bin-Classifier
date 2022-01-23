import SwiftUI
import Foundation
import PlaygroundSupport

// Insertion Sort
func insertionSort(data: [Int]) {
    let size = data.count
    var arr: [Int] = data
    
    for i in 1..<size {
        let j = i;
        while j > 0 && arr[j] < arr[j - 1]
        {
            let j = i
            while j > 0 && arr[j] < arr[j - 1]
            {
                arr.swapAt(j, j-1)
                DataFunctions().putData(data: arr)
                return
            }
        }
    }
}

struct GraphUpdateInsertion: View {
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

public struct Insertion2D: View {
    public init() { }
    
    // Data members
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isSorted = false
    @State var refresh: Bool = true
    
    public var body: some View {
        let data = DataFunctions().getData()
        
        VStack (spacing: 30) {
            if refresh {
                withAnimation() {
                    GraphUpdateInsertion(data: data)
                }
            }
        }
        .frame(width: 580, height: 580)
        .background(Color.white)
        .opacity(0.85)
        .cornerRadius(15)
        .shadow(radius: 10)
        .onReceive(timer, perform: { _ in
            insertionSort(data: data)
            refresh.toggle()
            refresh.toggle()
        })
    }
}
