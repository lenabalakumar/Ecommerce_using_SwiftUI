//
//  CartProduct.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 26/07/2023.
//

import Foundation

struct CartProduct: Identifiable, Equatable {
    var id: UUID
    var product: Product
    var productQuantity: Int
    
    init(id: UUID = UUID(), product: Product, productQuantity: Int) {
        self.id = id
        self.product = product
        self.productQuantity = productQuantity
    }
    
    static func ==(lhs: CartProduct, rhs: CartProduct) -> Bool {
        return lhs.id == rhs.id && lhs.product == rhs.product && lhs.productQuantity == rhs.productQuantity
    }
}

extension CartProduct {
    static let appleCartProduct = CartProduct(product: Product(productName: "Apple", productSKU: "1 kg", productPrice: 45.50), productQuantity: 2)
    static let orangeCartProduct = CartProduct(product: Product(productName: "Orange", productSKU: "1 kg", productPrice: 55.00), productQuantity: 3)
    static let bananaCartPRoduct = CartProduct(product: Product(productName: "Banana", productSKU: "6 count", productPrice: 20.00), productQuantity: 1)
}
