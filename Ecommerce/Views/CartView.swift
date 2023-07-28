//
//  CartView.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 18/07/2023.
//

import SwiftUI
import StripePaymentSheet

struct CartView: View {
    @ObservedObject var cartManager: CartManager
    @ObservedObject var paymentManager: PaymentManager = PaymentManager()
    var body: some View {
        if(cartManager.cart.products.count < 1) {
            Text("No items in cart")
        } else {
            VStack(alignment: .trailing) {
                CartList(cartManager: cartManager)
                Button{
                    
                } label: {
                    Text("Buy")
                }
                .buttonStyle(FullWidthButtonStyle())
            }
            .onAppear { paymentManager.preparePaymentSheet(total: cartManager.cart.total) }
            .padding()
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        cartManager.removeAll()
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }
}

struct FullWidthButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(4)
    }
}

//if let paymentSheet = paymentManager.paymentSheet {
//    PaymentSheet.PaymentButton(
//      paymentSheet: paymentSheet,
//      onCompletion: paymentManager.onPaymentCompletion
//    ) {
//      Text("Buy")
//    }
//  } else {
//    Text("Loading…")


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CartView(cartManager: CartManager(cart: Cart(products: [CartProduct.appleCartProduct, CartProduct.orangeCartProduct, CartProduct.bananaCartPRoduct], total: 100)))
            CartView(cartManager: CartManager(cart: Cart(products: [], total: 0)))
        }
    }
}


