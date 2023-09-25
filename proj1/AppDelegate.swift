import ObjectiveC
import UIKit
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        // Handle the custom URL scheme here
        if url.scheme == "my-custom-url-scheme" && url.path == "/my-action" {
            // Perform the desired action
        }

        return true
    }
}
