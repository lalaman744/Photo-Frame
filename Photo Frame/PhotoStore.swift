import Foundation
import UIKit

class PhotoStore {
    
    let imageURL: URL = {
        let imageFilename = "hello_camera"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectory.first!
        return documentDirectory.appendingPathComponent(imageFilename)
    }()
    
    func savePhoto(image: UIImage) {
        if let data = image.jpegData(compressionQuality: 1) {
            try? data.write(to: imageURL, options: [.atomic])
        }
    }
    
    func getPhoto() -> UIImage? {
    guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else {
            return nil
        }
        return imageFromDisk
    }
}
