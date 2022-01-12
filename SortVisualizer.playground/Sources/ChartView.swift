import SwiftUI
import PlaygroundSupport

struct dataStruct: Identifiable {
    let num: Int
    var id: String { "\(num)" }
}


struct GraphView: View {
    var data: [dataStruct]
    
    public var body: some View {
        HStack (alignment: .lastTextBaseline){
            ForEach(data) { d in
                let temp: CGFloat =  CGFloat(d.num * 10)
                
                VStack {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 30, height: temp)
                        .cornerRadius(5)
                        .shadow(radius: 3)
                    Text("\(d.num)")
                        .foregroundColor(Color.black)
                        .opacity(0.7)
                }
            }
        }
        .frame(width: 400, height: 200)
        .background(Color.white)
        .opacity(0.9)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

func getData() -> String {
    var data: String? = nil
    
    if let keyValue = PlaygroundKeyValueStore.current["dataset"],
       case .string(let animalType) = keyValue {
        data = animalType
    }
    
    return data ?? "1111111111"
}

func convertData(_ dataString: String) -> [Int]{
    var data = [Int]()
    
    for char in dataString {
        if let intValue = char.wholeNumberValue {
            data.append(intValue)
        }
    }
    
    return data
}

func convertDataStruct(_ data: [Int]) -> [dataStruct] {
    var res = [dataStruct]()
    
    for num in data {
        res.append(dataStruct(num: num))
    }
    
    return res
}

public struct ChartView: View {
    public init() { }
    
    public var body: some View {
        let dataString: String = getData()
        let data: [Int] = convertData(dataString)
        let myData: [dataStruct] = convertDataStruct(data)
        GraphView(data: myData)
    }  
}

