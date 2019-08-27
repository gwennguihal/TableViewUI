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

    let model = Model()
    
    lazy var dataSource = DataSource {
        
        model.sections.ui.map { section in
            AnySection {
                
                SpacerCell()
                LabelCell(TitleAdapter(label: section.title))
                
                section.subTitle.ui.map {
                    SpacerCell()
                    LineCell()
                    LabelCell(SubtitleAdapter(label: $0))
                }
                SpacerCell()
                section.colors.ui.map {
                    ContentCell(ContentAdapter(color: $0))
                        .onDidSelect { print($0.adapter.color) }
                }
                SpacerCell(16)
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.ui.dataSource = dataSource
    }
}

