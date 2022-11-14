//
//  XCTestCase+Bundle.swift
//  ProjectTests
//
//  Created by Jordi Gámez on 31/10/22.
//

import XCTest

extension XCTestCase {
    
    var testBundle: Bundle {
        Bundle(for: type(of: self))
    }
}
