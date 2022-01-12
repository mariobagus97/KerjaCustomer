//
//  OnBoardingViewModel.swift
//  SehatQ
//
//  Created by SehatQ on 14/07/20.
//  Copyright © 2020 PT SehatQ Harsana Emedika. All rights reserved.
//

import Foundation

class OnBoardingViewModel {
    private let userDefault: UserDefaults
    private let hasPresenteKey: String = "hasPresentKey"
    
    init(userDefault: UserDefaults = UserDefaults.standard) {
        self.userDefault = userDefault
    }
    
    func setOnBoardingViewCache(hasPresent: Bool) {
        userDefault.set(hasPresent, forKey: hasPresenteKey)
        userDefault.synchronize()
    }
    
    func getOnBoardingViewCache() -> Bool {
        return userDefault.bool(forKey: hasPresenteKey)
    }
}
