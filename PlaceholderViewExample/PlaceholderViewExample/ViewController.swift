//
//  ViewController.swift
//  PlaceholderViewExample
//
//  Created by Bruno Rocha on 5/14/17.
//  Copyright © 2017 Bruno Rocha. All rights reserved.
//

import UIKit
import PlaceholderLoadingView

class ViewController: UIViewController {

    let placeHolder = PlaceholderLoadingView(image: UIImage(named: "placeholderEvents"), properties: .default)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(placeHolder)
        placeHolder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeHolder.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            placeHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            placeHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        placeHolder.startAnimating()
    }
}
