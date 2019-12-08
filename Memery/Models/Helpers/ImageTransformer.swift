import UIKit

class ImageTransformer: ValueTransformer {
    
    override func transformedValue(_ value: Any?) -> Any? {
        
        guard let image = value as? UIImage else { return nil }
        let data = image.pngData()
        
        return data
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        
        guard let imageData = value as? Data else { return nil }
        
        return UIImage(data: imageData)
    }
}
