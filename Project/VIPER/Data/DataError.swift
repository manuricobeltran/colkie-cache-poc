//
//  DataError.swift
//  Project
//
//  Created by Manu Rico on 10/11/22.
//

import Foundation

enum DataError: Error {
    
    case network(error: Error)
    case decoding(error: Error)
    case encoding(error: Error)
    case error(error: Error)
    case notFound
    case unknown
    case invalidUrl
    case permissionDenied(message: String?)
}
