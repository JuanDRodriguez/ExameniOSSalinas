//
//  DetailListItem.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 22/02/22.
//

import Foundation
struct DetailListItem: Decodable{
    var header: String?
    var list: [ListItem]?
    init(header: String, list: [ListItem])  {
        self.header = header
        self.list = list
    }
}
