//
//  ViewController.swift
//  TestE3Kit
//
//  Created by Yevhen Pyvovarov on 06.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let ethreeTester = EThreeTester()
        ethreeTester.initUser()
    }
}

