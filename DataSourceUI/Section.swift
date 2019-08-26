import Foundation

public protocol Section: Content {
    var cells: [Int: Cell] { get }
    init(cells: [Int: Cell])
}

public extension Section {
    var contents: [Content]? {
        return [self]
    }
}

public extension Section {
    
    init(@ContentBuilder _ builder: () -> Content) {
        self.init(contents: [builder()])
    }
    
    init() {
      self.init(contents: [])
    }
    
    init(contents: [Content]) {
        
        var cells = [Int: Cell]()
        var index = 0
        
        Self.invalidate(contents: contents, index: &index, cells: &cells)
        
        self.init(cells: cells)
    }
    
    private static func invalidate(contents: [Content], index: inout Int, cells: inout [Int: Cell]) {
        contents.forEach { content in
            switch (content, content.contents) {
            case (let cell as Cell, nil):
                cells[index] = cell
                index += 1
            case (_, .some(let contents)):
                invalidate(contents: contents, index: &index, cells: &cells)
            default:
                break
            }
        }
    }
}

