//
//  ApiParserTests.swift
//  ApiParserTests
//
//  Created by Binshad on 14/11/18.
//  Copyright © 2018 Binshad. All rights reserved.
//

import XCTest
@testable import ApiParser

class ApiParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUser() {
        
        let bundle = Bundle(for: type(of: self))
        guard let filepath = bundle.url(forResource: "user", withExtension: "json") else {
            XCTFail()
            return
        }
        
        do {
            let data = try Data(contentsOf: filepath)
            guard let result = try PayloadParser().payload(from: data, decodingType: User.self) as? User else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(result.id, 1)
            XCTAssertEqual(result.username, "user1")
            XCTAssertEqual(result.email, "user1@test.com")
            XCTAssertEqual(result.isStaff, true)
            XCTAssertEqual(result.token, "6a8ef211f64e5501ad90bdf449f5cece670fcbb9")
        }
        catch {
            XCTFail()
        }
    }
    
    func testFail() {
        
        let bundle = Bundle(for: type(of: self))
        guard let filepath = bundle.url(forResource: "fail", withExtension: "json") else {
            XCTFail()
            return
        }
        
        do {
            let data = try Data(contentsOf: filepath)
            guard let _ = try PayloadParser().payload(from: data, decodingType: User.self) as? User else {
                XCTFail()
                return
            }
        }
        catch {
            XCTAssertEqual((error as? APIError)?.localizedDescription, "Test message")
        }
        
    }
    
    func testUserList() {
        let bundle = Bundle(for: type(of: self))
        guard let filepath = bundle.url(forResource: "userlist", withExtension: "json") else {
            XCTFail()
            return
        }
        
        do {
            let data = try Data(contentsOf: filepath)
            guard let result = try PayloadParser().payload(from: data, decodingType: Array<User>.self) as? Array<User> else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(result[0].id, 1)
            XCTAssertEqual(result[0].username, "user1")
            XCTAssertEqual(result[0].email, "user1@test.com")
            XCTAssertEqual(result[0].isStaff, true)
            XCTAssertEqual(result[0].token, "6a8ef211f64e5501ad90bdf449f5cece670fcbb9")
            
            XCTAssertEqual(result[1].id, 2)
            XCTAssertEqual(result[1].username, "user2")
            XCTAssertEqual(result[1].email, "user2@test.com")
            XCTAssertEqual(result[1].isStaff, true)
            XCTAssertEqual(result[1].token, "6a8ef211f64e5501ad90bdf449f5cece670fcbb9")
            
            XCTAssertEqual(result[2].id, 3)
            XCTAssertEqual(result[2].username, "user3")
            XCTAssertEqual(result[2].email, "user3@test.com")
            XCTAssertEqual(result[2].isStaff, true)
            XCTAssertEqual(result[2].token, "6a8ef211f64e5501ad90bdf449f5cece670fcbb9")
            
            XCTAssertEqual(result[3].id, 4)
            XCTAssertEqual(result[3].username, "user4")
            XCTAssertEqual(result[3].email, "user4@test.com")
            XCTAssertEqual(result[3].isStaff, false)
            XCTAssertEqual(result[3].token, "6a8ef211f64e5501ad90bdf449f5cece670fcbb9")
        }
        catch {
            XCTFail()
        }
    }
}
