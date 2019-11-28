import UIKit

class AlbumCell: UICollectionViewCell {
    
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!

    func setup(for album: Album) {
    
        albumImageView.layer.cornerRadius = albumImageView.frame.height / 8
        
        albumNameLabel.text = album.name
        albumImageView.image = album.image
        
        layoutIfNeeded()
    }
}
