//
//  Delegates.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 22/02/22.
//

import UIKit
class NumeroDelegate: NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
            let ACCEPTABLE_CHARACTERS = "0123456789"
            let cs = NSCharacterSet(charactersIn: ACCEPTABLE_CHARACTERS).inverted
            let filtered = string.components(separatedBy: cs).joined(separator: "")
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return (string == filtered && newLength < 11)
    }
}
class NameDelegate: NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let ACCEPTABLE_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZÑabcdefghijklmnopqrstuwxyzñ "
            let cs = NSCharacterSet(charactersIn: ACCEPTABLE_CHARACTERS).inverted
            let filtered = string.components(separatedBy: cs).joined(separator: "")
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return (string == filtered && newLength < 36)
    }
}
