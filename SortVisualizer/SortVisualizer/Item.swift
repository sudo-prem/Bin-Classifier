//
//  Item.swift
//  ARSortVisualizer
//
//  Created by Premnaath Varadharajan on 06/12/21.
//

import Foundation
import CardSlider

// Sliding Cards for Time and Space Complexity
struct Item: CardSliderItem {
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}
