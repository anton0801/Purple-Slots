import SwiftUI

class PurpleSlotsDelegate: NSObject, UIApplicationDelegate {
    
    static var orientation = UIInterfaceOrientationMask.landscape
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return PurpleSlotsDelegate.orientation
    }
    
}
