import SwiftUI
import Foundation
import PlaygroundSupport


// Bubble Sort
public struct bSort {
    static var x: Int = 0
    
    func bubbleSort(myData: [Int]) {
        var data: [Int] = myData
        var sorted = false
        
        while sorted == false {
            sorted = true
            for i in (bSort.x)...data.count - 2 {
                if data[i] > data[i+1] {
                    sorted = false
                    data.swapAt(i, i+1)
                    bSort.x = i
                    DataFunctions().putData(data: data)
                    return
                }
            }
            bSort.x = 0
            if data == data.sorted() {
                return
            }
            self.bubbleSort(myData: data)
        }
    }
}


struct GraphUpdateBubble: View {
    var data: [Int]
    var color: Color
    
    var body: some View {
        HStack (alignment: .lastTextBaseline) {
            ForEach(0..<data.count) { d in
                let temp: CGFloat =  CGFloat(data[d] * 45)
                
                VStack {
                    Rectangle()
                        .fill(color)
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


public struct Bubble2D: View {
    public init() { }
    
    // Data members
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isSorted = false
    @State var refresh: Bool = true
    @State var bell: Bool = true
    @State var color: Color = .red
    
    public var body: some View {
        let data = DataFunctions().getData()
        
        VStack (spacing: 30) {
            if refresh {
                withAnimation() {
                    GraphUpdateBubble(data: data, color: color)
                }
            }
        }
        .frame(width: 480, height: 490)
        .background(Color.white)
        .opacity(0.85)
        .cornerRadius(15)
        .shadow(radius: 10)
        .onReceive(
            timer, perform: { _ in
                bSort().bubbleSort(myData: data)
                if(isSorted == false) {
                    if data.sorted() == data {
                        isSorted = true
                        
                        // Change color to green
                        color = .green
                        
                        if bell {
                            // Add Sound Effect
                            SoundManager.instance.playSound(sound: .bell)
                            bell = false
                        }
                    } else {
                        // Toggle refresh
                        refresh.toggle()
                        refresh.toggle()
                        
                        // Add Sound Effect
                        SoundManager.instance.playSound(sound: .whoosh)
                    }
                }
            }
        )
    }
}
