import UIKit

final class TeamTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var teamCollectionView: UICollectionView!
    @IBOutlet private weak var chooseConstraint: NSLayoutConstraint!
    
    // MARK: - Private Properties

    private var teams = ["IOS", "Android", "Design", "QA", "Flutter", "PM"]

    // MARK: - Properties

    var type: ViewType? {
        didSet {
            switch type {
            case .example:
                configureExampleAppearance()
            case .choose:
                configureChooseAppearance()
            default:
                break
            }
        }
    }

    // MARK: - ViewType

    enum ViewType {
        case example
        case choose
    }
    
}

// MARK: - Configuration

private extension TeamTableViewCell {

    func configureGeneralAppearance() {
        selectionStyle = .none

        teamCollectionView.dataSource = self
        teamCollectionView.delegate = self

        teamCollectionView.register(UINib(nibName: "\(TeamsCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(TeamsCollectionViewCell.self)")

        teamCollectionView.showsHorizontalScrollIndicator = false
        teamCollectionView.showsVerticalScrollIndicator = false

        (teamCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }

    func configureExampleAppearance() {
        configureGeneralAppearance()
        (teamCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        teamCollectionView.allowsSelection = false
    }

    func configureChooseAppearance() {
        configureGeneralAppearance()
        chooseConstraint.priority = .required
        teamCollectionView.allowsMultipleSelection = true
    }

}

// MARK: - UICollectionViewDataSource

extension TeamTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        teams.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TeamsCollectionViewCell.self)", for: indexPath)
        guard let cell = cell as? TeamsCollectionViewCell else { return UICollectionViewCell() }

        cell.teamName = teams[indexPath.row % teams.count]

        return cell
    }

}

// MARK: - UICollectionViewDelegate

extension TeamTableViewCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.moveItem(at: indexPath, to: .init(row: 0, section: 0))
        UIImpactFeedbackGenerator.action()
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.moveItem(at: indexPath, to: .init(row: teams.count - 1, section: 0))
        UIImpactFeedbackGenerator.action()
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIImpactFeedbackGenerator.decision()
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension TeamTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 20, bottom: 0, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard case .example = type else { return }
        guard indexPath == IndexPath(row: teams.count - 1, section: 0) else { return }

        teams += teams
        teamCollectionView.reloadData()
    }

}
