import UIKit

extension UIAlertController {

    static func standardAlert(with title: String, and message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel)
        alertController.addAction(cancelAction)

        return alertController
    }

}
