import UIKit

    // MARK: - Private Outlets

    @IBOutlet private weak var backgroundTableView: UITableView!
    @IBOutlet private weak var foregroundTableView: UITableView!

    // MARK: - UIViewController

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureAppearance()
    }

}

// MARK: - Configuration

private extension MainViewController {

    func configureAppearance() {
        configureTableViews()
    }

    func configureTableViews() {
        configureForegroundTableView()
        configureBackgroundTableView()
    }

    func configureForegroundTableView() {
        foregroundTableView.separatorStyle = .none
        foregroundTableView.showsVerticalScrollIndicator = false
        foregroundTableView.showsHorizontalScrollIndicator = false

        foregroundTableView.bounces = false

        foregroundTableView.contentInset = .init(top: 420, left: 0, bottom: 0, right: 0)
    }

    func configureBackgroundTableView() {
        backgroundTableView.separatorStyle = .none
        backgroundTableView.showsVerticalScrollIndicator = false
        backgroundTableView.showsHorizontalScrollIndicator = false

        backgroundTableView.contentInsetAdjustmentBehavior = .never
    }

}

