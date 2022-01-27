import SwiftUI
import PlaygroundSupport


public struct DataFunctions {
    // Public init to use in other views
    public init() { }
    
    // Stores data globally across all pages
    public func putData(data: [Int]) {
        // Convert [Int] to String
        let dataString = data.map { String($0) }
        let searchString: String = "dataset"
        var res: String = ""
        for num in dataString {
            res.append(num)
        }
        
        // Store resultant String in PlaygroundKeyValueStore
        PlaygroundKeyValueStore.current[searchString] = .string(res)
    }
    
    // Retreives data from global pool
    public func getData() -> [Int] {
        // Get string from PlaygroundKeyValueStore
        var dataString: String? = nil
        let searchString: String = "dataset"
        if let keyValue = PlaygroundKeyValueStore.current[searchString],
           case .string(let myData) = keyValue {
            dataString = myData
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
