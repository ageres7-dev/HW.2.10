//
//  DetailsViewController.swift
//  HW.2.10
//
//  Created by Сергей on 15.11.2020.
//

import UIKit

class DetailsViewController: UIViewController {
    var result: Results!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = result.name
        

        // Do any additional setup after loading the view.
    }

}
