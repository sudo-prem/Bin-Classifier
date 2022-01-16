import SwiftUI
import ARKit
import RealityKit

struct SwiftUIARSCNView: UIViewRepresentable {
    let arKitSceneView = ARSCNView()
    
    func makeUIView(context: Context) -> ARSCNView {
        let config = ARWorldTrackingConfiguration()
        
        config.planeDetection = .horizontal
        config.environmentTexturing = .automatic
        
        if(ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh)) {
            config.sceneReconstruction = .mesh
        }
        
        arKitSceneView.session.run(config)
        
        return arKitSceneView
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {
    }
}


struct Insertion3D: View {
    let swiftUIARSCNView = SwiftUIARSCNView()
    
    var body: some View {
        ZStack {
            swiftUIARSCNView.edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            var data = DataFunctions().getData()
            var X: Float = 0.0
            var Y: CGFloat
            
            for num in data {
                Y = CGFloat(Float(num)/10)
                let cube = SCNBox(width: 0.05, height: Y, length: 0.05, chamferRadius: 0.01)
                
                let material = SCNMaterial()
                material.diffuse.contents = UIColor.red
                cube.materials = [material]
                
                let cubeNode = SCNNode(geometry: cube)
                cubeNode.position = SCNVector3(x: X, y: 0, z: Float(-0.7))
                cubeNode.name = "Cube\(num)"
                
                swiftUIARSCNView.arKitSceneView.scene.rootNode.addChildNode(cubeNode)
                X += 0.07
            }
        }
    }
}
