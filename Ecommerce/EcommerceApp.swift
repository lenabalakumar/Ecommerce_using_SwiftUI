//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 17/07/2023.
//

import SwiftUI

@main
struct EcommerceApp: App {
    @StateObject var cartManager: CartManager = CartManager(cart: Cart(products: [], total: 0))
    var body: some Scene {
        WindowGroup {
            ListView(products: Product.sampleData, cartManager: cartManager)
        }
    }
}
