import SwiftUI

struct ContentView: View {
    
    @State var volume = UserDefaults.standard.bool(forKey: "volume")
    @State var vibro = UserDefaults.standard.bool(forKey: "vibro")
    
    @StateObject var dailyManager = DailyManager()
    @StateObject var userConfig = UserConfig()
    @StateObject var wheelManager = WheelManager()
    
    @State var addBalanceSuccess = false
    @State var addBalanceSuccessAlertShow = false
    
    @State var bonusWin = false
    
    var body: some View {
        NavigationView {
            ZStack {
                HStack {
                    VStack {
                        HStack {
                            NavigationLink(destination: SlotGameById(slotName: "egypt_game")
                                .navigationBarBackButtonHidden()
                                .environmentObject(userConfig)) {
                                Image("egypt_game")
                                    .resizable()
                                    .frame(width: 130, height: 130)
                            }
                            
                            NavigationLink(destination: SlotGameById(slotName: "monkey_chance")
                                .navigationBarBackButtonHidden()
                                .environmentObject(userConfig)) {
                                Image("monkey_chance")
                                    .resizable()
                                    .frame(width: 130, height: 130)
                            }
                            
//                            NavigationLink(destination: EmptyView()) {
//                                Image("zeus_game")
//                                    .resizable()
//                                    .frame(width: 130, height: 130)
//                            }
//                            .padding(.leading, 2)
                        }
                        .padding(.top, 52)
                        
                        HStack {
                            
                            NavigationLink(destination: SlotGameById(slotName: "tiger_focus")
                                .navigationBarBackButtonHidden()
                                .environmentObject(userConfig)) {
                                Image("tiger_focus")
                                    .resizable()
                                    .frame(width: 130, height: 130)
                            }
                            .padding(.leading, 2)
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Image("fort")
                            .resizable()
                            .frame(width: 230, height: 230)
                            .rotationEffect(.degrees(wheelManager.currentAngle))
                        
                        Image("fort_indicator")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .offset(y: -110)
                        
                        if !dailyManager.isLocked {
                            Button {
                                wheelManager.spinWheel {
                                    userConfig.addCash(addingValue: 20)
                                    withAnimation(.linear) {
                                        bonusWin = true
                                    }
                                }
                                dailyManager.useFunction()
                            } label: {
                                Text("SPIN")
                                    .font(.custom("ChangaOne", size: 18))
                                    .foregroundColor(.white)
                            }
                        } else {
                            Text("\(dailyManager.remainingTimeFormatted)")
                                .font(.custom("ChangaOne", size: 16))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                VStack {
                    HStack(spacing: 0) {
                        ZStack {
                            Image("balance_bg")
                                .resizable()
                                .frame(width: 230, height: 55)
                            Text("\(userConfig.cash)")
                                .font(.custom("ChangaOne", size: 18))
                                .foregroundColor(.white)
                                .offset(y: -5)
                        }
                        
                        Button {
                            if userConfig.cash < 100 {
                                userConfig.addCash(addingValue: 1000)
                                addBalanceSuccess = true
                            } else {
                                addBalanceSuccess = false
                            }
                            addBalanceSuccessAlertShow = true
                        } label: {
                            Image("plus_balance")
                                .resizable()
                                .frame(width: 42, height: 42)
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.linear) {
                                volume.toggle()
                            }
                        } label: {
                            if volume {
                                Image("vol")
                                    .resizable()
                                    .frame(width: 42, height: 42)
                            } else {
                                Image("vol")
                                    .resizable()
                                    .frame(width: 42, height: 42)
                                    .opacity(0.6)
                            }
                        }
                        .padding(.trailing)
                        
                        Button {
                            withAnimation(.linear) {
                                vibro.toggle()
                            }
                        } label: {
                            if vibro {
                                Image("vibro")
                                    .resizable()
                                    .frame(width: 42, height: 42)
                            } else {
                                Image("vibro")
                                    .resizable()
                                    .frame(width: 42, height: 42)
                                    .opacity(0.6)
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
                
                if bonusWin {
                    VStack {
                        Spacer()
                        
                        HStack {
                            Text("20")
                                .font(.custom("ChangaOne", size: 124))
                                .foregroundColor(.white)
                            
                            Image("cash")
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                        
                        Spacer()
                        
                        Text("TAP TO CONTINUE")
                            .font(.custom("ChangaOne", size: 24))
                            .foregroundColor(.white)
                    }
                    .background(
                        Rectangle()
                            .fill(Color.init(red: 145/255, green: 0, blue: 197/255).opacity(0.37))
                            .frame(width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height + 30)
                            .ignoresSafeArea()
                    )
                    .onTapGesture {
                        withAnimation(.linear) {
                            bonusWin = false
                        }
                    }
                }
            }
            .onChange(of: volume) { newValue in
                UserDefaults.standard.set(newValue, forKey: "volume")
            }
            .onChange(of: vibro) { newValue in
                UserDefaults.standard.set(newValue, forKey: "vibro")
            }
            .alert(isPresented: $addBalanceSuccessAlertShow) {
                if addBalanceSuccess {
                    Alert(title: Text("Add balance Success"), dismissButton: .default(Text("Ok")))
                } else {
                    Alert(title: Text("Add balance Error"), message: Text("You must have less than 100 points to get points on your account"), dismissButton: .default(Text("Ok")))
                }
            }
            .background(
                Image("main_bg")
                    .resizable()
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height + 30)
                    .ignoresSafeArea()
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
