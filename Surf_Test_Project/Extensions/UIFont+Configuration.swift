import UIKit

// MARK: - Configuration

extension UIFont {

    static func title() -> UIFont {
        return .systemFont(ofSize: 24, weight: .bold)
    }

    static func bigMedium() -> UIFont {
        return .systemFont(ofSize: 16, weight: .medium)
    }

    static func smallMedium() -> UIFont {
        return .systemFont(ofSize: 14, weight: .medium)
    }

    static func smallRegular() -> UIFont {
        return .systemFont(ofSize: 14, weight: .regular)
    }

}
