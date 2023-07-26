//
//  CartView.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 18/07/2023.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartManager: CartManager
    var body: some View {
        if(cartManager.cart.products.count < 1) {
            Text("No items in cart")
        } else {
            List {
                ForEach(cartManager.cart.products) {   product in
                    HStack {
                        Text(product.product.productName)
                        Spacer()
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
                .onDelete(perform: cartManager.removeItem)
            }
            .listStyle(.plain)
        }
    }
}



struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CartView(cartManager: CartManager(cart: Cart(products: [CartProduct.appleCartProduct, CartProduct.orangeCartProduct, CartProduct.bananaCartPRoduct], total: 100)))
            CartView(cartManager: CartManager(cart: Cart(products: [], total: 0)))
        }
    }
}
