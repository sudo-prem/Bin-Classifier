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
        
        ZStack {
            
            BackgroundAnimation(shape: "Circle")
            
            VStack (spacing: 30) {
                if menu {
                    
                    // Title
                    Text("Sort and Classify")
                        .fontWeight(.bold)
                        .font(.system(size: UIScreen.screenHeight/20, design: .rounded))
                        .shadow(radius: 10)
                        .foregroundColor(Color.white)
                        .padding(.top, 49)
                    
                    // Button for Sort Visualisation
                    Button {
                        // Add Sound Effect
                        SoundManager.instance.playSound(sound: .button)
                        
                        // Add Animation
                        withAnimation() {
                            menu = false
                            menuOne = true
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
                            menu = false
                            menuTwo = true
                        }
                    } label: {
                        Label("Bin Classification", systemImage: "trash.fill")
                            .frame(width: 200 , height: 50, alignment: .center)
                            .font(.system(size: 20))
                    }
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .shadow(radius: 10)
                    .padding(.bottom, 49)
                    
                } else if menuOne {
                    
                    MenuViewOne()
                        .padding(.top, 49)
                    
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
                    .padding(.bottom, 49)
                    
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
                    .padding(.bottom, 49)
                }
            }
        }
    }
}
