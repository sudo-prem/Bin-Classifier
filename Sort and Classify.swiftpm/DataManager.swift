//
//  DataManager.swift
//  Sort and Classify
//
//  Created by Premnaath Varadharajan on 08/04/22.
//

public struct DataManager {
    
    // Singleton
    public static let instance: DataManager = DataManager()
    
    // Stores data globally across all pages
    public func putData(data: [Int]) {
        Constants.K.randomData = data
    }
    
    // Retreives data from global pool
    public func getData() -> [Int] {
        return Constants.K.randomData
    }
}
