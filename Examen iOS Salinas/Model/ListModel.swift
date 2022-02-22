//
//  ListModel.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import Foundation

class ListModel: ListModelInput{
    var out: ListModelOutput!
    func load() {
        NetworkingServices.shared.getListOptions(){
            (items, success) in
              if success == true {
                  self.out.modelDidload(items ?? [])
              }
        }
    }
    
    
}
