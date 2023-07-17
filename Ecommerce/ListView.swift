//
//  ListView.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 17/07/2023.
//

import SwiftUI

struct ListView: View {
    let products: [Product]
    
    var body: some View {
        NavigationStack{
            List(products) { product in
                CardView(product: product, cart: Cart(products: [CartProduct(product: Product(productName: "Apple", productSKU: "1 kg", productPrice: 50.50), productQuantity: 1)], total: 100))
            }
            .navigationTitle("Products")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(products: Product.sampleData)
    }
}
