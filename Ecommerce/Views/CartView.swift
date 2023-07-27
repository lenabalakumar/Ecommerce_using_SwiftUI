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
            NavigationStack {
                VStack(alignment: .trailing) {
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
    //                Button {
    //
    //                } label: {
    //                    Text("Total: \(cartManager.cart.total, specifier: "%.2f")")
    //                }
    //                .frame(maxWidth: .infinity, maxHeight: 40)
    //                .background(Color.blue)
    //                .foregroundColor(.white)
    //                .cornerRadius(4)
    //                .onAppear { paymentManager.preparePaymentSheet() }
                    if let paymentSheet = paymentManager.paymentSheet {
                        PaymentSheet.PaymentButton(
                          paymentSheet: paymentSheet,
                          onCompletion: paymentManager.onPaymentCompletion
                        ) {
                          Text("Buy")
                        }
                      } else {
                        Text("Loading…")
                      }
                    
                    if let result = paymentManager.paymentResult {
                      switch result {
                      case .completed:
                          NavigationLink("Success") { PaymentSuccess() }
                      case .failed(let error):
                        Text("Payment failed: \(error.localizedDescription)")
                      case .canceled:
                        Text("Payment canceled.")
                      }
                    }
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
}



struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CartView(cartManager: CartManager(cart: Cart(products: [CartProduct.appleCartProduct, CartProduct.orangeCartProduct, CartProduct.bananaCartPRoduct], total: 100)))
            CartView(cartManager: CartManager(cart: Cart(products: [], total: 0)))
        }
    }
}
