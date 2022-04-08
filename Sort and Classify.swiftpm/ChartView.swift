//
//  ChartView.swift
//  Sort and Classify
//
//  Created by Premnaath Varadharajan on 08/04/22.
//

import SwiftUI


public struct ChartView: View {
    
    // Public init to use in other views
    public init() { }
    
    public var body: some View {
        let data: [Int] = DataManager().getData()
        
        // HStack for aligning vertical bars
        HStack (alignment: .lastTextBaseline){
            ForEach(0..<data.count) { d in
                let temp: CGFloat =  CGFloat(data[d] * 10)
                VStack {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 30, height: temp)
                        .cornerRadius(5)
                        .shadow(radius: 3)
                    Text("\(data[d])")
                        .foregroundColor(Color.black)
                        .opacity(0.7)
                }
            }
        }
        .frame(width: 400, height: 200)
        .background(Color.white)
        .opacity(0.85)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}
