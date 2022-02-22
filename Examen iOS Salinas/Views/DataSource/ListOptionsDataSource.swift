//
//  ListOptionsDataSource.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import UIKit

class ListOptionsDataSource: NSObject{
    var items: [ListItem] = []
}
extension ListOptionsDataSource:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listTable = tableView.dequeueReusableCell(withIdentifier: OptionTableViewCell.reuseIdentifier, for: indexPath) as! OptionTableViewCell
        listTable.display(item: items[indexPath.item])
        return listTable
    }
    
    
}

