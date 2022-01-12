//
//  OnBoardingThreeViewController.swift
//  SehatQ
//
//  Created by SehatQ on 18/01/21.
//  Copyright © 2021 PT SehatQ Harsana Emedika. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingThreeViewController: BaseOnBoardingContentViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTitleSub: UILabel!
    @IBOutlet weak var halamanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.pageIndex = 2
    }
    
    private func setupUI() {
//        self.halamanButton.layer.shadowColor = Constants.Colors.SeaColor.color().withAlphaComponent(1).cgColor
//        self.halamanButton.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        self.halamanButton.layer.shadowOpacity = 0.5
//        self.halamanButton.layer.shadowRadius = 9.0 / 2.0
//        self.halamanButton.layer.masksToBounds = false
    }
    
    @IBAction func navigateToHome(_ sender: Any) {
//        UIApplication.shared.keyWindow?.rootViewController = HomeWireframe.makeHomeView3RootController()
    }
}
