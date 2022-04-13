//
//  MenuViewOne.swift
//  Sort and Classify
//
//  Created by Premnaath Varadharajan on 09/04/22.
//

import SwiftUI

public struct MenuViewOne: View {
    
    // Boolean values to show and hide view
    @State private var menuView = true
    @State private var view2D = false
    @State private var view3D = false
    @State private var showChart = false
    @State private var visButtons = false
    var sorts = ["Bubble Sort", "Insertion Sort", "Merge Sort"]
    @State private var selectedSort = "Bubble Sort"
    
    public init() { }
    
    private func makeList(_ n: Int) -> [Int] {
        return Array(1...n).shuffled()
    }
    
    public var body: some View {
        
        // Main Menu
        VStack (spacing: 40) {
            
            // Title
            Text("Sorting Visualiser")
                .fontWeight(.bold)
                .font(.system(size: UIScreen.screenHeight/20, design: .rounded))
                .shadow(radius: 10)
                .foregroundColor(Color.white)
                .padding(.top, 49)
            
            // Main Menu
            if (menuView) {
                
                // Algorithm Picker
                Group {
                    Picker(
                        "Pick an Algorithm", selection: $selectedSort,
                        content : {
                            ForEach(sorts, id: \.self) {
                                Text($0)
                                    .foregroundColor(Color.red)
                            }
                        }
                    ).pickerStyle(WheelPickerStyle())
                        .frame(width: 300, height: 150)
                        .font(.system(size: 50))
                        .clipped()
                        .colorMultiply(.white)
                }.background(Color.white.opacity(0.85))
                    .frame(width: 310, height: 150)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                
                if showChart {
                    VStack (alignment: .center, spacing: -25) {
                        // Display Chart
                        ChartView()
                        
                        Button {
                            // Add Sound Effect
                            SoundManager.instance.playSound(sound: .button)
                            
                            // Add Animation
                            withAnimation() {
                                showChart = false
                                visButtons = false
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .frame(width: 14 , height: 14)
                                .font(.system(size: 35))
                        }
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(50)
                        .opacity(0.95)
                        .shadow(radius: 10)
                    }
                    
                    
                } else {
                    Button {
                        // Add Sound Effect
                        SoundManager.instance.playSound(sound: .button)
                        
                        // Generate string with random number
                        let randomData = makeList(9)
                        
                        // Stores data globally
                        Constants.K.randomData = randomData
                        
                        withAnimation() {
                            showChart = true
                            visButtons = true
                        }
                    } label: {
                        Label("Generate Dataset", systemImage: "wand.and.stars")
                            .frame(width: 200 , height: 50, alignment: .center)
                            .font(.system(size: 20))
                    }
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .shadow(radius: 10)
                }
                
                if visButtons {
                    HStack (spacing: 40) {
                        
                        // Visualise in 2D
                        Button {
                            // Add Sound Effect
                            SoundManager.instance.playSound(sound: .button)
                            
                            // Add Animation
                            withAnimation() {
                                menuView = false
                                view2D = true
                            }
                        } label: {
                            Label("Visualise in 2D", systemImage: "chart.bar.xaxis")
                                .frame(width: 154 , height: 35, alignment: .center)
                                .font(.system(size: 17))
                        }
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(50)
                        .opacity(0.9)
                        .shadow(radius: 10)
                        
                        // Visualise in 3D
                        Button {
                            // Add Sound Effect
                            SoundManager.instance.playSound(sound: .button)
                            
                            // Add Animation
                            withAnimation() {
                                menuView = false
                                view3D = true
                            }
                        } label: {
                            Label("Visualise in 3D", systemImage: "cube.transparent")
                                .frame(width: 154 , height: 35, alignment: .center)
                                .font(.system(size: 17))
                        }
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(50)
                        .opacity(0.9)
                        .shadow(radius: 10)
                    }
                }
                
            } else if(view2D) {
                VStack (spacing: 40) {
                    
                    // Sort in 2D
                    if( selectedSort == "Bubble Sort") {
                        Bubble2D()
                    } else if(selectedSort == "Insertion Sort") {
                        Insertion2D()
                    } else if(selectedSort == "Merge Sort") {
                        Merge2D()
                    }
                    
                    // Back Button
                    Button {
                        // Add Sound Effect
                        SoundManager.instance.playSound(sound: .button)
                        
                        // Add Animation
                        withAnimation() {
                            view2D = false
                            menuView = true
                        }
                    } label: {
                        Image(systemName: "arrow.uturn.backward.circle.fill")
                            .frame(width: 30 , height: 30)
                            .font(.system(size: 40))
                    }
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .shadow(radius: 10)
                }
            } else if (view3D) {
                VStack (spacing: 40) {
                    
                    // Sort in 3D
                    if( selectedSort == "Bubble Sort") {
                        Bubble3D()
                            .padding(.leading, 49)
                            .padding(.trailing, 49)
                            .shadow(radius: 10)
                    } else if(selectedSort == "Insertion Sort") {
                        Insertion3D()
                            .padding(.leading, 49)
                            .padding(.trailing, 49)
                            .shadow(radius: 10)
                    } else if(selectedSort == "Merge Sort") {
                        Merge3D()
                            .padding(.leading, 49)
                            .padding(.trailing, 49)
                            .shadow(radius: 10)
                    }
                    
                    // Back Button
                    Button {
                        // Add Sound Effect
                        SoundManager.instance.playSound(sound: .button)
                        
                        // Add Animation
                        withAnimation() {
                            view3D = false
                            menuView = true
                        }
                    } label: {
                        Image(systemName: "arrow.uturn.backward.circle.fill")
                            .frame(width: 30 , height: 30)
                            .font(.system(size: 40))
                    }
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .shadow(radius: 10)
                }
            }
        }
    }
}

