import SwiftUI
import Foundation

struct ContentView: View {
    @State var linkOne: Bool = false
    @State var linkTwo: Bool = false
    @State var linkThree: Bool = false
    @State var requestStatus = "Unknown";

    var body: some View {
        VStack{
            Text(requestStatus)
        }
        
            .navigationBarTitle("Links")
            .onOpenURL(perform: { (url) in
                if url == URL(string: "game:///link1") {
                    
                    // Perform an HTTP GET request for Link1
                    performHTTPGet(for: "https://dummyjson.com/users")
                } else if url == URL(string: "game:///link2") {
                    // Perform an HTTP GET request for Link2
                    performHTTPGet(for: "https://dummyjson.com/users")
                } else if url == URL(string: "game:///link3") {
                    // Perform an HTTP GET request for Link3
                    performHTTPGet(for: "https://dummyjson.com/users")
                }
            })
        }
    

    // Function to perform HTTP GET requests
    private func performHTTPGet(for url: String) {
        requestStatus = "Fetching from \(url)"
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                requestStatus = "Error: \(error.localizedDescription)";
                print("Error: \(error.localizedDescription)")
                return
            }

            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("HTTP GET Response: \(responseString)")
                    requestStatus = "HTTP GET Response: \(responseString)"
                    // Handle the HTTP GET response as needed
                }
            }
        }.resume()
    }
}

