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

        Section {
            LabelCell(TitleAdapter(label: "Prout"))
        }
        
//        model.items.ui.map { item in
//            Section {
//                
//                Spacer()
//                LabelCell(TitleAdapter(label: item.title))
//                
//                item.subTitle.ui.map {
//                    Spacer()
//                    LineCell()
//                    LabelCell(SubtitleAdapter(label: $0))
//                        .onDidSelect(self.onDidSelect(subtitleCell:))
//                }
//                Spacer()
//                item.colors.ui.map {
//                    ContentCell(ContentAdapter(color: $0))
//                        .onDidSelect { print($0.adapter.color) }
//                }
//                Spacer(16)
//            }
//        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.ui.dataSource = dataSource
    }
}

extension ViewController {
    func onDidSelect(subtitleCell: LabelCell) {
        print(subtitleCell.adapter.label.string)
    }
}

