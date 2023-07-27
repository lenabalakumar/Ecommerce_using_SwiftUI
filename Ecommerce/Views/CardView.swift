//
//  ContentView.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 17/07/2023.
//

import SwiftUI

struct CardView: View {
    var product: Product
    @State private var quantity = 0
    @ObservedObject var cartManager: CartManager
    let isItemInCart: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(product.productName)
                    .font(.headline)
                Spacer()
                Text("$ \(String(format: "%.2f", product.productPrice))")
            }
            HStack {
                Text(product.productSKU)
                Spacer()
                Button(action: {
                    cartManager.addItem(cartItem: product)
                }) {
                    isItemInCart == true ? Text("In cart") : Text("Add to cart")
                }
                .buttonStyle(TealButtonStyle())
                .disabled(isItemInCart)
            }
        }
    }
}

struct TealButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 115, height: 45)
            .background(.teal)
            .foregroundColor(.white)
            .cornerRadius(5)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(product: Product.sampleData[0], cartManager: CartManager(cart: Cart(products: [CartProduct.appleCartProduct, CartProduct.bananaCartPRoduct, CartProduct.orangeCartProduct], total: 100)), isItemInCart: false)
            CardView(product: Product.sampleData[0], cartManager: CartManager(cart: Cart(products: [CartProduct.appleCartProduct, CartProduct.bananaCartPRoduct, CartProduct.orangeCartProduct], total: 100)), isItemInCart: true)
        }
    }
}
