//
//  ViewController.swift
//  PlaceholderViewExample
//
//  Created by Bruno Rocha on 5/14/17.
//  Copyright © 2017 Bruno Rocha. All rights reserved.
//

import UIKit
import SlidingGradientView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let placeHolder = SlidingGradientView(image: UIImage(named: "placeholderEvents"))
        view.addSubview(placeHolder)
        placeHolder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeHolder.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            placeHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            placeHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        placeHolder.startAnimating()
        
        
        let slidingProperties = SlidingProperties(fromPercentage: 50, toPercentage: 100, animationDuration: 3)
        let gradientColors = [GradientColor(color: UIColor.white.withAlphaComponent(0), location: 0),
                              GradientColor(color: UIColor.red, location: 0.5),
                              GradientColor(color: UIColor.white.withAlphaComponent(0), location: 1)]
        let properties = GradientProperties(gradientWidth: 300, gradientColors: gradientColors, slidingProperties: slidingProperties)
        
        let placeHolder2 = SlidingGradientView(image: UIImage(named: "placeholderEvents"), properties: properties)
        view.addSubview(placeHolder2)
        placeHolder2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeHolder2.topAnchor.constraint(equalTo: placeHolder.bottomAnchor, constant: 16),
            placeHolder2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            placeHolder2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        placeHolder2.startAnimating()
    }
}
