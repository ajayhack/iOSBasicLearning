//
//  ColorDetailVC.swift
//  iOSBasicLearning
//
//  Created by Ajay Thakur on 12/03/24.
//

import UIKit

class ColorDetailVC: UIViewController {
   
    var color : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
    }
}
