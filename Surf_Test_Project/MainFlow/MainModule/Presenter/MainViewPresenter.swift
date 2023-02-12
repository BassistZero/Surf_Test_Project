final class MainViewPresenter: MainViewOutput {

    // MARK: - Properties

    weak var view: MainViewInput?
    var router: MainRouterInput?

    // MARK: - MainViewOutput

    func showMessage() {
        router?.showMessage(with: "Поздравляем!", and: "Ваша заявка успешно отправлена!")
    }

}
