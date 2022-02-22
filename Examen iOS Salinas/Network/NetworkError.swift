//
//  NetworkError.swift
//  Examen iOS Salinas
//
//  Created by Juan Daniel Rodrgiuez Perez on 21/02/22.
//

import Foundation
enum NetworkError: Error {
  case dateParseError
  case invalidPath
  case parseError
  case requestError
}
