//
//  OnBoardingTwoViewController.swift
//  SehatQ
 //
//  Copyright © 2019 PT SehatQ Harsana Emedika. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingTwoViewController: BaseOnBoardingContentViewController {
    @IBOutlet private weak var bottomButton: UIButton!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTitlesub: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageIndex = 1
//        self.lblTitle.text = LocalizationKey.Common.onboarding2TitleV2.localizedString()
//        self.lblTitlesub.text = LocalizationKey.Common.onboarding2TitleSubV2.localizedString()
    }

    @IBAction private func bottomButtonTapped(_ sender: UIButton) {
//        UIApplication.shared.keyWindow?.rootViewController = HomeWireframe.makeHomeView3RootController()
    }

}
