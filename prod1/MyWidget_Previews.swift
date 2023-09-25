import SwiftUI
import WidgetKit

struct MyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MyWidgetView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
