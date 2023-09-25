import SwiftUI
import WidgetKit
@main
struct MyWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "MyWidget", provider: MyProvider()) { entry in
            MyWidgetView()
        }
        .supportedFamilies([.systemMedium])
    }
}
