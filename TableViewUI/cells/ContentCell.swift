//
//  ContentCell.swift
//  TableViewUI
//
//  Created by Guihal Gwenn on 21/08/2019.
//  Copyright © 2019 Oui.sncf. All rights reserved.
//

import UIKit
import DataSourceUI

struct ContentAdapter: Adapter {
    public let color: Int
}

class ContentCell: Cell {
    var identifier: String = "UIContentCell"
    var adapter: ContentAdapter
    
    init(_ adapter: ContentAdapter) {
        self.adapter = adapter
    }
    
    func getAdapter() -> Adapter {
        return adapter
    }
}

class UIContentCell: UITableViewCell, UICell {

    @IBOutlet weak var view: UIView!
    
    func update(adapter: Adapter) {
        guard let adapter = adapter as? ContentAdapter else {
            fatalError()
        }
        view.backgroundColor = UIColor(rgbValue: adapter.color)
        
    }

}

extension UIColor {
    convenience init(rgbValue: Int) {
        let red =   CGFloat((rgbValue & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(rgbValue & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
