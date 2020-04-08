//
//  HitsViewModel.swift
//  Swift+MVVM
//
//  Created by PCQ188 on 01/04/20.
//  Copyright © 2020 PCQ188. All rights reserved.
//

import UIKit

class HitsViewModel {
    
    var arrHits: [Hits] = []
    var currentPageNumber: Int = 0
    var totalPage: Int = 0
    var isLoadMore: Bool = false
    
    func hitsApiCall(_ success: @escaping (_ isSuccess: Bool) -> Void, _ failure: @escaping (_ error: APICallError) -> Void) {
        APIManager.shared.callRequest(model: ListModel.self, APIRouter.hitList(pageNum: currentPageNumber), onSuccess: { (response) in
            if let hits = response?.hits {
                    if self.currentPageNumber == 0 {
                        self.arrHits.removeAll()
                    }
                    self.arrHits.append(contentsOf: hits)
                    self.totalPage = response?.totalPages ?? 0
                    
                    if (self.currentPageNumber == (self.totalPage - 1)) {
                        self.isLoadMore = false
                    } else {
                        self.isLoadMore = true
                    }
                    success(true)

                }
            
        }, onFailure: { (apiErrorResponse) in
            failure(apiErrorResponse)
        })
    }
    
    func setTitle() -> String {
        var title = ""
        let selectedValue = self.arrHits.filter({$0.isSelected == true })
        title = selectedValue.count < 2 ? "Number of Post: \(selectedValue.count)" : "Number of Posts: \(selectedValue.count)"
        return title
    }
    
    func setSelected(_ index: Int) -> Bool {
        self.arrHits[index].isSelected = !(self.arrHits[index].isSelected)
        return self.arrHits[index].isSelected
    }
}
