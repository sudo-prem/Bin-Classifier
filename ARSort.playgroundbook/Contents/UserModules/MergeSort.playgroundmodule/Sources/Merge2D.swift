import SwiftUI
import Foundation
import PlaygroundSupport


// Merge Sort
func Merge(data: [Int], l: Int, mid: Int, h: Int) -> Bool {
    var arr: [Int] = data
    var res = [Int](repeating: 0, count: h+1)
    var i = l, j = mid + 1, k = 0
    
    while i <= mid && j <= h {
        if arr[i] < arr[j] {
            res[k] = arr[i];
            k += 1
            i += 1
        } else {
            res[k] = arr[j]
            k += 1
            j += 1
        }
    }
    while i <= mid {
        res[k] = arr[i];
        k += 1
        i += 1
    }
    while j <= h {
        res[k] = arr[j];
        k += 1
        j += 1
    }
    
    k = 0;
    var t = l
    while t <= h {
        arr[t] = res[k];
        t += 1
        k += 1
    }
    
    if data == arr {
        return false
    }
    
    DataFunctions().putData(data: arr)
    return true
}


func mergeSort(data: [Int]) {
    let end = data.count
    var i = 2, j = 0, mid = 0, l = 0, h = 0
    
    while i < data.count {
        j = 0
        while j + i - 1 < end {
            l = j
            h = j + i - 1
            mid = (l)/2 + (h)/2
            
            if Merge(data: data, l: l, mid: mid, h: h) {
                return
            }
            j += i
        }
        
        i *= 2
    }
    
    if (i/2) < end {
        if Merge(data: data, l: 0, mid: i / 2 - 1, h: end - 1) { }
    }
}


struct GraphUpdateMerge: View {
    var data: [Int]
    var color: Color
    
    var body: some View {
        HStack (alignment: .lastTextBaseline){
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


public struct Merge2D: View {
    public init() { }
    
    // Timer to Update view
    let timer = Timer.publish(every: 1.2, on: .main, in: .common).autoconnect()
    @State var isSorted = false
    @State var refresh: Bool = true
    @State var bell: Bool = true
    @State var color: Color = .red
    
    public var body: some View {
        let data = DataFunctions().getData()
        
        VStack (spacing: 30) {
            if refresh {
                withAnimation() {
                    GraphUpdateMerge(data: data, color: color)
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
                mergeSort(data: data)
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
