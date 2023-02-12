import UIKit

extension UIButton {

    func configureApplicationButton(with title: String) {
        self.configuration = applicationButtonConfiguration()
        self.setAttributedTitle(applicationButtonText(title), for: .normal)
    }

}

// MARK: - Private Methods

private extension UIButton {

    func applicationButtonConfiguration() -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.cornerStyle = .capsule
        buttonConfiguration.contentInsets = .init(top: 20, leading: 44, bottom: 20, trailing: 44)

        return buttonConfiguration
    }

    func applicationButtonText(_ text: String) -> NSAttributedString {
        let text = text
        let attributedText = NSAttributedString(string: text)

        return attributedText
    }

}
