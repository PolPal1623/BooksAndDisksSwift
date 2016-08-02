//
//  Products.swift
//  BooksAndDisksSwift
//
//  Created by Polynin Pavel on 30.07.16.
//  Copyright © 2016 Polynin Pavel. All rights reserved.
//

import Foundation
import UIKit

// Класс для определения характеристик товара
class Products {
    
    var name: String
    var price: Double
    var barcode: String
    var typeProduct : TypeProducts
    var category: Categories
    var numberOfPages: Int!
    var programmingLanguage: String!
    var mainIngredient: String!
    var minAgeReader: Int!
    var typeDisk: TypeDisks!
    
    enum TypeProducts: String {
        case Book = "Book"
        case Disk = "Disk"
    }
    
    enum Categories: String {
        case Programming = "Programming"
        case Cooking = "Cooking"
        case Esoterics = "Esoterics"
        case Video = "Video"
        case Music = "Music"
        case Soft = "Soft"
    }
    
    enum TypeDisks: String {
        case CD = "CD"
        case DVD = "DVD"
    }
    
    init(name: String, price: Double, barcode: String, typeProduct : TypeProducts, category: Categories, numberOfPages: Int!, programmingLanguage: String!, mainIngredient: String!, minAgeReader: Int!, typeDisk: TypeDisks!) {
        self.name = name
        self.price = price
        self.barcode = barcode
        self.typeProduct = typeProduct
        self.category = category
        self.numberOfPages = numberOfPages
        self.programmingLanguage = programmingLanguage
        self.mainIngredient = mainIngredient
        self.minAgeReader = minAgeReader
        self.typeDisk = typeDisk
    }
}