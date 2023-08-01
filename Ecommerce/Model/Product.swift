//
//  ProductModel.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 17/07/2023.
//

import Foundation

struct Product: Identifiable, CustomStringConvertible {
    var id: Int
    var productName: String
    var productPrice: Double
    var productDescription: String
    var productCategory: String
    var productImage: URL
    var productRating: Rating
    var description: String {
        return "Product \(productName) is priced at \(productPrice) belongs to \(productCategory) and has a rating of \(productRating.numberOfRatings) from \(productRating.numberOfRatings) ratings"
    }
    
    /*
     {"id":1,
     "title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
     "price":109.95,
     "description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
     "category":"men's clothing",
     "image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
     "rating":
     {
        "rate":3.9,
        "count":120}
     }
     */
    
    enum CodingKeys: String, CodingKey {
        case id
        case productName = "title"
        case productPrice = "price"
        case productDescription = "description"
        case productCategory = "category"
        case productImage = "image"
        case productRating = "rating"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: CodingKeys.id)
        productName = try values.decode(String.self, forKey: .productName)
        productPrice = try values.decode(Double.self, forKey: .productPrice)
        productDescription = try values.decode(String.self, forKey: .productDescription)
        productCategory = try values.decode(String.self, forKey: .productCategory)
        productImage = try values.decode(URL.self, forKey: .productImage)
        productRating = try values.decode(Rating.self, forKey: .productRating)
    }
}
