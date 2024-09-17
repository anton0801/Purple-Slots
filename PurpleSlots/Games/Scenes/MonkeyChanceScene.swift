import SwiftUI
import SpriteKit

class MonkeyChanceScene: SKScene {
    
    var imageAssetPrefix = "monkey_chance"
    
    var gameBackground: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_bg")
            node.position = CGPoint(x: size.width / 2, y: size.height / 2)
            node.size = size
            node.zPosition = -1
            return node
        }
    }
    
    private var infoBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_info")
            node.position = CGPoint(x: size.width - 400, y: size.height - 350)
            node.size = CGSize(width: 150, height: 300)
            node.name = "info_btn"
            node.zPosition = 5
            return node
        }
    }
    
    private var homeBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_home")
            node.position = CGPoint(x: size.width - 200, y: size.height - 350)
            node.size = CGSize(width: 150, height: 300)
            node.name = "home_btn"
            node.zPosition = 5
            return node
        }
    }
    
    private var balanceBackground: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_coins_bg")
            node.position = CGPoint(x: 450, y: size.height - 350)
            node.size = CGSize(width: 700, height: 300)
            return node
        }
    }
    private var balanceLabel: SKLabelNode!
    
    var cash = UserDefaults.standard.integer(forKey: "cash") {
        didSet {
            UserDefaults.standard.set(cash, forKey: "cash")
            balanceLabel.text = "\(cash)"
        }
    }
    
    private var slotsBg: SKSpriteNode! {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_slots_bg")
            node.position = CGPoint(x: size.width / 2 + 150, y: size.height / 2)
            node.size = CGSize(width: 1500, height: 2000)
            node.zPosition = -1
            return node
        }
    }
    
    private var slotTitle: SKSpriteNode! {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_title")
            node.position = CGPoint(x: size.width / 2 + 150, y: size.height - 300)
            node.size = CGSize(width: 1200, height: 600)
            return node
        }
    }
    
    private var spinBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_spin")
            node.position = CGPoint(x: size.width / 2 + 110, y: 250)
            node.size = CGSize(width: 400, height: 250)
            node.name = "spin_btn"
            node.zPosition = 5
            return node
        }
    }
    
    private var maxBetBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_max")
            node.position = CGPoint(x: 200, y: 250)
            node.size = CGSize(width: 200, height: 250)
            node.name = "maxBet"
            node.zPosition = 5
            return node
        }
    }
    
    private var minBetBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_min")
            node.position = CGPoint(x: 450, y: 250)
            node.size = CGSize(width: 200, height: 250)
            node.name = "minBet"
            node.zPosition = 5
            return node
        }
    }
    
    private var totalBetBg: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_coins_bg")
            node.position = CGPoint(x: 370, y: size.height / 2 - 650)
            node.size = CGSize(width: 530, height: 300)
            return node
        }
    }
    
    private var totalBetTitle: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_total_bet")
            node.position = CGPoint(x: 250, y: 800)
            node.size = CGSize(width: 250, height: 100)
            return node
        }
    }
    
    private var betMinusBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_minus")
            node.position = CGPoint(x: size.width / 2 - 200, y: 250)
            node.size = CGSize(width: 110, height: 180)
            node.name = "minus_bet"
            node.zPosition = 5
            return node
        }
    }
    
    private var betPlustBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_plus")
            node.position = CGPoint(x: size.width / 2 + 430, y: 250)
            node.size = CGSize(width: 130, height: 200)
            node.name = "plus_bet"
            node.zPosition = 5
            return node
        }
    }
    private var totalBetLabel: SKLabelNode!
    private var totalBet: Int = 10 {
        didSet {
            totalBetLabel.text = "\(totalBet)"
        }
    }
    
    private var slot1Baraban: TigerFocusSlotBaraban!
    private var slot2Baraban: TigerFocusSlotBaraban!
    private var slot3Baraban: TigerFocusSlotBaraban!
    private var slot4Baraban: TigerFocusSlotBaraban!
    private var slot5Baraban: TigerFocusSlotBaraban!
    
    override func didMove(to view: SKView) {
        size = CGSize(width: 2750, height: 2450)
        
        addChild(gameBackground)
        addChild(infoBtn)
        addChild(homeBtn)
        
        addChild(balanceBackground)
        
        balanceLabel = SKLabelNode(text: "\(cash)")
        balanceLabel.fontName = "ChangaOne"
        balanceLabel.fontSize = 120
        balanceLabel.fontColor = .white
        balanceLabel.position = CGPoint(x: 400, y: size.height - 370)
        addChild(balanceLabel)
        
        addChild(slotsBg)
        addChild(slotTitle)
        addChild(spinBtn)
        addChild(maxBetBtn)
        addChild(minBetBtn)
        addChild(totalBetBg)
        addChild(totalBetTitle)
        addChild(betMinusBtn)
        addChild(betPlustBtn)
        
        totalBetLabel = SKLabelNode(text: "\(totalBet)")
        totalBetLabel.fontName = "ChangaOne"
        totalBetLabel.fontSize = 120
        totalBetLabel.fontColor = .white
        totalBetLabel.position = CGPoint(x: 320, y: 540)
        addChild(totalBetLabel)
        
        slot1Baraban = TigerFocusSlotBaraban(slotId: imageAssetPrefix, slotSymbols: getSlotSymbols(), size: CGSize(width: 250, height: 1600), endScroll: nil)
        slot1Baraban.position = CGPoint(x: size.width / 2 - 440, y: size.height / 2 - 100)
        addChild(slot1Baraban)
        slot2Baraban = TigerFocusSlotBaraban(slotId: imageAssetPrefix, slotSymbols: getSlotSymbols(), size: CGSize(width: 250, height: 1600), endScroll: nil)
        slot2Baraban.position = CGPoint(x: size.width / 2 - 160, y: size.height / 2 - 100)
        addChild(slot2Baraban)
        slot3Baraban = TigerFocusSlotBaraban(slotId: imageAssetPrefix, slotSymbols: getSlotSymbols(), size: CGSize(width: 250, height: 1600), endScroll: nil)
        slot3Baraban.position = CGPoint(x: size.width / 2 + 130, y: size.height / 2 - 100)
        addChild(slot3Baraban)
        slot4Baraban = TigerFocusSlotBaraban(slotId: imageAssetPrefix, slotSymbols: getSlotSymbols(), size: CGSize(width: 250, height: 1600), endScroll: nil)
        slot4Baraban.position = CGPoint(x: size.width / 2 + 410, y: size.height / 2 - 100)
        addChild(slot4Baraban)
        slot5Baraban = TigerFocusSlotBaraban(slotId: imageAssetPrefix, slotSymbols: getSlotSymbols(), size: CGSize(width: 250, height: 1600), endScroll: nil)
        slot5Baraban.position = CGPoint(x: size.width / 2 + 690, y: size.height / 2 - 100)
        addChild(slot5Baraban)
        
        let pers = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_pers")
        pers.position = CGPoint(x: size.width - 250, y: size.height / 2 - 400)
        pers.size = CGSize(width: 700, height: size.height - 500)
        addChild(pers)
    }
    
    private func getSlotSymbols() -> [String] {
        return [
            "\(imageAssetPrefix)_symbol_1",
            "\(imageAssetPrefix)_symbol_2",
            "\(imageAssetPrefix)_symbol_3",
            "\(imageAssetPrefix)_symbol_4",
            "\(imageAssetPrefix)_symbol_5",
            "\(imageAssetPrefix)_symbol_6",
            "\(imageAssetPrefix)_symbol_7",
            "\(imageAssetPrefix)_symbol_8",
            "\(imageAssetPrefix)_symbol_9"
        ]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let t = touches.first {
            let object = atPoint(t.location(in: self))
            if object.name == "maxBet" {
                totalBet = 100
            }
            if object.name == "minBet" {
                totalBet = 10
            }
            if object.name == "plus_bet" {
                if totalBet < 100 {
                    totalBet += 10
                }
            }
            if object.name == "minus_bet" {
                if totalBet > 10 {
                    totalBet -= 10
                }
            }
            if object.name == "home_btn" {
                NotificationCenter.default.post(name: Notification.Name("home_action"), object: nil)
            }
            if object.name == "info_btn" {
                NotificationCenter.default.post(name: Notification.Name("info_slot"), object: nil)
            }
            if object.name == "spin_btn" {
                spin()
            }
        }
    }
    
    private func spin() {
        if cash >= totalBet {
            cash -= totalBet
            slot1Baraban.startScrolling()
            slot2Baraban.startScrolling()
            slot3Baraban.startScrolling()
            slot4Baraban.startScrolling()
            slot5Baraban.startScrolling()
        } else {
            NotificationCenter.default.post(name: Notification.Name("not_cash"), object: nil)
        }
    }
    
    
}

#Preview {
    VStack {
        SpriteView(scene: MonkeyChanceScene())
            .ignoresSafeArea()
    }
}
