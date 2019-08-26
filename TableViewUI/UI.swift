//
//  UI.swift
//  TableViewUI
//
//  Created by Guihal Gwenn on 21/08/2019.
//  Copyright © 2019 Oui.sncf. All rights reserved.
//

import Foundation
import DataSourceUI
import UIKit

struct AnySection: Section {
    var cells: [Int : Cell]
}

struct TitleAdapter: LabelAdapter {
    var label: NSAttributedString
    init(label: String) {
        self.label = NSAttributedString(string: label,
                                        attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 34, weight: .bold),
                                                     NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}

struct SubtitleAdapter: LabelAdapter {
    var label: NSAttributedString
    init(label: String) {
        self.label = NSAttributedString(string: label,
                                        attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular),
                                                     NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}
