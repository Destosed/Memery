import UIKit
import TagListView

class ImageViewController: UITableViewController {
    
    //MARK: - Properties
    
    var image: Image!
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tagListView: TagListView!
    
    //MARK: - IBActions
    
    @IBAction func addTagButtonPressed(_ sender: Any) {
        tagListView.addTag(textField.text!)
        tableView.reloadData()
    }
    
    //MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setup(for: image)
    }
    
    //MARK: - Setups
    
    func setup(for image: Image) {
        
        guard let imageData = image.imageData else { return }
        imageView.image = UIImage(data: imageData)
        
        guard let tagsArray = image.tag?.allObjects as? [String] else { return }
        tagListView.addTags(tagsArray)
    }
    
    func setupUI() {
        
        //Например закруглить текстфилд или увеличить шрифт тегов. Посмотрим
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
