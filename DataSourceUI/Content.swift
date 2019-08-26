import Foundation

public protocol Content {
    var contents: [Content]? { get }
}
public extension Content {
    var contents: [Content]? {
        nil
    }
}
