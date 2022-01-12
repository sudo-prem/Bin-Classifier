import SwiftUI
import PlaygroundSupport

public struct BubbleMainView: View {
    @State private var menuView = true
    @State private var view2D = false
    @State private var view3D = false
    
    public init() { }
    public var body: some View {
        VStack (spacing: 50) {
            // Heading in White font for Bubble
            Text("Bubble Sort")
                .fontWeight(.bold)
                .font(.system(size: 40, design: .rounded))
                .shadow(radius: 10)
            
            if(menuView) {
                // Display Chart
                ChartView()
                
                // Display Buttons
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
                
                
                Button {
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
                .buttonBorderShape(.capsule)
                .opacity(0.9)
                .shadow(radius: 10)
            } else if(view2D) {
                VStack (spacing: 50) {
                    // Sort in 2D
                    Bubble2D()
                    
                    // Back Button
                    Button {
                        withAnimation() {
                            menuView = true
                            view2D = false
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
                VStack (spacing: 50) {
                    // Sort in 3D
                    Bubble3D()
                    
                    // Back Button
                    Button {
                        withAnimation() {
                            menuView = true
                            view2D = false
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
            }
        }
    }
}
