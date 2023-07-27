//
//  PaymentManager.swift
//  Ecommerce
//
//  Created by Lenabalakumar Subbarayan on 27/07/2023.
//

import Foundation
import StripePaymentSheet
import SwiftUI

class PaymentManager: ObservableObject {
    let backendUrl = URL(string: "http://localhost:7722/payment-sheet")!
    @Published var paymentSheet: PaymentSheet?
    @Published var paymentResult: PaymentSheetResult?
    @Published var redirectOnSuccess: Bool = false
    
    func preparePaymentSheet(total: Float) {
      // MARK: Fetch the PaymentIntent and Customer information from the backend
        print("Total \(total)")
        let parameters: [String: Any] = [
            "request": [
                    "total" : String(format: "%.0f", total*100),
            ]
        ]
        var request = URLRequest(url: backendUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        request.httpBody = httpBody
        request.timeoutInterval = 20
        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
        guard let data = data,
              let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
              let customerId = json["customer"] as? String,
              let customerEphemeralKeySecret = json["ephemeralKey"] as? String,
              let paymentIntentClientSecret = json["paymentIntent"] as? String,
              let publishableKey = json["publishableKey"] as? String,
              let self = self else {
          // Handle error
          return
        }

        STPAPIClient.shared.publishableKey = publishableKey
        // MARK: Create a PaymentSheet instance
        var configuration = PaymentSheet.Configuration()
        configuration.merchantDisplayName = "Annamalai, Inc."
        configuration.customer = .init(id: customerId, ephemeralKeySecret: customerEphemeralKeySecret)
        // Set `allowsDelayedPaymentMethods` to true if your business can handle payment
        // methods that complete payment after a delay, like SEPA Debit and Sofort.
        configuration.allowsDelayedPaymentMethods = true

        DispatchQueue.main.async {
          self.paymentSheet = PaymentSheet(paymentIntentClientSecret: paymentIntentClientSecret, configuration: configuration)
        }
      })
      task.resume()
    }
    
    func onPaymentCompletion(result: PaymentSheetResult) {
        self.paymentResult = result
        self.redirectOnSuccess = true
    }
}
