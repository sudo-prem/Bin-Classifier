//
//  MenuViewTwo.swift
//  Sort and Classify
//
//  Created by Premnaath Varadharajan on 09/04/22.
//

import SwiftUI
import Foundation


public struct MenuViewTwo: View {
    public init() { }
    
    // Data Members
    @State var menu = true
    
    public var body: some View {
        VStack (spacing: 50) {
            // Title
            Text("Bin Classification")
                .fontWeight(.bold)
                .font(.system(size: 40, design: .rounded))
                .shadow(radius: 10)
                .foregroundColor(Color.white)
            
            // Classification View
            BinClassify(classifier: ImageClassifier())
        }
    }
}
