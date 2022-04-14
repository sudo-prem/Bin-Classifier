//
//  BinClassify.swift
//  Sort and Classify
//
//  Created by Premnaath Varadharajan on 09/04/22.
//

import SwiftUI

struct BinClassify: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        VStack (spacing: 30){
            
            if uiImage != nil {
                Group {
                    Rectangle()
                        .overlay(
                            Group {
                                Image(uiImage: uiImage!)
                                    .resizable()
                                    .frame(width: 300, height: 240)
                                    .scaledToFit()
                            }
                        )
                        .frame(width: 300, height: 240)
                        .cornerRadius(16)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 7)
                )
            }
            
            Button {
                // Add Sound Effect
                SoundManager.instance.playSound(sound: .button)
                
                isPresenting = true
            } label: {
                Label("Detect Waste", systemImage: "camera.viewfinder")
                    .frame(width: 200 , height: 50, alignment: .center)
                    .font(.system(size: 20))
            }
            .foregroundColor(.red)
            .padding()
            .background(Color.white)
            .cornerRadius(50)
            .opacity(0.9)
            .shadow(radius: 10)
            
            
            if let imageClass = classifier.imageClass {
                
                VStack {
                    if Constants.K.wetWastes.contains(imageClass) {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.black)
                                .font(.system(size: 28, design: .rounded))
                            
                            Text("Black Bin - Wet Waste")
                                .font(.system(size: 21, design: .rounded))
                                .foregroundColor(Color.black)
                        }
                        
                        Text("Detected Object(s): \(imageClass)")
                            .foregroundColor(.black)
                            .font(.system(size: 17, design: .rounded))
                            .padding()
                        Text("As it is a Wet Waste, it can be disposed in the Black Bin.")
                            .foregroundColor(.black)
                            .font(.system(size: 17, design: .rounded))
                    } else if (Constants.K.electronicWastes.contains(imageClass)) {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.brown)
                                .font(.system(size: 28, design: .rounded))
                            
                            Text("Brown Bin - Electronic Waste")
                                .font(.system(size: 21, design: .rounded))
                                .foregroundColor(Color.brown)
                        }
                        
                        Text("Detected Object(s): \(imageClass)")
                            .foregroundColor(.brown)
                            .font(.system(size: 17, design: .rounded))
                            .padding()
                        Text("As it is an Electronic Waste, it can be disposed in the Brown Bin.")
                            .foregroundColor(.brown)
                            .font(.system(size: 17, design: .rounded))
                    } else if (Constants.K.paperWastes.contains(imageClass)) {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.blue)
                                .font(.system(size: 28, design: .rounded))
                            
                            Text("Blue Bin - Paper Waste")
                                .font(.system(size: 21, design: .rounded))
                                .foregroundColor(Color.blue)
                        }
                        
                        Text("Detected Object(s): \(imageClass)")
                            .foregroundColor(.blue)
                            .font(.system(size: 17, design: .rounded))
                            .padding()
                        Text("As it is a Paper Waste, it can be disposed in the Blue Bin.")
                            .foregroundColor(.blue)
                            .font(.system(size: 17, design: .rounded))
                    } else if (Constants.K.plasticWastes.contains(imageClass)) {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.yellow)
                                .font(.system(size: 28, design: .rounded))
                            
                            Text("Yellow Bin - Plastic Waste")
                                .font(.system(size: 21, design: .rounded))
                                .foregroundColor(Color.yellow)
                        }
                        
                        Text("Detected Object(s): \(imageClass)")
                            .foregroundColor(.yellow)
                            .font(.system(size: 17, design: .rounded))
                            .padding()
                        Text("As it is a Plastic Waste, it can be disposed in the Yellow Bin.")
                            .foregroundColor(.yellow)
                            .font(.system(size: 17, design: .rounded))
                    } else if (Constants.K.metalWastes.contains(imageClass)) {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.red)
                                .font(.system(size: 28, design: .rounded))
                            
                            Text("Red Bin - Metal Waste")
                                .font(.system(size: 21, design: .rounded))
                                .foregroundColor(Color.red)
                        }
                        
                        Text("Detected Object(s): \(imageClass)")
                            .foregroundColor(.red)
                            .font(.system(size: 17, design: .rounded))
                            .padding()
                        Text("As it is an Metal Waste, it can be disposed in the Red Bin.")
                            .foregroundColor(.red)
                            .font(.system(size: 17, design: .rounded))
                    } else if (Constants.K.glassWastes.contains(imageClass)) {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.green)
                                .font(.system(size: 28, design: .rounded))
                            
                            Text("Green Bin - Glass Waste")
                                .font(.system(size: 21, design: .rounded))
                                .foregroundColor(Color.green)
                        }
                        
                        Text("Detected Object(s): \(imageClass)")
                            .foregroundColor(.brown)
                            .font(.system(size: 17, design: .rounded))
                            .padding()
                        Text("As it is a Glass Waste, it can be disposed in the Green Bin.")
                            .foregroundColor(.brown)
                            .font(.system(size: 17, design: .rounded))
                    } else {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 28, design: .rounded))
                            
                            Text("Gray Bin - Other Waste")
                                .font(.system(size: 21, design: .rounded))
                                .foregroundColor(Color.gray)
                        }
                        
                        Text("Detected Object(s): \(imageClass)")
                            .foregroundColor(.gray)
                            .font(.system(size: 17, design: .rounded))
                            .padding()
                        Text("As it is of no specific category, it can be disposed in the Gray Bin.")
                            .foregroundColor(.gray)
                            .font(.system(size: 17, design: .rounded))
                    }
                }
                .font(.subheadline)
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .opacity(0.9)
                .shadow(radius: 10)
            } else {
                HStack {
                    Text(" ")
                        .font(.caption)
                }
                .font(.subheadline)
            }
        }
        .sheet(isPresented: $isPresenting){
            ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                .onDisappear{
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }
        }
    }
}
