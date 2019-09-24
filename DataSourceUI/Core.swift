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

public struct Container: Content {
    public var contents: [Content]?
    public init(contents: [Content] = []) {
        print("init")
        self.contents = contents
    }
}
extension Container {
    public init(@ContentBuilder _ builder: () -> Content) {
        self.init(contents: builder().contents ?? [])
    }
}









