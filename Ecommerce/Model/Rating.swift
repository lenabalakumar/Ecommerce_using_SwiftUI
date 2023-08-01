//
//  Rating.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 01/08/2023.
//

import Foundation

struct Rating: CustomStringConvertible, Decodable {
    var rating: Double
    var numberOfRatings: Int
    var description: String {
        return "Rating of \(rating) from \(numberOfRatings) ratings"
    }
    
    init(rating: Double, numberOfRatings: Int) {
        self.rating = rating
        self.numberOfRatings = numberOfRatings
    }
}

extension Rating {
    static let sampleExcellentRatingData: Rating = Rating(rating: 4.5, numberOfRatings: 133)
    static let samplePoorRatingData: Rating = Rating(rating: 2.3, numberOfRatings: 448)
    static let sampleAverageRatingData: Rating = Rating(rating: 3.75, numberOfRatings: 635)
}
