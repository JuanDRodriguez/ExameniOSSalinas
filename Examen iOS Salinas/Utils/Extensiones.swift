//
//  Extensiones.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import Foundation
import UIKit
extension UIViewController {
    func showAlert(_  message: String) {
            let alertController = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Aceptar", style: .default, handler: {(action) in
                
            })
            alertController.addAction(actionOk)
            self.present( alertController, animated: true, completion: nil)
        }
}
extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}
extension UIImageView{
    func load(urlString: String) {
        let url = URL(string:  urlString)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
