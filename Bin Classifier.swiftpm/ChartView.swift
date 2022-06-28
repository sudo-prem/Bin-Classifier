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
        let data: [Int] = Constants.K.binStats
        let colors: [Color] = [.black, .brown, .blue, .yellow, .red, .green, .gray]
        
        // HStack for aligning vertical bars
        HStack (alignment: .lastTextBaseline){
            ForEach(0..<data.count) { d in
                let temp: CGFloat =  CGFloat(data[d] * 10)
                VStack {
                    Rectangle()
                        .fill(colors[d])
                        .frame(width: 30, height: temp)
                        .cornerRadius(5)
                        .shadow(radius: 3)
                    Image(systemName: "trash.fill")
                        .foregroundColor(colors[d])
                        .font(.system(size: 28, design: .rounded))
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
