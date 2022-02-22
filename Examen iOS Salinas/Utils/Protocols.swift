//
//  Protocols.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import Foundation
import UIKit
//MARK: View
protocol ListViewInput{
    var itemAction: (([ListItem]) -> Void)? {get set}
    var dataSource: ListOptionsDataSource! {get set}
    func display(_ items: [ListItem]?)
}
protocol DetailListViewInput{
   var itemAction: (() -> Void)? {get set}
    var dataSource: DetailListDataSource! {get set}
    func display(_ items: [DetailListItem]?)
    func display(_ image: UIImage)
}
//MARK: Cell
protocol ListTableCell{
    func display(item:  ListItem)
    var itemAction: ((Int, Bool) -> Void)? {get set}
}
//MARK: Model
protocol ListModelInput{
    func load()
}
protocol ListModelOutput{
    func modelDidload(_ items: [ListItem])
}
protocol DetailListModelInput{
    func load(items:[ListItem])
}
protocol DetailListModelOutput{
    func modelDidload(_ items: [DetailListItem])
}
//MARK: Controller
protocol DetailListViewControllerInput {
    func setItems(_ items: [ListItem])
}
//MARK: Network
protocol NetworkingProtocol{
    func loadJSONFile<T: Decodable>(named filename: String,
                                           type: T.Type,
                                           queue: DispatchQueue? ,
                                           simulateLoadDelay: Bool?,
                                           delaySeconds: TimeInterval,
                                           completionHandler: @escaping (T?, NetworkError?) -> Void)
}
