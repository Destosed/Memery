import UIKit

class AlbumViewController: UIViewController {
    
    //MARK: - Preperties
    
    private let imageCellIdentifier = "AlbumCell"
    var album: Album!
    var images: [Image] = []
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - IBAсtions
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let newImage = LocalDataManager.shared.addImage(to: album, image: UIImage(named: "jojo")!)
        images.append(newImage)
        collectionView.reloadData()
    }

    //MARK: - Lifestyle circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        title = album.name
        images = album.image?.allObjects as! [Image]
    }
}

extension AlbumViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nibCell = UINib(nibName: "ImageCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: imageCellIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album?.image?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellIdentifier, for: indexPath) as! ImageCell
        cell.setup(for: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        layout.minimumInteritemSpacing = 03
        layout.minimumLineSpacing = 03
        layout.invalidateLayout()

        return CGSize(width: ((self.view.frame.width / 3) - 4), height:((self.view.frame.width / 3) - 4));
    }
}
