//
//  HitsDetailViewController.swift
//  Swift+MVVM
//
//  Created by PCQ188 on 03/04/20.
//  Copyright © 2020 PCQ188. All rights reserved.
//

import UIKit

class HitsDetailViewController: BaseViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var createdAtDateLabel: UILabel!
    
    var viewModel: HitsDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        setUpData()
        setUpUI()
    }
    
    fileprivate func setUpUI() {
        self.title = "Hits"
        backButton()
        enableBackGestues()
    }
    
    fileprivate func setUpData() {
        titleLabel.text = viewModel?.title
        createdAtDateLabel.text = DateExtension.changeDateformatterForString(fromDate: viewModel?.date ?? "", currentFormat: dateFormats.hitsResponseDate, with: dateFormats.hitsDisplayDate)
    }
    
}
