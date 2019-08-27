//
//  Cell.swift
//  DataSourceUI
//
//  Created by Guihal Gwenn on 27/08/2019.
//  Copyright © 2019 Oui.sncf. All rights reserved.
//

import Foundation
import UIKit

public protocol Adapter {}

public protocol UICell: UITableViewCell {
    func update(adapter: Adapter)
}

public protocol Cell: class, Content {
    var identifier: String { get }
    func getAdapter() -> Adapter
}

//MARK: OnDidSelect
extension Cell {
    public func onDidSelect(_ closure: @escaping (Self) -> Void) -> Self {
        storage.onDidSelect = closure
        return self
    }
    func execOnDidSelect() {
        storage.onDidSelect?(self)
    }
}

//MARK: Storage
private struct AssociatedKeys {
    static var Storage = "ui_Storage"
}

class CellStorage<T: Cell> {
    var onDidSelect: ((T) -> Void)? = nil
}

extension Cell {
    private var _storage: CellStorage<Self>? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.Storage) as? CellStorage
        }
        set {
            objc_setAssociatedObject( self, &AssociatedKeys.Storage, newValue as CellStorage?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var storage: CellStorage<Self> {
        if _storage == nil {
            _storage = CellStorage()
        }
        return _storage!
    }
}
