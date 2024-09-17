import SwiftUI

struct SlotInfoView: View {
    
    var slotId: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                VStack {
                    Image("\(slotId)_info_1")
                        .resizable()
                        .frame(width: 500, height: 300)
                    Image("\(slotId)_info_2")
                        .resizable()
                        .frame(width: 500, height: 300)
                    Image("\(slotId)_info_3")
                        .resizable()
                        .frame(width: 500, height: 300)
                    Image("\(slotId)_info_4")
                        .resizable()
                        .frame(width: 500, height: 300)
                }
                
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            NotificationCenter.default.post(name: Notification.Name("close_info"), object: nil)
                        } label: {
                            Image("\(slotId)_close")
                                .resizable()
                                .frame(width: 42, height: 42)
                        }
                    }
                    .padding(.horizontal, 164)
                    .padding(.top)
                    Spacer()
                }
            }
        }
        .ignoresSafeArea()
        .background(
            Image("\(slotId)_info_bg")
                .resizable()
                .frame(minWidth: UIScreen.main.bounds.width,
                       minHeight: UIScreen.main.bounds.height + 30)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    SlotInfoView(slotId: "tiger_focus")
}
