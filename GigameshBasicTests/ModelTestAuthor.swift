//
//  ModelTestAuthor.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 6/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import GigameshBasic

class ModelTestAuthor: XCTestCase {
    
    // Variables para los test
    var authorGRRMartin        : Author!
    var authorRichardBMatheson : Author!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        authorGRRMartin = Repository.local.author(named: "George")
        authorRichardBMatheson = Repository.local.author(named: "Richard")
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Test Básicos
    func testAuthorExistence() {
        // test para verificar que "Author" existe y se puede usar
        XCTAssertNotNil(authorGRRMartin)
    }
    
    // MARK: - Test Propiedades
    func testEquality() {
        // Identidad
        XCTAssertEqual(authorGRRMartin, authorGRRMartin)
        
        // Igualdad
        let jinxed = authorGRRMartin
        
        XCTAssertEqual(jinxed, authorGRRMartin)
        
        // Desigualdad
        XCTAssertNotEqual(authorGRRMartin, authorRichardBMatheson)
        
    }
    
    func testHashable() {
        // hashValue se utiliza para representar ese objeto en un árbol binario
        // y poder meterlo dentro de un "Set"
        XCTAssertNotNil(authorGRRMartin.hashValue)
    }
    
    func testHouseComparison() {
        // Se comprueba si un objeto es mayor que otro
        XCTAssertLessThan(authorGRRMartin,authorRichardBMatheson)
    }
    
    // MARK: - Test Funcionales
}
