import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureAppearance()
    }

}

// MARK: - Configuration

private extension MainViewController {

    func configureAppearance() {
        configureTableView()
    }

    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UINib(nibName: "\(ImageTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(ImageTableViewCell.self)")

        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.bounces = false
    }

}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "\(ImageTableViewCell.self)", for: indexPath)

        default:
            return UITableViewCell()
        }
    }

}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {

}
