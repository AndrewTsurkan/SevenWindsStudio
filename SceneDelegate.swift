import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScrene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScrene)
//        let rootViewController = RegistrationAssembly.assembleRegistrationModule()
//        let data: [ListEntity] = [.init(id: 1, name: "Площадь героев", point: .init(latitude: "44.7241", longitude: "37.7675")), .init(id: 2, name: "Малая земля", point: .init(latitude: "44.7156", longitude: "37.8089"))]
//        let rootViewController = MapScreenAssembly.assembleMapScreen(cofeData: data)
        let rootViewController = AuthorizationAssembly.assembleAuthorizationModule()

        window.rootViewController = UINavigationController(rootViewController: rootViewController)
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        KeychainManager.shared.deleate(key: "tokenKey")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

