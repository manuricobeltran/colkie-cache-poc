//
//  ProfileMapperTests.swift
//  ProjectTests
//
//  Created by Jordi Gámez on 31/10/22.
//

import XCTest
import SwiftyMocky
@testable import Project

class ProfileMapperTests: XCTestCase {
    
    // Class
    var profileMapper: ProfileMapper!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_map_success() {
        // Given
        let entity = ProfileEntity(id: "1", name: "Aitana", type: .artist)
        
        // When
        let result = ProfileMapper.map(entity)
        
        // Then
        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.name, "Aitana")
        XCTAssertEqual(result.type, .artist)
    }
}

private extension ProfileMapperTests {
    
    func buildClass() {
        profileMapper = ProfileMapper()
    }
}
