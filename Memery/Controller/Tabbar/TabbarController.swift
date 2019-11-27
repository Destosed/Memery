import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        initControllers()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
       
        if let _ = viewController as? SearchViewController {
            let searchVC = SearchViewController()
            print("Controller presented")
            self.present(searchVC, animated: true, completion: nil)
            searchVC.modalPresentationStyle = .overFullScreen
            return false
        }
//        if viewController.isKind(of: SearchViewController.self) {
//            let searchVC = SearchViewController()
//            self.present(searchVC, animated: true, completion: nil)
//            return false
//        }
        return true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        print(item.title)
//        if let items = self.tabBar.items, let selectedIndex = items.firstIndex(of: item), priviousSelectedIndex != selectedIndex, let customTabBar = tabBar as? JBTabBar {
//
//        }
    }
    
    
    
    //MARK: - Init Controllers
    
    func initControllers() {
        
        //TODO: Set selected image
        
        let localScreenStoryboard = UIStoryboard(name: "LocalScreen", bundle: nil)
        let localVC = localScreenStoryboard.instantiateInitialViewController() as! LocalViewController
        let localTabbarItem = UITabBarItem(title: "Local", image: #imageLiteral(resourceName: "localIcon"), selectedImage: nil)
        localVC.tabBarItem = localTabbarItem
        
        let cloudScreenStoryboard = UIStoryboard(name: "CloudScreen", bundle: nil)
        let cloudVC = cloudScreenStoryboard.instantiateInitialViewController() as! CloudViewController
        let cloudTabbarItem = UITabBarItem(title: "Cloud", image: #imageLiteral(resourceName: "cloudIcon"), selectedImage: nil)
        cloudVC.tabBarItem = cloudTabbarItem
        
        let searchScreenStoryboard = UIStoryboard(name: "SearchScreen", bundle: nil)
        let searchVC = searchScreenStoryboard.instantiateInitialViewController() as! SearchViewController
        let searchTabbarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "baseline_search_black_48pt"), selectedImage: nil)
        searchVC.tabBarItem = searchTabbarItem
        
        let allScreenStoryboard = UIStoryboard(name: "AllScreen", bundle: nil)
        let allVC = allScreenStoryboard.instantiateInitialViewController() as! AllViewController
        let allTabbarItem = UITabBarItem(title: "All", image: #imageLiteral(resourceName: "gridIcon"), selectedImage: nil)
        allVC.tabBarItem = allTabbarItem
        
        let moreScreenStoryboard = UIStoryboard(name: "MoreScreen", bundle: nil)
        let moreVC = moreScreenStoryboard.instantiateInitialViewController() as! MoreViewController
        let moreTabbarItem = UITabBarItem(title: "More", image: #imageLiteral(resourceName: "moreIcon"), selectedImage: nil)
        moreVC.tabBarItem = moreTabbarItem
        
        let viewControllers = [localVC, cloudVC, searchVC, allVC, moreVC]
        
        self.viewControllers = viewControllers
        
        //self.viewControllers = viewControllers.map { UINavigationController(rootViewController: $0)}
    }
}
