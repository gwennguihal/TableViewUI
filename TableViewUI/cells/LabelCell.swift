//
//  LabelCell.swift
//  TableViewUI
//
//  Created by Guihal Gwenn on 21/08/2019.
//  Copyright © 2019 Oui.sncf. All rights reserved.
//

import UIKit
import DataSourceUI

protocol LabelAdapter: Adapter {
    var label: NSAttributedString { get }
}

struct LabelCell: Cell {
    var identifier: String = "UILabelCell"
    var adapter: LabelAdapter
    
    func getAdapter() -> Adapter {
        return adapter
    }
}

class UILabelCell: UITableViewCell, UICell {
    @IBOutlet weak var label: UILabel!
    
    func update(adapter: Adapter) {
        guard let adapter = adapter as? LabelAdapter else {
            fatalError()
        }
        label.attributedText = adapter.label
        
    }
}
