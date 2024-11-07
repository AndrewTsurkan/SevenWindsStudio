import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.init(red: 250/255, green: 249/255, blue: 249/255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.init(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)]
        
        let backButtonImage = UIImage(systemName: "chevron.backward")
        appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        
        UINavigationBar.appearance().tintColor = UIColor(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}

