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

public extension DataSource {
    convenience init(@ContentBuilder _ builder: () -> Content) {
        self.init()
        self.sections = builder().contents?.compactMap { $0 as? Section } ?? []
    }
}

