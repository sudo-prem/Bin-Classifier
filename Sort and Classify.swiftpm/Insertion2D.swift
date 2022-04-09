//
//  Insertion2D.swift
//  Sort and Classify
//
//  Created by Premnaath Varadharajan on 08/04/22.
//

import SwiftUI
import Foundation


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
                Constants.K.randomData = arr
                return
            }
        }
    }
}


struct GraphUpdateInsertion: View {
    var data: [Int]
    var color: Color
    
    var body: some View {
        HStack (alignment: .lastTextBaseline){
            ForEach(0..<data.count) { d in
                let temp: CGFloat =  CGFloat(data[d] * 35)
                
                VStack {
                    Rectangle()
                        .fill(color)
                        .frame(width: 30, height: temp)
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
    @State var bell: Bool = true
    @State var color: Color = .red
    
    public var body: some View {
        let data = Constants.K.randomData
        
        VStack (spacing: 30) {
            if refresh {
                withAnimation() {
                    GraphUpdateInsertion(data: data, color: color)
                }
            }
        }
        .frame(width: 397, height: 490)
        .background(Color.white)
        .opacity(0.85)
        .cornerRadius(15)
        .shadow(radius: 10)
        .onReceive(
            timer, perform: { _ in
                insertionSort(data: data)
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
