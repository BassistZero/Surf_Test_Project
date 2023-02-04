import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        makeWindow(windowScene)
    }

}

// MARK: - Private Methods

private extension SceneDelegate {

    func makeWindow(_ windowScene: UIWindowScene) {
        let viewController = MainViewController()

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }

}
