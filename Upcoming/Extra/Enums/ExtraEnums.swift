//
//  ExtraEnums.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation

enum ErrorsClientHTTP: Error {
//    case clientHTTPError(response: ResponseError)
    case clientHTTP(description: String)
    case closeSession
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}
