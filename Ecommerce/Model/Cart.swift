//
//  Cart.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 17/07/2023.
//

import Foundation

struct Cart {
    var products: [CartProduct] = []
    var total: Float = 0
    
    init(products: [CartProduct], total: Float) {
        self.products = products
        self.total = total
    }    
}

extension Cart {
    static let sampleData = [Cart(products: [CartProduct.appleCartProduct, CartProduct.orangeCartProduct, CartProduct.bananaCartPRoduct], total: 100)]
}
