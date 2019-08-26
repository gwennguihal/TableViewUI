import Foundation
import UIKit

@_functionBuilder
public struct ContentBuilder {
    
    public static func buildBlock(_ content: Content) -> Content {
        return Container(contents: [content] )
    }
    
    public static func buildBlock(_ contents: Content?...) -> Content {
        return Container(contents: contents.compactMap { $0 } )
    }
    
    public static func buildIf(_ content: Content?) -> Content? {
        return content
    }
    
    public static func buildEither(first: Content) -> Content {
        return first
    }
    
    public static func buildEither(second: Content) -> Content {
        return second
    }
}

public protocol Adapter {}

public protocol UICell: UITableViewCell {
    func update(adapter: Adapter)
}

public protocol Cell: Content {
    var identifier: String { get }
    func getAdapter() -> Adapter
}

public struct Container: Content {
    public var contents: [Content]?
    init(contents: [Content]) {
        self.contents = contents
    }
    public init(@ContentBuilder _ builder: () -> [Content]) {
        self.init(contents: builder())
    }
}









