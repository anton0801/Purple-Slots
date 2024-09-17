import Foundation

class UserConfig: ObservableObject {
    
    @Published var cash = UserDefaults.standard.integer(forKey: "cash") {
        didSet {
            UserDefaults.standard.setValue(cash, forKey: "cash")
        }
    }
    
    func addCash(addingValue: Int) {
        cash += addingValue
    }
    
}
