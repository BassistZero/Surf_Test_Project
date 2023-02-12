import UIKit

final class LabelTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var titleConstraint: NSLayoutConstraint!

    // MARK: - Properties

    var text: String? {
        didSet {
            label.text = text
        }
    }

    var type: TextType? {
        didSet {
            switch type {
            case .title:
                configureTitleAppearance()
            case .description:
                configureDescriptionAppearance()
            default:
                break
            }
        }
    }

    // MARK: - TextType

    enum TextType {
        case title
        case description
    }
    
}

// MARK: - Configuration

private extension LabelTableViewCell {

    func configureGeneralAppearance() {
        selectionStyle = .none
    }

    private func configureTitleAppearance() {
        configureGeneralAppearance()

        titleConstraint.priority = .required

        label.font = .title()
        label.textColor = UIColor.title()



        contentView.backgroundColor = .descriptionBackground()
        contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        contentView.layer.cornerRadius = 32

        contentView.superview?.backgroundColor = .transparent()

    }

    private func configureDescriptionAppearance() {
        configureGeneralAppearance()

        label.font = .smallRegular()
        label.textColor = UIColor.description()
        label.numberOfLines = 0
    }

}
