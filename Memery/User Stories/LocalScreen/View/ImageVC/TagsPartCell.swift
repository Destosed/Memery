import UIKit
import TagListView

class TagsPartCell: UITableViewCell {
    
    var myImage: Image!

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tagListView: TagListView!
    
    func setup(for image: Image) {
        
        myImage = image
        
        if let tags = image.tag?.allObjects as? [Tag] {
            
            let tagsString = tags.map( { $0.text! } )
            tagListView.addTags(tagsString)
        }
    }
    
    @IBAction func addTagButtonPressed(_ sender: Any) {
        
        guard let tag = textField.text, !tag.isEmpty else { return }
        LocalDataManager.shared.addTag(to: myImage, tag: tag)
        tagListView.addTag(tag)
    }
}
