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
                Label("Detect Waste", systemImage: "trash.fill")
                    .frame(width: 200 , height: 50, alignment: .center)
                    .font(.system(size: 20))
            }
            .foregroundColor(.red)
            .padding()
            .background(Color.white)
            .cornerRadius(50)
            .opacity(0.9)
            .shadow(radius: 10)
            
            
            Group {
                if let imageClass = classifier.imageClass {
                    HStack{
                        Text("Detected Object: ")
                            .font(.caption)
                        Text(imageClass)
                            .bold()
                    }
                    .font(.subheadline)
                    .padding()
                } else {
                    HStack {
                        Text(" ")
                            .font(.caption)
                    }
                    .font(.subheadline)
                }
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
