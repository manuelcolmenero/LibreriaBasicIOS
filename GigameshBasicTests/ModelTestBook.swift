//
//  ModelTestBook.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 10/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import GigameshBasic

class ModelTestBook: XCTestCase {
    
    // Variables para los test
    var authorGRRMartin        : Author!
    var authorRichardBMatheson : Author!
    
    var caballero7ReinosCover      : Cover!
    var caballero7ReinosBook       : Book!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        authorGRRMartin = Repository.local.author(named: "George")
        authorRichardBMatheson = Repository.local.author(named: "Richard")
        
        caballero7ReinosBook = Repository.local.book(named: "El caballero de los siete reinos")
        caballero7ReinosCover = caballero7ReinosBook.cover
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Test Básicos
    func testAuthorExistence() {
        // test para verificar que "Author" existe y se puede usar
        XCTAssertNotNil(caballero7ReinosBook)
    }
    
    // MARK: - Test Propiedades
    func testEquality() {
        // Identidad
        XCTAssertEqual(caballero7ReinosBook, caballero7ReinosBook)
        
        // Igualdad
        let jinxed = caballero7ReinosBook
        
        XCTAssertEqual(jinxed, caballero7ReinosBook)
        
        //            // Desigualdad
        //            XCTAssertNotEqual(authorGRRMartin, authorRichardBMatheson)
        
    }
    
    func testHashable() {
        // hashValue se utiliza para representar ese objeto en un árbol binario
        // y poder meterlo dentro de un "Set"
        XCTAssertNotNil(caballero7ReinosBook.hashValue)
    }
    
    func testHouseComparison() {
        //            // Se comprueba si un objeto es mayor que otro
        //            XCTAssertLessThan(caballero7ReinosBook,authorRichardBMatheson)
    }
    
    // MARK: - Test Funcionales
}
