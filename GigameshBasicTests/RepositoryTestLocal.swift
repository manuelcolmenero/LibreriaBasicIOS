//
//  RepositoryTestLocal.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 10/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import GigameshBasic

class RepositoryTestLocal: XCTestCase {
    
    var authors = [Author!]()
    var books   = [Book!]()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        authors = Repository.local.authors
        books   = Repository.local.books
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Test Básicos
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryAuthorsCreation() {
        
        XCTAssertNotNil(authors)

        XCTAssertEqual(authors.count, 2)
    }
    
    // MARK: - Test Propiedades
    func testLocalRepositorySorted() {
        
        let authors = Repository.local.authors
        
        // Se comprueba que lo devuelto por houses no es igual a la inversa de houses
        XCTAssertNotEqual(authors, authors.reversed())
        
        // Se verifica que houses y la ordenación de houses coinciden
        XCTAssertEqual(authors, authors.sorted())
    }
    
    func testLocalRepositoryFilter() {
        
        // Se crea una fulción que devuelve un objeto filtrado
        func filterAuthor(author: Author) -> Bool {
            let matherson = Repository.local.author(named: "Richard")
            return author == matherson
        }
        
        var result  = Repository.local.authors(filteredBy: filterAuthor)
        
        // Se verifica que el filtro no ha devuelto vacio
        XCTAssertNotEqual(result, [])
        
        // Se verifica que el filtro devuelto es igual a recuperar el mismo dato directamente
        let authorForComparation      = Repository.local.author(named: "Richard")
        XCTAssertEqual(result.first, authorForComparation)
        
        // Se crea una función que devuelve un objeto que no existe en el repository
        func filterFail(author: Author) -> Bool {
            let failAuthor = Author(id: 2,
                                    firstName: "Juan",
                                    lastName: "Nadie",
                                    alias: "Fail",
                                    dateBorn: Date.getDateFromString("1900-01-01"),
                                    dateDied: Date.getDateFromString("9999-12-31"),
                                    nacionality: "Mundo",
                                    bio: "Bla bla bla")
            return author == failAuthor
        }
        
        // Se verifica que el filtro ha devuelto vacio
        result = Repository.local.authors(filteredBy: filterFail)
        XCTAssertEqual(result, [])
    }
    
    
    // MARK: - Test Funcionales
    
}
