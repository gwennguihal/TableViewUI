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
                
                SpacerCell()
                LabelCell(adapter: TitleAdapter(label: section.title))
                
                section.subTitle.ui.iflet {
                    SpacerCell()
                    LineCell()
                    LabelCell(adapter: SubtitleAdapter(label: $0))
                }
                SpacerCell()
                section.colors.ui.map {
                    ContentCell(adapter: ContentAdapter(color: $0))
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

