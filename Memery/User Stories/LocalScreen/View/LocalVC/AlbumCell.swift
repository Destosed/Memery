import UIKit

class AlbumCell: UICollectionViewCell {
    
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var amountOfImages: UILabel!
    
    func setup(for album: Album) {
    
        albumImageView.layer.cornerRadius = albumImageView.frame.height / 18
        
        albumNameLabel.text = album.name
        albumImageView.image = album.coverImage
        amountOfImages.text = String(album.image?.allObjects.count ?? 0)
        
        layoutIfNeeded()
    }
}
