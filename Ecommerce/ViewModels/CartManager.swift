//
//  CartManager.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 18/07/2023.
//

import Foundation

class CartManager: ObservableObject {
    @Published var cart: Cart
    
    init(cart: Cart) {
        self.cart = cart
    }
    
    func addItem(cartItem: Product) {
        
        let itemToAdd = CartProduct(product: cartItem, productQuantity: 1)
        
        if (cart.products.count < 1) {
            cart.products.append(itemToAdd)
            calculateTotal(cart: cart)
        } else {
            var itemIndex = -1
            for (index, product) in cart.products.enumerated() {
                if(product.product.id == itemToAdd.product.id) {
                    itemIndex = index
                }
            }
            
            if (itemIndex != -1) {
                if(cart.products[itemIndex].productQuantity < 5) {
                    cart.products[itemIndex].productQuantity += 1
                    calculateTotal(cart: cart)
                }
            } else {
                cart.products.append(itemToAdd)
                calculateTotal(cart: cart)
            }
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        cart.products.remove(atOffsets: offsets)
        calculateTotal(cart: cart)
    }
    
    func reduceQuantity(product: Product) {
        var itemIndex = -1
        
        for (index, cartProduct) in cart.products.enumerated() {
            if(cartProduct.product.id == product.id) {
                itemIndex = index
            }
        }
        
        if(cart.products[itemIndex].productQuantity > 1) {
            cart.products[itemIndex].productQuantity -= 1
            calculateTotal(cart: cart)
        } else {
            cart.products.remove(at: itemIndex)
            calculateTotal(cart: cart)
        }
    }
    
    func removeAll() {
        //TODO: Implement remove all items functionality
        cart.total = 0.0
        cart.products = []
    }
    
    func calculateTotal(cart: Cart) {
        self.cart.total =  Float(cart.products.reduce(0) { $0 + $1.productQuantity * Int($1.product.productPrice)})
    }
}


//for (index, product) in cart.products.enumerated() {
//
//    if(product.product.id == cartItem.product.id) {
//        cart.products[index].productQuantity += 1
//    } else {
//        cart.products.append(cartItem)
//    }
//}
