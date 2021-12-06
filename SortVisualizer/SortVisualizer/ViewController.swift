//
//  ViewController.swift
//  ARSortVisualizer
//
//  Created by Premnaath Varadharajan on 06/12/21.
//

import UIKit
import CardSlider

class ViewController: UIViewController, CardSliderDataSource {
    // Buttons Outlet
    @IBOutlet var TCButton: UIButton!
    @IBOutlet var SAButton: UIButton!
    
    // Data for Card Slides
    var data = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sort Visualizer"
        
        // Set background gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemGray6.cgColor,
            UIColor.systemOrange.cgColor,
        ]
        view.layer.insertSublayer(gradientLayer, at:0)
        
        // Add slides to TCView
        data.append(Item(image: UIImage(named: "TC")!,
                         rating: nil,
                         title: "What is Time Complexity?",
                         subtitle: "",
                         description: "About \nTime Complexity"))
        
        data.append(Item(image: UIImage(named: "SC")!,
                         rating: nil,
                         title: "What is Space Complexity?",
                         subtitle: "",
                         description: "About \nSpace Complexity"))
    }
    
    @IBAction func TCClick(_ sender: Any) {
        let vc = CardSliderViewController.with(dataSource: self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func item(for index: Int) -> CardSliderItem {
        return data[index]
    }
    
    func numberOfItems() -> Int {
        return data.count
    }
    
    @IBAction func SAClick(_ sender: Any) {
        print("Hello Prem!")
    }
}

