//
//  ViewController.swift
//  BooksAndDisksSwift
//
//  Created by Polynin Pavel on 30.07.16.
//  Copyright © 2016 Polynin Pavel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var product: Products! = nil
    
    @IBOutlet weak var typeProduct: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var aboutBook: UILabel!
    
    @IBOutlet weak var numberOfPagesOrTypeDisk: UILabel!
    @IBOutlet weak var barcode: UILabel!
    @IBOutlet weak var price: UILabel!
    
    // Метод для определения отображаемых характеристик товара
    func viewProduct() {
        typeProduct.text = product.typeProduct.rawValue
        name.text = "''\(product.name)''"
        category.text = "Category: \(product.category.rawValue)"
        barcode.text = "Barcode: \(product.barcode)"
        price.text = "Price: \(product.price) rub"
        
        if product.category.rawValue == "Programming" {
            aboutBook.text = "Language: \(product.programmingLanguage)"
        } else if product.category.rawValue == "Cooking" {
            aboutBook.text = "Main ingredient is \(product.mainIngredient)"
        } else if product.category.rawValue == "Esoterics" {
            aboutBook.text = "Minimum age of reader: \(product.minAgeReader)"
        }
        
        if product.typeProduct.rawValue == "Book" {
            numberOfPagesOrTypeDisk.text = "Number of pages in the book: \(product.numberOfPages)"
        } else {
            numberOfPagesOrTypeDisk.text = "Type disk: \(product.typeDisk.rawValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewProduct() // Метод для определения отображаемых характеристик товара
    }
}

