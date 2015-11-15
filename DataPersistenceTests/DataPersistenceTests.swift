//
//  DataPersistenceTests.swift
//  DataPersistence 0.1.0
//
//  Created by Tom Diggle
//  http://tomdiggle.com
//

import Foundation
import XCTest

class DataPersistenceTests: XCTestCase {
    
    let string = "Test String"
    let filename = "test.data"

    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    // MARK: Saving Data Test

    func testSavingAndLoadingData() {
        if let data = self.string.dataUsingEncoding(NSUTF8StringEncoding) {
            let didSave = try! DataPersistence.saveData(data, directory: .DocumentDirectory, filename: self.filename)
            
            XCTAssertTrue(didSave)
        } else {
            XCTFail()
        }
        
        if let data = try! DataPersistence.loadData(.DocumentDirectory, filename: self.filename) as? NSData {
            XCTAssertNotNil(data)
        } else {
            XCTFail()
        }
    }
    
    // MARK: Empty Filename Test
    
    func testSaveWithEmptyFilename() {
        if let data = self.string.dataUsingEncoding(NSUTF8StringEncoding) {
            let didSave = try! DataPersistence.saveData(data, directory: .DocumentDirectory, filename: "")
            
            XCTAssertFalse(didSave)
        } else {
            XCTFail()
        }
    }
    
    func testLoadWithEmptyFilename() {
        XCTAssertNil(try! DataPersistence.loadData(.DocumentDirectory, filename: ""))
    }
    
}
