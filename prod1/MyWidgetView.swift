import SwiftUI
import Foundation

struct MyWidgetView : View {
    @Environment(\.widgetFamily) var family
    
    @State private var buttonPressed: Bool = false // Track button press
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            Text("Small")
        default:
            HStack {
                Button(
                    intent: HttpCommand()
                    ) {
                    Text("HTTP Cmd")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
                Button(action: {
                    // Perform an HTTP GET request for Button 2
                    performHTTPGet(for: "https://your_api_endpoint/link2")
                    // Set the buttonPressed state to true
                    buttonPressed = true
                }) {
                    Text("Button 2")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .padding()
            // Use an empty view to control button press behavior
            .background(
                EmptyView()
                    .sheet(isPresented: $buttonPressed) {
                        // This empty sheet acts as a placeholder
                        // It will dismiss automatically
                    }
            )
        }
    }

    // Function to perform HTTP GET requests
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
