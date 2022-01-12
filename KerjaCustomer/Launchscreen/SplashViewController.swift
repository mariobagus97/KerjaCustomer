//
//  ViewController.swift
//  KerjaCustomer
//
//  Created by SehatQ on 12/01/22.
//

import UIKit

class SplashViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        UIApplication.shared.keyWindow?.rootViewController = OnBoardingWireframe.makeOnBoardingView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.keyWindow?.rootViewController = OnBoardingWireframe.makeOnBoardingView()
    }
    
}

