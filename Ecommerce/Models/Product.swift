//
//  ProductModel.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 17/07/2023.
//

import Foundation

struct Product: Identifiable {
    var id: UUID
    var productName: String
    var productSKU: String
    var productPrice: Float
    
    init(id: UUID = UUID(), productName: String, productSKU: String, productPrice: Float) {
        self.id = id
        self.productName = productName
        self.productSKU = productSKU
        self.productPrice = productPrice
        
    }
}

extension Product {
    static let sampleData: [Product] = [
        Product(productName: "Sriracha hot sauce", productSKU: "1 bottle", productPrice: 40.0),
        Product(productName: "Hellman's Mayonaisse", productSKU: "1 bottle", productPrice: 55.0),
        Product(productName: "Heinz tomato ketchup", productSKU: "1 bottle", productPrice: 22.5),
        Product(productName: "Corn cob", productSKU: "200 gms", productPrice: 125.5),
    ]
}
