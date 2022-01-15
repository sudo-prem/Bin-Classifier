import SwiftUI
import ARKit
import RealityKit
import PlaygroundSupport

// Create an ARView
let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)

// Create an Object to place in AR
let mesh = MeshResource.generateBox(size: 0.2)
let material = SimpleMaterial(color: .blue, roughness: 0.5, isMetallic: true)
let modelEntity = ModelEntity(mesh: mesh, materials: [material])
let anchorEntity = AnchorEntity(plane: .horizontal)
//anchorEntity.addChild(modelEntity)
//arView.scene.addAnchor(anchorEntity)



//public struct Insertion3D: View{
//    
//    public var body: some View {
//        
//        Text("Insertion3D")
//    }
//}
