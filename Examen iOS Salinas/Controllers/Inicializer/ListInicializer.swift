//
//  ListInicializer.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import Foundation
class ListInicializer: NSObject {
    @IBOutlet weak var viewController: ListViewController!
    override func awakeFromNib() {
           super.awakeFromNib()
        let model = ListModel()
        viewController.model = model
        model.out = viewController
    }
}
