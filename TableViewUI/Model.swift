//
//  Model.swift
//  TableViewUI
//
//  Created by Guihal Gwenn on 21/08/2019.
//  Copyright © 2019 Oui.sncf. All rights reserved.
//

import Foundation

class Model {
    struct Item {
        var title: String
        var subTitle: String?
        var colors: [Int]
    }
    
    let blue = Item(title: "Blue",
                               subTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                               colors: [0x31e5f2,
                                        0x3bd4e1,
                                        0x46c3d1,
                                        0x50b1c0,
                                        0x5ba0af,
                                        0x658f9f])
    
    let purple = Item(title: "Purple",
                         subTitle: nil,
                         colors: [0x86548d,
                                  0x904b87,
                                  0x9a4281,
                                  0xa4397b,
                                  0xad3076,
                                  0xb72770,
                                  0xc11e6a,
                                  0xcb1664,
                                  0xd50d5f,
                                  0xdf0459])
    
    let green = Item(title: "Green",
                        subTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        colors: [0x5abd9d,
                                 0x64b491,
                                 0x6eab86,
                                 0x77a37b,
                                 0x819a6f,
                                 0x8b9164,
                                 0x958859,
                                 0x9f7f4d,
                                 0xa87742,
                                 0xb26e37,
                                 0xbc652b,
                                 0xc65c20])
    
    lazy var items: [Item] = [blue, purple, green]
}
