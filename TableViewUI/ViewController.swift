//
//  ViewController.swift
//  TableViewUI
//
//  Created by Guihal Gwenn on 21/08/2019.
//  Copyright © 2019 Oui.sncf. All rights reserved.
//

import UIKit
import DataSourceUI

class ViewController: UIViewController {

    var model = Model()
    
    lazy var dataSource = DataSource {
        
        self.model.sections.ui.map { section in
            AnySection {
                LabelCell(adapter: TitleAdapter(label: section.title))
//                section.subTitle.ui.iflet { subTitle -> Content in
//                    Container {
//                        LineCell()
//                        LabelCell(adapter: SubtitleAdapter(label: subTitle))
//                        LineCell()
//                    }
//                }
                IfLet(section.subTitle) { subtitle in
                    LineCell()
                }
                section.colors.ui.map { color in
                    ContentCell(adapter: ContentAdapter(color: color))
                }
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
    }


}

