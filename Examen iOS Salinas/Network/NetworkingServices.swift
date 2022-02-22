//
//  NetworkingServices.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import Foundation
class NetworkingServices{
    static let shared:NetworkingServices = NetworkingServices()
    lazy var networkingCore: NetworkingProtocol = {Network()}()
   
    func getListOptions(completionHanlder:  @escaping([ListItem]?,Bool?)-> Void){
        networkingCore.loadJSONFile(named: "ListOptions", type: [ListItem].self, queue: DispatchQueue.main, simulateLoadDelay: true, delaySeconds: 0.0){
            (list, error) in
            guard error == nil else {
            completionHanlder:do {completionHanlder(nil,false)}
              return
            }
        completionHanlder:do {completionHanlder(list,true)}
        }
    }
}
