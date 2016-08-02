//
//  TableViewController.swift
//  BooksAndDisksSwift
//
//  Created by Polynin Pavel on 30.07.16.
//  Copyright © 2016 Polynin Pavel. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let product: [Products] = [
        Products(name: "100 dishes for dinner", price: 234, barcode: "2345645234", typeProduct: .Book, category: .Cooking, numberOfPages: 120, programmingLanguage: nil, mainIngredient: "Chiken", minAgeReader: nil, typeDisk: nil),
        Products(name: "Objective-C it is Cool", price: 1200, barcode: "2345667234", typeProduct: .Book, category: .Programming, numberOfPages: 678, programmingLanguage: "Obj-C", mainIngredient: nil, minAgeReader: nil, typeDisk: nil),
        Products(name: "Best sing 2015", price: 130, barcode: "2345634234", typeProduct: .Disk, category: .Music, numberOfPages: nil, programmingLanguage: nil, mainIngredient: nil, minAgeReader: nil, typeDisk: .CD),
        Products(name: "The spiritual path", price: 102, barcode: "2345634290", typeProduct: .Book, category: .Esoterics, numberOfPages: 56, programmingLanguage: nil, mainIngredient: nil, minAgeReader: 25, typeDisk: nil),
        Products(name: "Titanik", price: 234, barcode: "2345678290", typeProduct: .Disk, category: .Video, numberOfPages: nil, programmingLanguage: nil, mainIngredient: nil, minAgeReader: nil, typeDisk: .DVD),
        Products(name: "Photoshop", price: 1600, barcode: "2565678290", typeProduct: .Disk, category: .Soft, numberOfPages: nil, programmingLanguage: nil, mainIngredient: nil, minAgeReader: nil, typeDisk: .DVD),
        Products(name: "Swift 3.0", price: 456, barcode: "25667678290", typeProduct: .Book, category: .Programming, numberOfPages: 340, programmingLanguage: "Swift", mainIngredient: nil, minAgeReader: nil, typeDisk: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Метод для разделения массива по типу товара
    func arrayLoop(typeProduct: String) -> [Products] {
        var arrayLoop = [Products]()
        for index in product {
            if index.typeProduct.rawValue == typeProduct {
                arrayLoop.append(index)
            }
        }
        return arrayLoop
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    // Определение имен категорий
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Books"
        } else {
            return "Disks"
        }
    }
    
    // Определение числа ячеек в категории
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrayLoop("Book").count
        } else {
            return arrayLoop("Disk").count
        }
    }
    
    // Распределения товаров по ячейкам  зависимости от категории
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        if indexPath.section == 0 {
            cell.nameProduct.text = arrayLoop("Book")[indexPath.row].name
            cell.typeProduct.text = arrayLoop("Book")[indexPath.row].category.rawValue
        } else {
            cell.nameProduct.text = arrayLoop("Disk")[indexPath.row].name
            cell.typeProduct.text = arrayLoop("Disk")[indexPath.row].category.rawValue
        }
        return cell
    }
    
    // Действия при нажатии на ячейку
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let viewController = storyboard?.instantiateViewControllerWithIdentifier("About") as! ViewController // Инициализация VC для перехода
        tableView.deselectRowAtIndexPath(indexPath, animated: true) // Убирает анимацию залипания при нажатии (выборе ячейки)
        
        if indexPath.section == 0 {
            viewController.product = arrayLoop("Book")[indexPath.row] // Выбор продукта для отображения на втором экране
        } else {
            viewController.product = arrayLoop("Disk")[indexPath.row] // Выбор продукта для отображения на втором экране
        }
        self.navigationController?.pushViewController(viewController, animated: true) // Переход на другой VC
    }
}
