import UIKit

extension UIButton {

    func configureApplicationButton(with title: String) {
        self.configuration = applicationButtonConfiguration()
        self.setAttributedTitle(applicationButtonText(title), for: .normal)

        self.configurationUpdateHandler = { button in
            self.configurePressState(for: button)
        }
    }

}

// MARK: - Private Methods

private extension UIButton {

    func applicationButtonConfiguration() -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.cornerStyle = .capsule
        buttonConfiguration.baseBackgroundColor = .buttonBackgroundUnselected()
        buttonConfiguration.contentInsets = .init(top: 20, leading: 44, bottom: 20, trailing: 44)
        buttonConfiguration.baseForegroundColor = .buttonForegroundUnselected()

        return buttonConfiguration
    }

    func applicationButtonText(_ text: String) -> NSAttributedString {
        let text = text
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.bigMedium()]
        let attributedText = NSAttributedString(string: text, attributes: attributes)

        return attributedText
    }

    func configurePressState(for button: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0.05) {
            button.transform = button.state == .highlighted ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity

            if button.state == .highlighted {
                UIImpactFeedbackGenerator.decision()
            }
        }

    }

}
