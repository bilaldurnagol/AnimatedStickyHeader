//
//  Product.swift
//  AnimatedStickyHeader
//
//  Created by Bilal Durnagöl on 4.04.2023.
//

import SwiftUI

struct Product: Identifiable, Hashable {
    var id: UUID = UUID()
    var type: ProductType
    var title: String
    var subtitle: String
    var price: String
    var productImage: String = ""
}

enum ProductType: String, CaseIterable {
    case iphone = "Iphone"
    case ipad = "Ipad"
    case macbook = "Macbook"
    case desktop = "Desktop"
    case appleWatch = "Apple Watch"
    case airpods = "Airpods"
    
    var tapID: String {
        /// Creating another uniqueid for tab scrolling
        return self.rawValue + self.rawValue.prefix(4)
    }
}

var products: [Product] = [
    
    Product(type: .airpods, title: "Airpods 1", subtitle: " Airpods 1 Description", price: "11.11₺"),
    Product(type: .airpods, title: "Airpods 2", subtitle: " Airpods 2 Description", price: "12.11₺"),
    Product(type: .iphone, title: "Airpods 3", subtitle: " Airpods 3 Description", price: "13.11₺"),
    Product(type: .iphone, title: "Airpods 4", subtitle: " Airpods 4 Description", price: "14.11₺"),
    Product(type: .iphone, title: "Airpods 5", subtitle: " Airpods 5 Description", price: "15.11₺"),
    Product(type: .iphone, title: "Airpods 6", subtitle: " Airpods 6 Description", price: "16.11₺"),
    Product(type: .iphone, title: "Airpods 6", subtitle: " Airpods 7 Description", price: "17.11₺"),
    
    Product(type: .appleWatch, title: "Apple Watch 1", subtitle: " Apple Watch 1 Description", price: "21.11₺"),
    Product(type: .appleWatch, title: "Apple Watch 2", subtitle: " Apple Watch 2 Description", price: "22.11₺"),
    Product(type: .appleWatch, title: "Apple Watch 3", subtitle: " Apple Watch 3 Description", price: "23.11₺"),
    Product(type: .appleWatch, title: "Apple Watch 4", subtitle: " Apple Watch 4 Description", price: "24.11₺"),
    Product(type: .appleWatch, title: "Apple Watch 5", subtitle: " Apple Watch 5 Description", price: "25.11₺"),
    Product(type: .appleWatch, title: "Apple Watch 6", subtitle: " Apple Watch 6 Description", price: "27.11₺"),
    Product(type: .appleWatch, title: "Apple Watch 7", subtitle: " Apple Watch 7 Description", price: "26.11₺"),
    Product(type: .appleWatch, title: "Apple Watch 8", subtitle: " Apple Watch 8 Description", price: "28.11₺"),
    Product(type: .appleWatch, title: "Apple Watch 9", subtitle: " Apple Watch 9 Description", price: "29.11₺"),
    
    Product(type: .desktop, title: "Desktop 1", subtitle: " Desktop 1 Description", price: "59.11₺"),
    
    Product(type: .ipad, title: "Ipad 1", subtitle: " Ipad 1 Description", price: "39.11₺"),
    Product(type: .ipad, title: "Ipad 2", subtitle: " Ipad 2 Description", price: "39.11₺"),
    Product(type: .ipad, title: "Ipad 3", subtitle: " Ipad 3 Description", price: "39.11₺"),
    Product(type: .ipad, title: "Ipad 4", subtitle: " Ipad 4 Description", price: "39.11₺"),
    
    Product(type: .macbook, title: "Macbook 1", subtitle: " Macbook 1 Description", price: "100.11₺"),
    
    Product(type: .iphone, title: "Iphone 1", subtitle: " Iphone 1 Description", price: "100.11₺")
    
]
