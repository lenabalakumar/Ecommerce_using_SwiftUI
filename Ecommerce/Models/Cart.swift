//
//  Cart.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 17/07/2023.
//

import Foundation

struct CartProduct {
    var id: UUID
    var product: Product
    var productQuantity: Int
    
    init(id: UUID = UUID(), product: Product, productQuantity: Int) {
        self.id = id
        self.product = product
        self.productQuantity = productQuantity
    }
}

struct Cart {
    var products: [CartProduct] = []
    var total: Float = 0
    
    init(products: [CartProduct], total: Float) {
        self.products = products
        self.total = total
    }    
}

extension Cart {
    static let sampleData = [Cart(products: [CartProduct(product: Product(productName: "Apple", productSKU: "1 kg", productPrice: 23.5), productQuantity: 1)], total: 100)]
}
