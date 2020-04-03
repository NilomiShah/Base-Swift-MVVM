//
//  BaseViewController.swift
//  Swift+MVVM
//
//  Created by PCQ188 on 01/04/20.
//  Copyright © 2020 PCQ188. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.configureSolidNavigationBar()
    }
    
    func enableBackGestues() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    @objc func popViewController() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    func backButton() {
        self.navigationItem.leftBarButtonItem =  UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(popViewController))
    }
}
extension BaseViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.navigationController?.viewControllers.count ?? 0 > 1
    }
}
