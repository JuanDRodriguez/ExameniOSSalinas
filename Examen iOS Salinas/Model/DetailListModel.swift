//
//  DetailListModel.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 22/02/22.
//

import Foundation

class DetailListModel: DetailListModelInput{
    
    var out: DetailListModelOutput!
    
    func load(items: [ListItem]) {
        var lists = [DetailListItem]()
        for item in items {
            if item.type! == "multiOption"{
                let elements = item.value!.components(separatedBy: ";")
                var listItems = [ListItem]()
                for element in elements {
                    listItems.append(ListItem.init(title: element, type: item.type, value: element, didSelected: false))
                }
                lists.append(DetailListItem.init(header: item.title!, list: listItems))
            }else{
                lists.append(DetailListItem.init(header: item.title!, list: [item]))
            }
            
        }
        out.modelDidload(lists)
    }
    
}
