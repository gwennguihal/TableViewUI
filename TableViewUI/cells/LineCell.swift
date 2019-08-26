//
//  LineCell.swift
//  TableViewUI
//
//  Created by Guihal Gwenn on 21/08/2019.
//  Copyright © 2019 Oui.sncf. All rights reserved.
//

import UIKit
import DataSourceUI

struct LineAdapter: Adapter {
    public let color: UIColor
    
    init(color: UIColor = .white) {
        self.color = color
    }
}

struct LineCell: Cell {
    let identifier: String = "UILineCell"
    var adapter: LineAdapter
    
    func getAdapter() -> Adapter {
        return adapter
    }
    
    init(adapter: LineAdapter = LineAdapter()) {
        self.adapter = adapter
    }
}

class UILineCell: UITableViewCell, UICell {

    @IBOutlet weak var view: UIView!
    
    func update(adapter: Adapter) {
        guard let adapter = adapter as? LineAdapter else {
            fatalError()
        }
        view.backgroundColor = adapter.color
        
    }

}
