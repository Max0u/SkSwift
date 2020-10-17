import XCTest

import SkSwiftTests

var tests = [XCTestCaseEntry]()
tests += SkSwiftTests.allTests()
tests += DatasetsTests.allTests()
XCTMain(tests)
