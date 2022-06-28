//
//  MenuViewOne.swift
//  Sort and Classify
//
//  Created by Premnaath Varadharajan on 09/04/22.
//

import SwiftUI

public struct MenuViewOne: View {
    
    public init() { }
    
    // Data Members
    @State var menu = true
    
    public var body: some View {
        VStack (spacing: 40) {
            // Title
            Text("Bin Classification")
                .fontWeight(.bold)
                .font(.system(size: UIScreen.screenHeight/20, design: .rounded))
                .shadow(radius: 10)
                .foregroundColor(Color.white)
            
            // Classification View
            BinClassify(classifier: ImageClassifier())
        }
    }
}

