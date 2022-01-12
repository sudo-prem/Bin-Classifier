import SwiftUI
import PlaygroundSupport


public struct DataFunctions {
    
    public init() { }
    
    // Stores data globally across all pages
    public func putData(data: [Int]) {
        // Convert [Int] to String
        var dataString = data.map { String($0) }
        var res: String = ""
        for num in dataString {
            res.append(num)
        }
        
        // Store resultant String in PlaygroundKeyValueStore
        PlaygroundKeyValueStore.current["dataset"] = .string(res)
    }
    
    // Retreives data from global pool
    public func getData() -> [Int] {
        // Get string from PlaygroundKeyValueStore
        var dataString: String? = nil
        if let keyValue = PlaygroundKeyValueStore.current["dataset"],
           case .string(let animalType) = keyValue {
            dataString = animalType
        }
        
        // Convert String to [Int]
        var data = [Int]()
        for char in dataString! {
            if let intValue = char.wholeNumberValue {
                data.append(intValue)
            }
        }
        
        return data
    }
}
