import SwiftUI
import PlaygroundSupport

public struct MenuView: View {
    // Boolean values to show and hide view
    @State private var menuView = true
    @State private var view2D = false
    @State private var view3D = false
    @State private var showChart = false
    var sorts = ["Bubble", "Insertion", "Merge"]
    @State private var selectedSort = "Bubble"
    
    public init() { }
    
    private func makeList(_ n: Int) -> [Int] {
        return Array(1...n).shuffled()
    }
    
    public var body: some View {
        ZStack {
            
            // Background Animation
            if(selectedSort == "Bubble"){
                withAnimation() {
                    BackgroundAnimation(shape: "Circle")
                }
            } else if(selectedSort == "Insertion") {
                withAnimation() {
                    BackgroundAnimation(shape: "Rectangle")
                }
            } else if(selectedSort == "Merge") {
                withAnimation() {
                    BackgroundAnimation(shape: "Triangle")
                }
            }
            
            // Main Menu
            VStack (spacing: 50) {
                // Main Menu
                if(menuView) {
                    
                    // Title
                    Text("Sorting Visualiser")
                        .fontWeight(.bold)
                        .font(.system(size: 40, design: .rounded))
                        .shadow(radius: 10)
                    
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
                            DataManager().putData(data: randomData)
                            
                            withAnimation() {
                                showChart.toggle()
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
                    
                    // Button for 2D
                    Button {
                        // Add Sound Effect
                        SoundManager.instance.playSound(sound: .button)
                        
                        // Add Animation
                        withAnimation() {
                            menuView = false
                            view2D = true
                        }
                    } label: {
                        Label("Sort in 2D", systemImage: "chart.bar.xaxis")
                            .frame(width: 200 , height: 50, alignment: .center)
                            .font(.system(size: 20))
                    }
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .shadow(radius: 10)
                    
                    // Button for 3D
                    Button {
                        // Add Sound Effect
                        SoundManager.instance.playSound(sound: .button)
                        
                        // Add Animation
                        withAnimation() {
                            menuView = false
                            view3D = true
                        }
                    } label: {
                        Label("Sort in 3D", systemImage: "scale.3d")
                            .frame(width: 200 , height: 50, alignment: .center)
                            .font(.system(size: 20))
                    }
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .opacity(0.9)
                    .shadow(radius: 10)
                } else if(view2D) {
                    VStack (spacing: 50) {
                        // Title
                        Text("Visualising in 2D")
                            .fontWeight(.bold)
                            .font(.system(size: 40, design: .rounded))
                            .shadow(radius: 10)
                        
                        // Sort
                        if( selectedSort == "Bubble") {
                            Bubble2D()
                        } else if(selectedSort == "Insertion") {
                            Insertion2D()
                        } else if(selectedSort == "Merge") {
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
                } else if(view3D) {
                    ZStack {
                        // Sort
                        if( selectedSort == "Bubble") {
                            Bubble3D()
                        } else if(selectedSort == "Insertion") {
                            Insertion3D()
                        } else if(selectedSort == "Merge") {
                            Merge3D()
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
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(20)
                    }
                }
            }
        }
    }
}
