import UIKit
import TagListView

class TagsPartCell: UITableViewCell, TagListViewDelegate {
    
    var myImage: Image!
    var owner: UIViewController!

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tagListView: TagListView!
    
    @IBAction func addTagButtonPressed(_ sender: Any) {
        
        guard let tag = textField.text, !tag.isEmpty else { return }
        let isImageContainsTag = LocalDataManager.shared.isImageContainsTag(image: myImage, tagTitle: tag)
        
        if isImageContainsTag {
            AlertService.showInfoAlert(on: owner, title: "Error", message: "Tag allready exist in this image")
            return
        } else {
            LocalDataManager.shared.addTag(to: myImage, tag: tag)
            tagListView.addTag(tag)
        }
    }
    
    func setup(for image: Image) {
        
        tagListView.delegate = self
        
        myImage = image
        
        if let tags = image.tag?.allObjects as? [Tag] {
            
            let tagsString = tags.map( { $0.text! } )
            tagListView.addTags(tagsString)
        }
        
        for tag in myImage.tag?.allObjects as! [Tag] { print(tag.text!)}
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        
        
        LocalDataManager.shared.deleteTag(from: myImage, tagTitle: title)
        sender.removeTag(title)
    }
}
