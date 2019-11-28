import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        initControllers()
        setupTabbar()
        setupMiddleButton()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: SearchViewController.self) {
            return false
        }
        return true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    
    
    //MARK: - Setups
    
    func setupTabbar() {
        tabBar.tintColor = .white
    }
    
    func setupMiddleButton() {

        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))

        middleBtn.setImage(UIImage(named: "searchIcon"), for: .normal)
        middleBtn.backgroundColor = UIColor(named: "middleButtonColor")
        middleBtn.adjustsImageWhenHighlighted = false
        middleBtn.layer.cornerRadius = middleBtn.frame.height / 2
        middleBtn.tintColor = .white
        
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

        self.view.layoutIfNeeded()
    }

    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2
    }
    
    func initControllers() {
        
        let localScreenStoryboard = UIStoryboard(name: "LocalScreen", bundle: nil)
        let localVC = localScreenStoryboard.instantiateInitialViewController() as! LocalViewController
        let localTabbarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "baseline_laptop_mac_white_48pt"), selectedImage: nil)
        localVC.tabBarItem = localTabbarItem
        
        let cloudScreenStoryboard = UIStoryboard(name: "CloudScreen", bundle: nil)
        let cloudVC = cloudScreenStoryboard.instantiateInitialViewController() as! CloudViewController
        let cloudTabbarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "outline_cloud_white_48pt"), selectedImage: nil)
        cloudVC.tabBarItem = cloudTabbarItem
        
        let searchScreenStoryboard = UIStoryboard(name: "SearchScreen", bundle: nil)
        let searchVC = searchScreenStoryboard.instantiateInitialViewController() as! SearchViewController
        let searchTabbarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
        searchVC.tabBarItem = searchTabbarItem
        
        let allScreenStoryboard = UIStoryboard(name: "AllScreen", bundle: nil)
        let allVC = allScreenStoryboard.instantiateInitialViewController() as! AllViewController
        let allTabbarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "outline_grid_on_white_48pt"), selectedImage: nil)
        allVC.tabBarItem = allTabbarItem
        
        let moreScreenStoryboard = UIStoryboard(name: "MoreScreen", bundle: nil)
        let moreVC = moreScreenStoryboard.instantiateInitialViewController() as! MoreViewController
        let moreTabbarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "outline_more_horiz_white_48pt"), selectedImage: nil)
        moreVC.tabBarItem = moreTabbarItem
        
        let viewControllers = [localVC, cloudVC, searchVC, allVC, moreVC]
        
        self.viewControllers = viewControllers
    }
}
