import UIKit

extension UIColor {

    static func title() -> UIColor {
        return UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1.00)
    }

    static func description() -> UIColor {
        return UIColor(red: 0.59, green: 0.58, blue: 0.61, alpha: 1.00)
    }

    static func descriptionBackground() -> UIColor {
        return .white
    }

    static func buttonBackgroundUnselected() -> UIColor {
        return .black
    }

    static func buttonForegroundUnselected() -> UIColor {
        return .white
    }

    static func collectionViewBackgroundUnselected() -> UIColor {
        return UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)
    }

    static func collectionViewTextUnselected() -> UIColor {
        return UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1.00)
    }

    static func collectionViewBackgroundSelected() -> UIColor {
        return UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1.00)
    }

    static func collectionViewTextSelected() -> UIColor {
        return .white
    }

    static func transparent() -> UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    }

}
