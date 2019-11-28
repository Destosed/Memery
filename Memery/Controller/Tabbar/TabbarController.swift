import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        setupControllers()
        setupTabbar()
        setupMiddleButton()
    }
    
    //MARK: - TabbarController Delegate
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    //MARK: - Setups
    
    func setupTabbar() {
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white //.init(white: 0.9999, alpha: 0.7)
    }
    
    func setupMiddleButton() {

        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))

        middleBtn.setImage(UIImage(named: "searchIcon"), for: .normal)
        middleBtn.backgroundColor = UIColor(named: "middleButtonColor")
        middleBtn.adjustsImageWhenHighlighted = false
        middleBtn.layer.cornerRadius = middleBtn.frame.height / 2
        middleBtn.tintColor = .white
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

        self.tabBar.addSubview(middleBtn)
        self.view.layoutIfNeeded()
    }

    @objc func menuButtonAction(sender: UIButton) {
        
        let searchScreenStoryboard = UIStoryboard(name: "SearchScreen", bundle: nil)
        let searchVC = searchScreenStoryboard.instantiateInitialViewController() as! SearchViewController
        self.present(searchVC, animated: true, completion: nil)
    }
    
    func setupControllers() {
        
        let localScreenStoryboard = UIStoryboard(name: "LocalScreen", bundle: nil)
        let localVC = localScreenStoryboard.instantiateInitialViewController() as! LocalViewController
        let localIcon = UIImage(named: "localIcon")
        let localIcon2x = UIImage(named: "localIcon2x")
        let localTabbarItem = UITabBarItem(title: "", image: localIcon, selectedImage: localIcon2x)
        localVC.tabBarItem = localTabbarItem
        
        let cloudScreenStoryboard = UIStoryboard(name: "CloudScreen", bundle: nil)
        let cloudVC = cloudScreenStoryboard.instantiateInitialViewController() as! CloudViewController
        let cloudIcon = UIImage(named: "cloudIcon")
        let cloudIcon2x = UIImage(named: "cloudIcon2x")
        let cloudTabbarItem = UITabBarItem(title: "", image: cloudIcon, selectedImage: cloudIcon2x)
        cloudVC.tabBarItem = cloudTabbarItem
        
        let searchVC = SearchViewController()
        let searchTabbarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
        searchVC.tabBarItem = searchTabbarItem
        searchVC.tabBarItem.isEnabled = false
        
        let allScreenStoryboard = UIStoryboard(name: "AllScreen", bundle: nil)
        let allVC = allScreenStoryboard.instantiateInitialViewController() as! AllViewController
        let allIcon = UIImage(named: "gridIcon")
        let allIcon2x = UIImage(named: "gridIcon2x")
        let allTabbarItem = UITabBarItem(title: "", image: allIcon, selectedImage: allIcon2x)
        allVC.tabBarItem = allTabbarItem
        
        let moreScreenStoryboard = UIStoryboard(name: "MoreScreen", bundle: nil)
        let moreVC = moreScreenStoryboard.instantiateInitialViewController() as! MoreViewController
        let moreIcon = UIImage(named: "moreIcon")
        let moreIcon2x = UIImage(named: "moreIcon2x")
        let moreTabbarItem = UITabBarItem(title: "", image: moreIcon, selectedImage: moreIcon2x)
        moreVC.tabBarItem = moreTabbarItem
        
        let viewControllers = [localVC, cloudVC, searchVC, allVC, moreVC]
        
        self.viewControllers = viewControllers
    }
}
