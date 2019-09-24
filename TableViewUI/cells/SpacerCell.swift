//
//  SpacerCell.swift
//  TableViewUI
//
//  Created by Guihal Gwenn on 26/08/2019.
//  Copyright © 2019 Oui.sncf. All rights reserved.
//

import UIKit
import DataSourceUI

struct SpacerAdapter: Adapter {
    public let value: CGFloat
    
    init(_ value: CGFloat) {
        self.value = value
    }
}

class Spacer: Cell {
    let identifier: String = "UISpacerCell"
    let adapter: SpacerAdapter
    
    func getAdapter() -> Adapter {
        return adapter
    }
    
    init(_ value: CGFloat = 8) {
        self.adapter = SpacerAdapter(value)
    }
}

class UISpacerCell: UITableViewCell, UICell {
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var view: UIView!
    
    func update(adapter: Adapter) {
        guard let adapter = adapter as? SpacerAdapter else {
            fatalError()
        }
        heightConstraint.constant = adapter.value
        setNeedsLayout()
        
    }

}
