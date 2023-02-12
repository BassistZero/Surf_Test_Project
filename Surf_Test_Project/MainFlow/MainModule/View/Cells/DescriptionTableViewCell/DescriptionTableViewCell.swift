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

// MARK: - UITableViewDataSource

extension DescriptionTableViewCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: return configureTitleCell()
        case 1: return configureLabelCell(text: "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты.")
        case 3: return configureLabelCell(text: "Получай стипендию, выстраивай удобный график, работай на современном железе.")
        default: return UITableViewCell()
        }
    }

}

// MARK: - Configuration

private extension DescriptionTableViewCell {

    func configureAppearance() {
        backgroundColor = .transparent()
        configureTableView()
    }

    func configureTableView() {
        tableView.dataSource = self

        tableView.register(UINib(nibName: "\(LabelTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(LabelTableViewCell.self)")

        tableView.separatorStyle = .none

        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false

        tableView.isScrollEnabled = false

        tableView.backgroundColor = .transparent()
    }

    func configureTitleCell() -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(LabelTableViewCell.self)")
        guard let cell = cell as? LabelTableViewCell else { return UITableViewCell() }

        cell.type = .title
        cell.text = "Стажировка в Surf"

        return cell
    }

    func configureLabelCell(text: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(LabelTableViewCell.self)")
        guard let cell = cell as? LabelTableViewCell else { return UITableViewCell() }

        cell.type = .description
        cell.text = text

        return cell

    }

}
