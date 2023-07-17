//
//  ContentView.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 17/07/2023.
//

import SwiftUI

struct CardView: View {
    var product: Product
    var cart: Cart
    @State private var quantity = 0
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
                    quantity += 1
                    let cartProduct = CartProduct(product: product, productQuantity: quantity)
//                    cart.addItem(cartProduct: cartProduct)
                }) {
                    Text("Add to cart")
                }
                .buttonStyle(TealButtonStyle())
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
        CardView(product: Product.sampleData[0], cart: Cart.sampleData[0])
    }
}
