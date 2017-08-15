//
//  Book.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 6/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import UIKit

// Se crea una representación del modelo


// MARK: - Typealias
typealias Authors    = Author

// MARK: - Clases
final class Book {
    
    let title           : String
    let originalTitle    : String
    let authors         : Authors
    let format          : String
    let pages           : Int
    let publicationDate : Date
    let collection      : String
    let idiom           : String
    let ISBN10          : String
    let ISBN13          : String
    let cover           : Cover
    let description     : String
    
    
    
    init(title           : String,
         originalTitle   : String,
         authors         : Authors,
         format          : String,
         pages           : Int,
         publicationDate : Date,
         collection      : String,
         idiom           : String,
         ISBN10          : String,
         ISBN13          : String,
         cover           : Cover,
         description     : String) {
        self.title           = title
        self.originalTitle   = originalTitle
        self.authors         = authors
        self.format          = format
        self.pages           = pages
        self.publicationDate = publicationDate
        self.collection      = collection
        self.idiom           = idiom
        self.ISBN10          = ISBN10
        self.ISBN13          = ISBN13
        self.cover           = cover
        self.description     = description
    }
}

final class Cover{
    let description : String
    let image       : UIImage
    
    init(image : UIImage, description : String) {
        (self.image, self.description) = (image, description)
    }
    
}

// MARK: - Extensión

// MARK: - Proxy
extension Book {
    
    // Variable para igualdad de objetos
    var proxyForEquality: String {
        get {
            return "\(self.title) \(self.collection)"
        }
    }
    
    
    // Variable para ordenar objetos
    var proxyForComparison: String {
        get {
            return "\(self.title.uppercased()))"
        }
    }
}

// MART_ - Hashable
extension Book: Hashable {
    var hashValue: Int {
        get {
            return proxyForEquality.hashValue
        }
    }
}

// MART_ - Equatable
extension Book: Equatable {
    static func ==(lhs: Book, rhs: Book) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MART_ - Comparable
extension Book: Comparable {
    static func <(lhs: Book, rhs: Book) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
