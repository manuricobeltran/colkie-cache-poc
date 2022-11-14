//
//  ProfileTests.swift
//  ProjectTests
//
//  Created by Jordi Gámez on 31/10/22.
//

import XCTest
import SwiftyMocky
@testable import Project

class ProfileTests: XCTestCase {
    
    // Class
    var profile: Profile!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_model_fan() {
        // Given
        let profile = Profile(id: "1", name: "Juan", type: .fan)
        
        // When
        let isArtist = profile.isArtist
        
        // Then
        XCTAssertEqual(isArtist, false)
    }
    
    func test_model_artist() {
        // Given
        let profile = Profile(id: "1", name: "Aitana", type: .artist)
        
        // When
        let isArtist = profile.isArtist
        
        // Then
        XCTAssertEqual(isArtist, true)
    }
    
    func test_model_admin() {
        // Given
        let profile = Profile(id: "1", name: "Jaime", type: .admin)
        
        // When
        let isArtist = profile.isArtist
        
        // Then
        XCTAssertEqual(isArtist, false)
    }
}

private extension ProfileTests {
    
    func buildClass() {
        profile = Profile.empty()
    }
}
