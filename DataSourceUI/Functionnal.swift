//
//  Functionnal.swift
//  
//
//  Created by Guihal Gwenn on 13/08/2019.
//

import Foundation
import UIKit

public struct Declarative<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol DeclarativeCompatible {
    associatedtype CompatibleType
    static var ui: Declarative<CompatibleType>.Type { get set }
    var ui: Declarative<CompatibleType> { get set }
}

public extension DeclarativeCompatible {
    static var ui: Declarative<Self>.Type {
        get {
            return Declarative<Self>.self
        }
        set {}
    }
    var ui: Declarative<Self> {
        get {
            return Declarative(self)
        }
        set {}
    }
}

extension Array: DeclarativeCompatible { }
public extension Declarative where Base: Collection {
    func map(@ContentBuilder _ builder: @escaping (Base.Element) -> Content) -> Map<Base> {
        return Map(self.base, builder)
    }
    
    func compactMap(@ContentBuilder _ builder: @escaping (Base.Element) -> Content?) -> CompactMap<Base> {
        return CompactMap(self.base, builder)
    }
    
    func forEach(_ builder: @escaping (Base.Element) -> Void) -> ForEach<Base> {
        return ForEach(self.base, builder)
    }
}

public struct Map<Data: Collection>: Content {
    var data: Data
    var builder: (Data.Element) -> Content
    public init(_ data: Data, @ContentBuilder _ builder: @escaping (Data.Element) -> Content) {
        self.data = data
        self.builder = builder
    }
    
    public var contents: [Content]? {
        return data
            .map { builder($0) }
    }
}

public struct CompactMap<Data: Collection>: Content {
    var data: Data
    var builder: (Data.Element) -> Content?
    public init(_ data: Data, @ContentBuilder _ builder: @escaping (Data.Element) -> Content?) {
        self.data = data
        self.builder = builder
    }
    public var contents: [Content]? {
        return data.compactMap {
            builder($0)
        }
    }
}

public struct IfLet<T: OptionalType>: Content {
    let data: T
    let builder: (T.Wrapped) -> Content

    public init(_ data: T, @ContentBuilder _ builder: @escaping (T.Wrapped) -> Content) {
        self.data = data
        self.builder = builder
    }
    
    public var contents: [Content]? {
        guard let value = data.value else {
            return nil
        }
        return [builder(value)]
    }
}

public struct ForEach<Data: Collection>: Content {
    var data: Data
    var builder: (Data.Element) -> Void
    public init(_ data: Data, _ builder: @escaping (Data.Element) -> Void) {
        self.data = data
        self.builder = builder
    }
    public var contents: [Content]? {
        data.forEach {
            builder($0)
        }
        return nil
    }
}

//MARK: Optional

// Originally from here: https://github.com/artsy/eidolon/blob/24e36a69bbafb4ef6dbe4d98b575ceb4e1d8345f/Kiosk/Observable%2BOperators.swift#L30-L40
// Credit to Artsy and @ashfurrow
public protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalType {
    /// Cast `Optional<Wrapped>` to `Wrapped?`
    public var value: Wrapped? {
        return self
    }
}

extension Optional: DeclarativeCompatible { }
public extension Declarative where Base: OptionalType {
    func map(@ContentBuilder _ builder: @escaping (Base.Wrapped) -> Content) -> IfLet<Base> {
        return IfLet(self.base, builder)
    }
}

//MARK: UITableView

extension UITableView: DeclarativeCompatible { }
public extension Declarative where Base: UITableView {
    var dataSource: DataSource? {
        set {
            self.base.dataSource = newValue
            self.base.delegate = newValue
        }
        get {
            return self.base.dataSource as? DataSource
        }
    }
}


