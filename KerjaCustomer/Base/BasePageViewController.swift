//
//  BasePageViewController.swift
//  SehatQ
 //
//  Copyright © 2019 PT SehatQ Harsana Emedika. All rights reserved.
//

import Foundation
import UIKit

class BasePageViewController: UIPageViewController {
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey: Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
