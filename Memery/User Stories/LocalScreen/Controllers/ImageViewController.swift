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
        
        if let tag = textField.text, !tag.isEmpty {
            
            LocalDataManager.shared.addTag(to: image, tag: tag)
            tagListView.addTag(tag)
            tableView.reloadData()
            textField.text?.removeAll()
        }
    }
    
    //MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageTags = image.tag?.allObjects as! [Tag]
        for tag in imageTags { print(tag.text!) }
        
        setupUI()
        setup(for: image)
    }
    
    //MARK: - Setups
    
    func setup(for image: Image) {
        
        guard let imageData = image.imageData else { return }
        imageView.image = UIImage(data: imageData)
        
        guard let tagsArray = image.tag?.allObjects as? [Tag] else { return }
        let stringTags: [String] = tagsArray.map { $0.text! }
        tagListView.addTags(stringTags)
    }
    
    func setupUI() {
        
        //Например закруглить текстфилд или увеличить шрифт тегов. Посмотрим
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tagListView.textFont = UIFont.systemFont(ofSize: 20)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
