import SwiftUI
import ARKit
import RealityKit

struct SwiftUIARSCNViewMerge: UIViewRepresentable {
    @Binding var refresh: Bool
    let arKitSceneView = ARSCNView(frame: .zero)
    
    func makeUIView(context: Context) -> ARSCNView {
        let config = ARWorldTrackingConfiguration()
        arKitSceneView.session.run(config)
        
        return arKitSceneView
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {
        if refresh {
            // Remove all SCNodes
            arKitSceneView.scene.rootNode.enumerateChildNodes { (node, stop) in
                node.removeFromParentNode()
            }
            
            let data = DataManager().getData()
            if data == data.sorted() {
                plotGraph(color: UIColor.green)
                
                // Add Sound Effect
                SoundManager.instance.playSound(sound: .bell)
            } else {
                plotGraph(color: UIColor.red)
            }
        }
    }
    
    func plotGraph(color: UIColor) {
        let data = DataManager().getData()
        var X: Float = -0.3
        var Y: CGFloat
        
        for num in data {
            Y = CGFloat(Float(num)/14)
            let cube = SCNBox(width: 0.06, height: Y, length: 0.06, chamferRadius: 0.01)
            
            let material = SCNMaterial()
            material.diffuse.contents = color
            cube.materials = [material]
            
            let cubeNode = SCNNode(geometry: cube)
            cubeNode.position = SCNVector3(x: X, y: Float((Y-0.9)/2), z: Float(-1.4))
            
            self.arKitSceneView.scene.rootNode.addChildNode(cubeNode)
            X += 0.09
        }
    }
}


struct Merge3D: View {
    @State private var refresh = false
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            let swiftUIARSCNView = SwiftUIARSCNViewMerge(refresh: $refresh)
            swiftUIARSCNView.edgesIgnoringSafeArea(.all)
            
            // Button to refresh view
            Button (action: {
                // Add Sound Effect
                SoundManager.instance.playSound(sound: .arbutton)
                
                mergeSort(data: DataManager().getData())
                refresh.toggle()
                
                if(refresh == false) {
                    refresh.toggle()
                }
            })
            {
                // Style the button
                Image(systemName: "cube.transparent")
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
            .padding(100)
        }
        .onReceive(
            timer, perform: { _ in
                if self.refresh == true {
                    refresh = false
                }
            }
        )
    }
}
