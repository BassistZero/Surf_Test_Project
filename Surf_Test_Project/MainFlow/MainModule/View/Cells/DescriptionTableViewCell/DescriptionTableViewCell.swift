import UIKit

final class DescriptionTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

}

// MARK: - Configuration

private extension DescriptionTableViewCell {

    func configureAppearance() {
        backgroundColor = .transparent()
        configureTableView()
    }

    func configureTableView() {
        tableView.separatorStyle = .none

        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false

        tableView.isScrollEnabled = false

        tableView.backgroundColor = .transparent()
    }
    }

}
