import SwiftUI
import PlaygroundSupport

public struct InsertionMenu: View {
    @State private var BG = true
    @State private var menuView = true
    @State private var view2D = false
    @State private var view3D = false
    
    public init() { }
    public var body: some View {
        ZStack {
            if BG {
                BackgroundAnimation()
            }
            VStack (spacing: 50) {
                // Main Menu
                if(menuView) {
                    // Title
                    Text("Insertion Sort")
                        .fontWeight(.bold)
                        .font(.system(size: 40, design: .rounded))
                        .shadow(radius: 10)
                    
                    // Display Chart
                    GenerateData()
                    
                    // Button for 2D
                    Button {
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
                    .buttonBorderShape(.capsule)
                    .opacity(0.9)
                    .shadow(radius: 10)
                    
                    // Button for 3D
                    Button {
                        withAnimation() {
                            BG = false
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
                    .buttonBorderShape(.capsule)
                    .opacity(0.9)
                    .shadow(radius: 10)
                } else if(view2D) {
                    VStack (spacing: 50) {
                        // Title
                        Text("Insertion Sort")
                            .fontWeight(.bold)
                            .font(.system(size: 40, design: .rounded))
                            .shadow(radius: 10)
                        
                        // Sort in 2D
                        Insertion2D()
                        
                        // Back Button
                        Button {
                            withAnimation() {
                                menuView = true
                                view2D = false
                                view3D = false
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
                        .buttonBorderShape(.capsule)
                        .opacity(0.9)
                        .shadow(radius: 10)
                    }
                } else if(view3D) {
                    ZStack {
                        Insertion3D()
                        
                        // Back Button
                        Button {
                            withAnimation() {
                                menuView = true
                                view2D = false
                                view3D = false
                                BG = true
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
                        .buttonBorderShape(.capsule)
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

