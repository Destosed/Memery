import UIKit

class TabbarController: UITabBarController {
    
    fileprivate enum TabBarItemType: Int {
        case local = 0
        case cloud = 1
        case all = 2
        case more = 3
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabbar()
        initControllers()
    }
    
    func setupTabbar() {
        
        tabBar.tintColor = .black
    }
    
    func initControllers() {
        
        //TODO: Set selected image
        
        let localScreenStoryboard = UIStoryboard(name: "LocalScreen", bundle: nil)
        let localVC = localScreenStoryboard.instantiateInitialViewController()
        let localTabbarItem = UITabBarItem(title: "Local", image: #imageLiteral(resourceName: "localIcon"), selectedImage: nil)
        localVC?.tabBarItem = localTabbarItem
        
        let cloudScreenStoryboard = UIStoryboard(name: "CloudScreen", bundle: nil)
        let cloudVC = cloudScreenStoryboard.instantiateInitialViewController()
        let cloudTabbarItem = UITabBarItem(title: "Cloud", image: #imageLiteral(resourceName: "cloudIcon"), selectedImage: nil)
        cloudVC?.tabBarItem = cloudTabbarItem
        
        let allScreenStoryboard = UIStoryboard(name: "AllScreen", bundle: nil)
        let allVC = allScreenStoryboard.instantiateInitialViewController()
        let allTabbarItem = UITabBarItem(title: "All", image: #imageLiteral(resourceName: "gridIcon"), selectedImage: nil)
        allVC?.tabBarItem = allTabbarItem
        
        let moreScreenStoryboard = UIStoryboard(name: "MoreScreen", bundle: nil)
        let moreVC = moreScreenStoryboard.instantiateInitialViewController()
        let moreTabbarItem = UITabBarItem(title: "More", image: #imageLiteral(resourceName: "moreIcon"), selectedImage: nil)
        moreVC?.tabBarItem = moreTabbarItem
        
        let viewControllers = [localVC, cloudVC, allVC, moreVC]
        
        self.viewControllers = viewControllers.map { UINavigationController(rootViewController: $0!)}
    }
}
