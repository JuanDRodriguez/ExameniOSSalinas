//
//  ListItem.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import Foundation

struct ListItem: Decodable{
    var title: String?
    var type: String?
    var value: String?
    var didSelected: Bool? 
}
