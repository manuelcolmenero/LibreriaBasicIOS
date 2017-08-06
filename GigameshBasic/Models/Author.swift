//
//  Author.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 6/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import UIKit

// Se crea una representación del modelo


// MARK: - Typealias
typealias Books = Set<Book>

// MARK: - Clases
final class Author {
    let id            : Int
    let firstName     : String
    let lastName      : String
    let alias         : String
    let dateBorn      : Date
    let dateDied      : Date
    let nationality   : String
    let bio           : String
    
    private var _books : Books
    
    
    init(id: Int,
         firstName: String,
         lastName: String,
         alias: String,
         dateBorn: Date,
         dateDied: Date,
         nacionality: String,
         bio: String) {
        self.id          = id
        self.firstName   = firstName
        self.lastName    = lastName
        self.alias       = alias
        self.dateBorn    = dateBorn
        self.dateDied    = dateDied
        self.nationality = nacionality
        self.bio         = bio
        
        _books = Books()
    }
    
}

// MARK: - Extensión
// MARK: - Proxy
extension Author {
    // Variable para igualdad de objetos
    var proxyForEquality: String {
        get {
            return "\(self.firstName) \(self.lastName)"
        }
    }
    
    
    // Variable para ordenar objetos
    var proxyForComparison: String {
        get {
            return "\(self.firstName.uppercased()) \(self.lastName.uppercased())"
        }
    }
}

// MARK:- Hashable
extension Author: Hashable {
    var hashValue: Int {
        get {
            return proxyForEquality.hashValue
        }
    }
}

// MARK: - Equatable
extension Author: Equatable {
    static func ==(lhs: Author, rhs: Author) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Comparable
extension Author: Comparable {
    static func <(lhs: Author, rhs: Author) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

// MARK: - Extensión fullName
extension Author{
    var fullName : String{
        get{
            return  "\(firstName) \(lastName)"
        }
    }
    
    var fullNameWithAlias : String{
        get{
            return  "\(firstName) \(lastName) - \"\(alias)\""
        }
    }
}

// MARK: - Extensión para Books
extension Author{
    
    // Extension de propiedad
    var count : Int{
        return _books.count
    }
    
    // Extension de método
    func add(book: Book) {
        
        guard book.authors.fullName == fullName else {
            return
        }
        
        _books.insert(book)
    }
    
    // Sobrecarga de funciones. Se crea la misma función con distintos parámetros
    
    // Los '...' quiere decir que puede recibir varios parámetros separados por comas.
    func add(books: Book...){
        for book in books{
            add(book: book)
        }
    }
    
    // Sorted [Book]
    // Se crea un metodo que devuelve un array de Book
    func sortedBooks() -> [Book]{
        return _books.sorted()
    }
}

