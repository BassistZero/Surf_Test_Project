import UIKit

final class MainModuleConfigurator {

    func configureMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainViewPresenter()
        let router = MainRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.presenter = presenter

        return view
    }

}
