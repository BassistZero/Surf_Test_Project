import UIKit

final class TeamsCollectionViewCell: UICollectionViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var teamLabel: UILabel!

    // MARK: - Properties

    var teamName: String? {
        didSet {
            teamLabel.text = teamName
        }
    }

    override var isHighlighted: Bool {
        didSet {
            cellLongTapped()
        }
    }

    override var isSelected: Bool {
        didSet {
            cellSelected()
        }
    }

    // MARK: - UICollectionViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Private Methods

    private func configureAppearance() {
        contentView.layer.cornerRadius = 12
        contentView.backgroundColor = .collectionViewBackgroundUnselected()

        teamLabel.textAlignment = .center
        teamLabel.font = .smallMedium()
        teamLabel.textColor = .collectionViewTextUnselected()
    }

    private func configureSelectedAppearance() {
        contentView.backgroundColor = .collectionViewBackgroundSelected()

        teamLabel.textColor = .collectionViewTextSelected()
    }

    private func cellLongTapped() {
        UIView.animate(withDuration: 0.2) {
            self.contentView.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.90, y: 0.90) : .identity
        }
    }

    private func cellSelected() {
        isSelected ? configureSelectedAppearance() : configureAppearance()
    }

}
