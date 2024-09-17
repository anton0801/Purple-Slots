import SwiftUI
import SpriteKit

struct SlotGameById: View {
    
    @Environment(\.presentationMode) var presMode
    @EnvironmentObject var userConfig: UserConfig
    var slotName: String
    
    @State var notCashAlertVisible = false
    @State var infoSlotVisible = false
    
    var body: some View {
        ZStack {
            if slotName == "tiger_focus" {
                SpriteView(scene: TigerFocusScene())
                    .ignoresSafeArea()
            } else if slotName == "egypt_game" {
                SpriteView(scene: EgyptGameScene())
                    .ignoresSafeArea()
            } else if slotName == "monkey_chance" {
                SpriteView(scene: MonkeyChanceScene())
                    .ignoresSafeArea()
            }
            
            if infoSlotVisible {
                SlotInfoView(slotId: slotName)
            }
        }
        .alert(isPresented: $notCashAlertVisible) {
            Alert(title: Text("Not cash!"),
                  message: Text("You don't have enought cash for spin!"), dismissButton: .cancel(Text("Got it!")))
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("home_action"))) { _ in
            userConfig.cash = UserDefaults.standard.integer(forKey: "cash")
            presMode.wrappedValue.dismiss()
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("info_slot"))) { _ in
            withAnimation(.linear) {
                infoSlotVisible = true
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("close_info"))) { _ in
            withAnimation(.linear) {
                infoSlotVisible = false
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("not_cash"))) { _ in
            notCashAlertVisible = true
        }
    }
}

#Preview {
    SlotGameById(slotName: "egypt_game")
        .environmentObject(UserConfig())
}
