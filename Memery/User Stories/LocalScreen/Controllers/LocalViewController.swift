import UIKit

class LocalViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    
    var albums: [Album] = []

    //MARK: - IBActions
    
    @IBAction func addAlbumButtonPressed(_ sender: Any) {
        
    }
    
    //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        var als: [Album] = []
        als.append(Album(name: "Test1"))
        als.append(Album(name: "JoJo", image: UIImage(named: "jojo")!))
        als.append(Album(name: "Test3", image: UIImage(named: "papug")!))
        albums = als
        collectionView.reloadData()
    }
}

extension LocalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nibCell = UINib(nibName: "AlbumCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "albumCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! AlbumCell
        cell.setup(for: albums[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width / 2 - 10, height: view.frame.width / 2 - 4)
    }
}
