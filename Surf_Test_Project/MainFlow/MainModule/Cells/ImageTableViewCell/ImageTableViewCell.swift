import UIKit

class ImageTableViewCell: UITableViewCell {

    // MARK: - Private Views

    @IBOutlet private weak var backgroundImageView: UIImageView!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Private Methods

    private func configureAppearance() {
        backgroundImageView.image = UIImage(named: "backgroundImage")
        backgroundImageView.contentMode = .scaleAspectFill
    }

}
