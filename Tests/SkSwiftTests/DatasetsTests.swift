//
//  File.swift
//  
//
//  Created by Maxime Blanc on 17/10/2020.
//

import XCTest
@testable import SkSwift

final class DatasetsTests: XCTestCase {
    func testDataHome() {
        let data_home = Datasets.get_data_home()
        XCTAssertEqual(data_home, "~/scikit_learn_data".expandingTildeInPath)
        XCTAssertTrue(FileManager.default.fileExists(atPath: data_home))
    }
    
    func testClearDataHome() {
        Datasets.clear_data_home()
        XCTAssertFalse(FileManager.default.fileExists(atPath: "~/scikit_learn_data".expandingTildeInPath))
    }

    static var allTests = [
        ("testDataHome", testDataHome),
        ("testClearDataHome", testClearDataHome),
    ]
}
