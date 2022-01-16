import SwiftUI
import PlaygroundSupport


public struct ChartView: View {
    public init() { }
    
    public var body: some View {
        let data: [Int] = DataFunctions().getData()
        
        HStack (alignment: .lastTextBaseline){
            ForEach(0..<data.count) { d in
                let temp: CGFloat =  CGFloat(data[d] * 10)
                VStack {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 30, height: temp)
                        .cornerRadius(5)
                        .shadow(radius: 3)
                    Text("\(data[d])")
                        .foregroundColor(Color.black)
                        .opacity(0.7)
                }
            }
        }
        .frame(width: 400, height: 200)
        .background(Color.white)
        .opacity(0.85)
        .cornerRadius(15)
        .shadow(radius: 10)
    }  
}

