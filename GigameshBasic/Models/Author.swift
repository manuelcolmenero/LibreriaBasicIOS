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


// MARK: - Clases
final class Author {
    let id            : Int
    let firstName     : String
    let lastName      : String
    let alias         : String
    let dateBorn      : Date
    let dateDied      : Date
    let nationality   : String
    let photo         : Photo
    let bio           : String

    init(id: Int,
         firstName   : String,
         lastName    : String,
         alias       : String,
         dateBorn    : Date,
         dateDied    : Date,
         nacionality : String,
         photo       : Photo,
         bio         : String) {
        self.id          = id
        self.firstName   = firstName
        self.lastName    = lastName
        self.alias       = alias
        self.dateBorn    = dateBorn
        self.dateDied    = dateDied
        self.nationality = nacionality
        self.photo       = photo
        self.bio         = bio

    }
    
}

final class Photo{
    let description : String
    let image       : UIImage
    
    init(image : UIImage, description : String) {
        (self.image, self.description) = (image, description)
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
