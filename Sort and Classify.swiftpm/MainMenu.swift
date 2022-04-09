//
//  MainMenu.swift
//  Sort and Classify
//
//  Created by Premnaath Varadharajan on 09/04/22.
//

import SwiftUI

struct MainMenu: View {
    
    // Data Members
    @State private var menu: Bool = true
    @State private var menuOne: Bool = false
    @State private var menuTwo: Bool = false
    
    var body: some View {
        
        VStack (spacing: 50) {
            
            if menu {
                
                // Title
                Text("Sort and Classify")
                    .fontWeight(.bold)
                    .font(.system(size: 40, design: .rounded))
                    .shadow(radius: 10)
                    .foregroundColor(Color.white)
                
                // Button for Sort Visualisation
                Button {
                    // Add Sound Effect
                    SoundManager.instance.playSound(sound: .button)
                    
                    // Add Animation
                    withAnimation() {
                        menuOne = true
                        menu = false
                    }
                } label: {
                    Label("Sort Visualisation", systemImage: "chart.bar.xaxis")
                        .frame(width: 200 , height: 50, alignment: .center)
                        .font(.system(size: 20))
                }
                .foregroundColor(.red)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .opacity(0.9)
                .shadow(radius: 10)
                
                // Button for Waste Sorting
                Button {
                    // Add Sound Effect
                    SoundManager.instance.playSound(sound: .button)
                    
                    // Add Animation
                    withAnimation() {
                        menuTwo = true
                        menu = false
                    }
                } label: {
                    Label("Bin Classification", systemImage: "trash")
                        .frame(width: 200 , height: 50, alignment: .center)
                        .font(.system(size: 20))
                }
                .foregroundColor(.red)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .opacity(0.9)
                .shadow(radius: 10)
                
            } else if menuOne {
                
                MenuViewOne()
                
                // Home Button
                Button {
                    // Add Sound Effect
                    SoundManager.instance.playSound(sound: .button)
                    
                    // Add Animation
                    withAnimation() {
                        menu = true
                        menuOne = false
                        menuTwo = false
                    }
                } label: {
                    Image(systemName: "house.circle")
                        .frame(width: 30 , height: 30)
                        .font(.system(size: 40))
                }
                .foregroundColor(.red)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .opacity(0.9)
                .shadow(radius: 10)
                .frame(alignment: .bottom)
                
            } else if menuTwo {
                
                MenuViewTwo()
                
                // Home Button
                Button {
                    // Add Sound Effect
                    SoundManager.instance.playSound(sound: .button)
                    
                    // Add Animation
                    withAnimation() {
                        menu = true
                        menuOne = false
                        menuTwo = false
                    }
                } label: {
                    Image(systemName: "house.circle")
                        .frame(width: 30 , height: 30)
                        .font(.system(size: 40))
                }
                .foregroundColor(.red)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .opacity(0.9)
                .shadow(radius: 10)
                .frame(alignment: .bottom)
            }
        }
    }
}
