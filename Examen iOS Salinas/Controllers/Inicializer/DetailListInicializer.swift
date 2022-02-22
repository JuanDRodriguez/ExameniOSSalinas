//
//  DetailListInicializer.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 22/02/22.
//

import Foundation
class DetailListInicializer: NSObject {
    @IBOutlet weak var viewController: DetailListViewController!
    override func awakeFromNib() {
           super.awakeFromNib()
        let model = DetailListModel()
        viewController.model = model
        model.out = viewController
    }
}
