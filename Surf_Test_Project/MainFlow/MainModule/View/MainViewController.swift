import UIKit

final class MainViewController: UIViewController, ModuleTransitionable {

    // MARK: - Private Outlets

    @IBOutlet private weak var backgroundTableView: UITableView!
    @IBOutlet private weak var foregroundTableView: UITableView!
    @IBOutlet private weak var sendApplicationButton: UIButton!
    @IBOutlet private weak var applicationLabel: UILabel!

    // MARK: - Properties

    var presenter: MainViewOutput?

    // MARK: - Events

    var didApplicationButtonTapped: (() -> Void)?

    // MARK: - UIViewController

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureAppearance()
    }

}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {

}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureCells(for: indexPath, in: tableView)
    }

}

// MARK: - Configuration

private extension MainViewController {

    func configureAppearance() {
        configureTableViews()
        configureFooterAppearance()
    }

    func configureTableViews() {
        configureForegroundTableView()
        configureBackgroundTableView()
    }

    func configureForegroundTableView() {
        foregroundTableView.dataSource = self

        foregroundTableView.register(UINib(nibName: "\(DescriptionTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DescriptionTableViewCell.self)")

        foregroundTableView.separatorStyle = .none
        foregroundTableView.showsVerticalScrollIndicator = false
        foregroundTableView.showsHorizontalScrollIndicator = false

        foregroundTableView.bounces = false

        foregroundTableView.contentInset = .init(top: 420, left: 0, bottom: 0, right: 0)

        foregroundTableView.backgroundColor = .transparent()
    }

    func configureBackgroundTableView() {
        backgroundTableView.dataSource = self

        backgroundTableView.register(UINib(nibName: "\(ImageTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(ImageTableViewCell.self)")

        backgroundTableView.separatorStyle = .none
        backgroundTableView.showsVerticalScrollIndicator = false
        backgroundTableView.showsHorizontalScrollIndicator = false

        backgroundTableView.contentInsetAdjustmentBehavior = .never

    }

    func configureFooterAppearance() {
        configureApplicationLabel()
        configureApplicationButton()
    }

    func configureApplicationLabel() {
        applicationLabel.text = "Хочешь к нам?"
        applicationLabel.font = .smallRegular()
        applicationLabel.textColor = .description()
    }

    func configureApplicationButton() {
        sendApplicationButton.configureApplicationButton(with: "Отправить заявку")

        sendApplicationButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }

    func configureCells(for indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        if tableView === backgroundTableView {
            switch indexPath.row {
            case 0:
                return tableView.dequeueReusableCell(withIdentifier: "\(ImageTableViewCell.self)", for: indexPath)

            default:
                return UITableViewCell()
            }
        }

        if tableView === foregroundTableView {
            switch indexPath.row {
            case 0:
                return tableView.dequeueReusableCell(withIdentifier: "\(DescriptionTableViewCell.self)", for: indexPath)

            default:
                return UITableViewCell()
            }
        }

        return UITableViewCell()
    }

}

// MARK: - Private methods

private extension MainViewController {

    @objc func showAlert() {
        didApplicationButtonTapped?()
    }

}
