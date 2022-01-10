import SwiftUI
import PlaygroundSupport

public struct BubbleMainView: View {
    
    public init() { }
    public var body: some View {
        ZStack {
            VStack (spacing: 50) {
                // Display bar chart
                
                
                Button {
                    // 
                } label: {
                    Label("Visualize in 2D", systemImage: "chart.bar.xaxis")
                        .frame(width: 200 , height: 50, alignment: .center)
                        .font(.system(size: 20))
                }
                .foregroundColor(.red)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .buttonBorderShape(.capsule)
                .opacity(0.9)
                
                
                Button {
                    
                } label: {
                    Label("Visualize in 3D", systemImage: "scale.3d")
                        .frame(width: 200 , height: 50, alignment: .center)
                        .font(.system(size: 20))
                }
                .foregroundColor(.red)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .buttonBorderShape(.capsule)
                .opacity(0.9)
            }
        }
    }
}



