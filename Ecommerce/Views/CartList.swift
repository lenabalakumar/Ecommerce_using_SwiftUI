//
//  CartList.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 28/07/2023.
//

import SwiftUI

struct CartList: View {
    let cartManager: CartManager
    var body: some View {
        List {
            ForEach(cartManager.cart.products) { product in
                CartCard(cartManager: cartManager,product: product)
            }
            .onDelete(perform: cartManager.removeItem)
        }
        .listStyle(.plain)
    }
}

struct CartList_Previews: PreviewProvider {
    static var previews: some View {
        CartList(cartManager: CartManager(cart: Cart(products: [CartProduct.orangeCartProduct, CartProduct.bananaCartPRoduct, CartProduct.appleCartProduct], total: 0.0)))
    }
}
