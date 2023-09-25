//
//  SuperCharge.swift
//  prod1Extension
//
//  Created by Pixcile on 9/23/23.
//


import Foundation
import AppIntents
import WidgetKit

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
struct HttpCommand: AppIntent {
    
    static var title: LocalizedStringResource = "Simple-Command"
    static var description = IntentDescription("Http-Get Command")
    
    func perform() async throws -> some IntentResult {
        print("Hello World")
        performHTTPGet(for: "https://dummyjson.com/users")
        //EmojiRanger.superchargeHeros()
        return .result()
    }
    
    private func performHTTPGet(for url: String) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("HTTP GET Response: \(responseString)")
                    
                    // Handle the HTTP GET response as needed
                }
            }
        }.resume()
    }
}
