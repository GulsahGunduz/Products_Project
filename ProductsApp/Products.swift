import Foundation

class Products{
    
    var id: Int?
    var name: String?
    var img: String?
    var price: Int?
    
    init(){
        
    }
    
    init(id: Int, name: String, img: String, price: Int) {
        self.id = id
        self.name = name
        self.img = img
        self.price = price
    }
    
}
