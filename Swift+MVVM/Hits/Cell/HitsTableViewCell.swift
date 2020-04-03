//
//  PostTableViewCell.swift
//  EngineeringAITest
//
//  Created by PCQ188 on 26/02/20.
//  Copyright © 2020 PCQ188. All rights reserved.
//

import UIKit

class HitsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
    var switchClicked: (() -> ()) = { }

    var hit: Hits? {
        didSet {
            if let hit = hit {
                self.labelTitle.text = hit.title ?? ""
                self.labelDate.text = hit.createdAt ?? ""
                self.switchToggle.isOn = hit.isSelected
            }
        }
    }
    @IBAction func didClickSwitch(_ sender: Any) {
        switchClicked()
    }
    
}
