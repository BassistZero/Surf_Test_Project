import UIKit

extension UIImpactFeedbackGenerator {

    static func decision() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        print("Light feedback")
    }

    static func action() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        print("Medium feedback")
    }

}
