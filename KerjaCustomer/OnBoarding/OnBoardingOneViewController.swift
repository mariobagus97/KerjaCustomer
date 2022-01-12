//
//  OnBoardingOneViewController.swift
//  SehatQ
//  Copyright © 2019 PT SehatQ Harsana Emedika. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingOneViewController: BaseOnBoardingContentViewController {
    @IBOutlet private weak var skipButton: UIButton!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTitle2: UILabel!
    @IBOutlet weak var lblTitlesub: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageIndex = 0
       
    }
    
    @IBAction private func skipButtonTapped(_ sender: UIButton) {
//        UIApplication.shared.keyWindow?.rootViewController = HomeWireframe.makeHomeView3RootController()
    }
    
}
