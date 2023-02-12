import UIKit

final class MainRouter: MainRouterInput {

    // MARK: - Properties

    weak var view: ModuleTransitionable?

    // MARK: - MainRouterInput

    func showMessage(with title: String, and message: String) {
        let message = UIAlertController.standardAlert(with: title, and: message)
        
        DispatchQueue.main.async {
            self.view?.showModule(message)
        }
    }

}
