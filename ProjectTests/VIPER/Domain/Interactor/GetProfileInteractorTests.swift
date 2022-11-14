//
//  GetProfileInteractorTests.swift
//  ProjectTests
//
//  Created by Jordi Gámez on 31/10/22.
//

import XCTest
import SwiftyMocky
@testable import Project

class GetProfileInteractorTests: XCTestCase {
    
    // Class
    var getProfileInteractor: GetProfileInteractorDefault!
    
    // Mock
    var profileRepository: ProfileRepositoryMock!
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
    }
    
    func test_execute_success() async {
        // Given
        Given(profileRepository, .getProfile(willReturn: ProfileEntity(id: "1", name: "Aitana", type: .artist)))
        
        // When
        let result = await getProfileInteractor.execute()
        
        // Then
        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.name, "Aitana")
    }
}

private extension GetProfileInteractorTests {
    
    func buildMocks() {
        profileRepository = ProfileRepositoryMock()
    }
    
    func buildClass() {
        getProfileInteractor = GetProfileInteractorDefault(profileRepository: profileRepository)
    }
}
