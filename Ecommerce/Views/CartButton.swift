//
//  CartButton.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 28/07/2023.
//

import SwiftUI

struct CartButton: View {
    let cartManager: CartManager
    let product: CartProduct
    var body: some View {
        HStack {
            Button {
                cartManager.reduceQuantity(product: product.product)
            } label: {
                Image(systemName: "minus.circle.fill")
            }
            Text(String(product.productQuantity))
            Button {
                cartManager.addItem(cartItem: product.product)
            } label: {
                Image(systemName: "plus.circle.fill")
            }
        }
        .buttonStyle(.plain)
    }
}


struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(cartManager: CartManager(cart: Cart(products: [], total: 0.0)), product: CartProduct.orangeCartProduct)
    }
}
