import UIKit

class LocalViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    
    var albums: [Album] = []

    //MARK: - IBActions
    
    @IBAction func addAlbumButtonPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Alert", bundle: nil)
        let addLocalAlbumAlertVC = storyboard.instantiateViewController(identifier: "AddLocalAlbumAlertVC") as! AddLocalAlbumAlertVC
        addLocalAlbumAlertVC.ownerVC = self
        
        present(addLocalAlbumAlertVC, animated: true, completion: nil)
    }
    
    //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .secondarySystemGroupedBackground
        setupCollectionView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()
    }
    
    //MARK: - DataWorkers
    
    func fetchData() {
        
        self.albums = LocalDataManager.shared.getAllAlbums()
        collectionView.reloadData()
    }
    
    //MARK: - Segue stack
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let albumVC = segue.destination as? AlbumViewController else { return }
        albumVC.album = sender as? Album
    }
}

//MARK: - CoolectionView stack

extension LocalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.view.backgroundColor = .systemGroupedBackground
        
        let nibCell = UINib(nibName: "AlbumCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "albumCell")
        
        collectionView.alwaysBounceVertical = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! AlbumCell
        cell.setup(for: albums[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        layout.minimumInteritemSpacing = 03
        layout.minimumLineSpacing = 03
        layout.invalidateLayout()

        return CGSize(width: ((self.view.frame.width / 2 ) - 5), height:((self.view.frame.width / 2) + 25));
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "openAlbumSegue", sender: albums[indexPath.row])
    }
}
