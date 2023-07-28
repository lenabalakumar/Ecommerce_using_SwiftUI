//
//  CartCard.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 28/07/2023.
//

import SwiftUI

struct CartCard: View {
    let cartManager: CartManager
    let product: CartProduct
    var body: some View {
        HStack {
            Text(product.product.productName)
            Spacer()
            CartButton(cartManager: cartManager, product: product)
        }
    }
}

struct CartCard_Previews: PreviewProvider {
    static var previews: some View {
        CartCard(cartManager: CartManager(cart: Cart(products: [], total: 0.0)), product: CartProduct.orangeCartProduct)
    }
}
