//
//  Data+JSON.swift
//  ProjectTests
//
//  Created by Jordi Gámez on 31/10/22.
//

import Foundation

extension Data {
    
    init(bundle: Bundle, jsonName: String) {
        let url = bundle.url(forResource: jsonName, withExtension: "json")!
        do {
            try self.init(contentsOf: url)
        } catch {
            self.init()
        }
    }
}
