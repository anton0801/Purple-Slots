import SwiftUI

@main
struct PurpleSlotsApp: App {
    
    @UIApplicationDelegateAdaptor(PurpleSlotsDelegate.self) var purpleSlotsApp
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
