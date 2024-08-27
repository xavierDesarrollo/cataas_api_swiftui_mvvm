//
//  CataasExampleTests.swift
//  CataasExampleTests
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import XCTest
import Combine
@testable import CataasExample

final class CataasExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
        
    func test_getting_breeds_success() {
        let result = Result<[Breed], ServiceError>.success([Breed.example1()])
        
        let fetcher = BreedViewModel(service: Service())
        
        let promise = expectation(description: "getting breeds")
        
        fetcher.$breeds.sink { breeds in
            if breeds.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
       
        wait(for: [promise], timeout: 2)
    }
}
