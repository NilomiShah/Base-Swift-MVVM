//
//  HitsDetailViewModel.swift
//  Swift+MVVM
//
//  Created by PCQ188 on 03/04/20.
//  Copyright © 2020 PCQ188. All rights reserved.
//

import Foundation

class HitsDetailViewModel: BaseViewModel {
    var title: String?
    var date: String?
    
    init(title: String, date: String) {
        self.title = title
        self.date = date
    }
}
