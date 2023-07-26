//
//  ListView.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 17/07/2023.
//

import SwiftUI

struct ListView: View {
    let products: [Product]
    var cartManager: CartManager
    
    var body: some View {
        NavigationStack() {
            VStack {
                    List(products) { product in
                        CardView(product: product, cartManager: cartManager)
                    }
                }
                .navigationTitle("Products")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        NavigationLink(
                            destination: CartView(cartManager: cartManager)
                                .navigationTitle("Cart")
                                .navigationBarTitleDisplayMode(.inline)
                            
                        ){
                            Label("Cart", systemImage: "cart")
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(products: Product.sampleData, cartManager: CartManager(cart: Cart(products: [CartProduct.appleCartProduct, CartProduct.orangeCartProduct], total: 100)))
    }
}
