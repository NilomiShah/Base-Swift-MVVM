//
//  HitsViewModel.swift
//  Swift+MVVM
//
//  Created by PCQ188 on 01/04/20.
//  Copyright © 2020 PCQ188. All rights reserved.
//

import UIKit

class HitsViewModel: BaseViewModel {
    var arrHits: [Hits] = []
    
    func hitsApiCall(_ success: @escaping (_ isSuccess: Bool) -> Void, _ failure: @escaping (_ error: APICallError) -> Void) {
        APIManager.shared.callRequest(model: ListModel.self, APIRouter.hitList(pageNum: 1), onSuccess: { (response) in
            self.arrHits = response?.hits ?? []
            success(true)
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
