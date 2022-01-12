//
//  OnBoardingViewController.swift
//  SehatQ
//  Copyright © 2019 PT SehatQ Harsana Emedika. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingViewController: BaseViewController {
    @IBOutlet var pageControl: UIPageControl!
    var pageViewController: UIPageViewController?
    let viewControllers: [UIViewController] = [OnBoardingWireframe.makeOnBoardingOneView(),
                                               OnBoardingWireframe.makeOnBoardingTwoView(),
                                               OnBoardingWireframe.makeOnBoardingThreeView()]
    var pendingPageIndex = 0
    
    let viewModel = OnBoardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    func setupUI() {
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 0
        
        pageViewController = BasePageViewController()
        if let validPageViewController = self.pageViewController {
            validPageViewController.delegate = self
            validPageViewController.dataSource = self
            validPageViewController.setViewControllers([self.viewControllers[0]], direction: .forward, animated: true, completion: nil)
            
            addChild(validPageViewController)
            view.addSubview(validPageViewController.view)
            validPageViewController.didMove(toParent: self)
        }
        self.view.bringSubviewToFront(pageControl)
    }
    
    private func bindViewModel() {
        // TODO: - move to AppDelegate
        if !viewModel.getOnBoardingViewCache() {
            viewModel.setOnBoardingViewCache(hasPresent: true)
        } else {
            gotoMainTabbar()
        }
    }
    
    private func gotoMainTabbar() {
        self.dismiss(animated: false, completion: nil)
//        UIApplication.shared.keyWindow?.rootViewController = HomeWireframe.makeHomeView3RootController()
    }
}

extension OnBoardingViewController: UIPageViewControllerDelegate {
    
    /** Will transition, so keep the page where it goes */
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if pendingViewControllers.count > 0, let vc = pendingViewControllers[0] as? BaseOnBoardingContentViewController {
            pendingPageIndex = vc.pageIndex
        }
    }
    
    /** Did finish the transition, so set the page where was going */
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let vc = previousViewControllers.first, let baseVc = vc as? BaseOnBoardingContentViewController {
//            SQLogger.log(baseVc.pageIndex)
            if completed {
                pageControl.currentPage = pendingPageIndex
            }
        }
    }
}

extension OnBoardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? { //return nil if viewController is first
        if let vc = viewController as? BaseOnBoardingContentViewController {
            if (vc.pageIndex == NSNotFound || vc.pageIndex == 0) {
                return nil
            } else {
                return self.viewControllers[vc.pageIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? { //return nil if viewController is last
        if let vc = viewController as? BaseOnBoardingContentViewController {
            if (vc.pageIndex == NSNotFound || vc.pageIndex == 2) {
                return nil
            } else {
                return self.viewControllers[vc.pageIndex + 1]
            }
        }
        return nil
    }
    
}
