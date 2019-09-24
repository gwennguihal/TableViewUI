import Foundation
import UIKit

public class DataSource: NSObject, UITableViewDataSource {
    
    public var sections = [Section]()
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        return section.cells.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        guard let cell = section.cells[indexPath.item] else {
            fatalError()
        }
        
        guard let uiCell = tableView.dequeueReusableCell(withIdentifier: cell.identifier, for: indexPath) as? UICell else {
            fatalError()
        }
        
        uiCell.update(adapter: cell.getAdapter())
        return uiCell
    }
}
extension DataSource: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = sections[indexPath.section].cells[indexPath.item] else {
            return
        }
        cell.execOnDidSelect()
    }
}

public extension DataSource {
    convenience init(@ContentBuilder _ builder: () -> Content) {
        self.init()
        var sections = [Section]()
        Self.invalidate(contents: builder().contents ?? [], sections: &sections)
        self.sections = sections
    }
    
    private static func invalidate(contents: [Content], sections: inout [Section]) {
        contents.forEach { content in
            switch (content, content.contents) {
            case (let section as Section, _):
                sections.append(section)
            case (_, .some(let contents)):
                invalidate(contents: contents, sections: &sections)
            default:
                break
            }
        }
    }
}

