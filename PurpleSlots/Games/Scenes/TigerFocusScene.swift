import SwiftUI
import SpriteKit

class TigerFocusScene: SKScene {
    
    var imageAssetPrefix = "tiger_focus"
    
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
            node.position = CGPoint(x: size.width - 350, y: 350)
            node.size = CGSize(width: 150, height: 300)
            node.name = "info_btn"
            return node
        }
    }
    
    private var homeBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_home")
            node.position = CGPoint(x: size.width - 150, y: 350)
            node.size = CGSize(width: 150, height: 300)
            node.name = "home_btn"
            return node
        }
    }
    
    private var balanceBackground: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_coins_bg")
            node.position = CGPoint(x: size.width - 450, y: size.height - 350)
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
            node.position = CGPoint(x: size.width / 2 - 300, y: size.height / 2)
            node.size = CGSize(width: 1500, height: 1800)
            return node
        }
    }
    
    private var slotTitle: SKSpriteNode! {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_title")
            node.position = CGPoint(x: size.width / 2 - 300, y: size.height - 350)
            node.size = CGSize(width: 1200, height: 500)
            return node
        }
    }
    
    private var spinBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_spin")
            node.position = CGPoint(x: size.width / 2 - 300, y: 220)
            node.size = CGSize(width: 540, height: 300)
            node.name = "spin_btn"
            node.zPosition = 5
            return node
        }
    }
    
    private var maxBetBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_max")
            node.position = CGPoint(x: size.width / 2 - 1050, y: 220)
            node.size = CGSize(width: 285, height: 300)
            node.name = "maxBet"
            node.zPosition = 5
            return node
        }
    }
    
    private var minBetBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_min")
            node.position = CGPoint(x: size.width / 2 - 740, y: 220)
            node.size = CGSize(width: 285, height: 300)
            node.name = "minBet"
            node.zPosition = 5
            return node
        }
    }
    
    private var totalBetBg: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_coins_bg")
            node.position = CGPoint(x: size.width / 2 + 440, y: 220)
            node.size = CGSize(width: 520, height: 300)
            return node
        }
    }
    
    private var totalBetTitle: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_total_bet")
            node.position = CGPoint(x: size.width / 2 + 440, y: 430)
            node.size = CGSize(width: 250, height: 130)
            return node
        }
    }
    
    private var betMinusBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_minus")
            node.position = CGPoint(x: size.width / 2 + 100, y: 210)
            node.size = CGSize(width: 130, height: 200)
            node.name = "minus_bet"
            node.zPosition = 5
            return node
        }
    }
    
    private var betPlustBtn: SKSpriteNode {
        get {
            let node = SKSpriteNode(imageNamed: "\(imageAssetPrefix)_plus")
            node.position = CGPoint(x: size.width / 2 + 780, y: 210)
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
        balanceLabel.position = CGPoint(x: size.width - 400, y: size.height - 370)
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
        totalBetLabel.position = CGPoint(x: size.width / 2 + 440, y: 200)
        addChild(totalBetLabel)
        
        slot1Baraban = TigerFocusSlotBaraban(slotId: imageAssetPrefix, slotSymbols: getSlotSymbols(), size: CGSize(width: 250, height: 1600), endScroll: nil)
        slot1Baraban.position = CGPoint(x: 480, y: size.height / 2)
        addChild(slot1Baraban)
        slot2Baraban = TigerFocusSlotBaraban(slotId: imageAssetPrefix, slotSymbols: getSlotSymbols(), size: CGSize(width: 250, height: 1600), endScroll: nil)
        slot2Baraban.position = CGPoint(x: 770, y: size.height / 2)
        addChild(slot2Baraban)
        slot3Baraban = TigerFocusSlotBaraban(slotId: imageAssetPrefix, slotSymbols: getSlotSymbols(), size: CGSize(width: 250, height: 1600), endScroll: nil)
        slot3Baraban.position = CGPoint(x: size.width / 2 - 310, y: size.height / 2)
        addChild(slot3Baraban)
        slot4Baraban = TigerFocusSlotBaraban(slotId: imageAssetPrefix, slotSymbols: getSlotSymbols(), size: CGSize(width: 250, height: 1600), endScroll: nil)
        slot4Baraban.position = CGPoint(x: size.width / 2 - 10, y: size.height / 2)
        addChild(slot4Baraban)
        slot5Baraban = TigerFocusSlotBaraban(slotId: imageAssetPrefix, slotSymbols: getSlotSymbols(), size: CGSize(width: 250, height: 1600), endScroll: nil)
        slot5Baraban.position = CGPoint(x: size.width / 2 + 290, y: size.height / 2)
        addChild(slot5Baraban)
    }
    
    private func getSlotSymbols() -> [String] {
        return [
            "tiger_focus_symbol_1",
            "tiger_focus_symbol_2",
            "tiger_focus_symbol_3",
            "tiger_focus_symbol_4",
            "tiger_focus_symbol_5",
            "tiger_focus_symbol_6",
            "tiger_focus_symbol_7",
            "tiger_focus_symbol_8",
            "tiger_focus_symbol_9"
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
        SpriteView(scene: TigerFocusScene())
            .ignoresSafeArea()
    }
}

class TigerFocusSlotBaraban: SKSpriteNode {
    
    var slotSymbols: [String]
    private let cropNode: SKCropNode
    private let contentNode: SKNode
    private var currentOffset: CGFloat = 0
    var endScroll: (() -> Void)?
    private var slotId: String
    
    var reverseScroll = false
    
    func startScrolling() {
        if reverseScroll {
            reverseScroll = false
            let actionMove = SKAction.moveBy(x: 0, y: -(580.5 * CGFloat(Int.random(in: 4...6))), duration: 0.5)
            contentNode.run(actionMove) {
                self.endScroll?()
            }
        } else {
            let actionMove = SKAction.moveBy(x: 0, y: 580.5 * CGFloat(Int.random(in: 4...6)), duration: 0.5)
            contentNode.run(actionMove) {
                self.endScroll?()
            }
            reverseScroll = true
        }
    }
    
    init(slotId: String, slotSymbols: [String], size: CGSize, endScroll: (() -> Void)?) {
        self.slotId = slotId
        self.slotSymbols = slotSymbols
        self.cropNode = SKCropNode()
        self.contentNode = SKNode()
        self.endScroll = endScroll
        
        super.init(texture: nil, color: .clear, size: size)
        addSymbols()
    }
    
    private func updateSlotSymbols() {
        var slotsTemp = slotSymbols.shuffled()
        var temp = slotSymbols
        self.slotSymbols = []
        for i in 1...(temp.count * 9) {
            if i % temp.count == 0 {
                slotsTemp = temp.shuffled()
            }
            let item = slotsTemp[i % temp.count]
            self.slotSymbols.append(item)
        }
        self.slotSymbols.append("\(slotId)_scatter")
        self.slotSymbols.append("\(slotId)_scatter")
        self.slotSymbols.append("\(slotId)_scatter")
        self.slotSymbols = self.slotSymbols.shuffled()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSymbols() {
        cropNode.position = CGPoint(x: 0, y: 0)
        let maskNode = SKSpriteNode(color: .black, size: size)
        maskNode.position = CGPoint(x: 0, y: 0)
        cropNode.maskNode = maskNode
        addChild(cropNode)
        cropNode.addChild(contentNode)
        if Bool.random() && Bool.random() {
            self.slotSymbols.append("\(slotId)_scatter")
        }
        let shuffledSymbols = slotSymbols.shuffled()
        for i in 0..<slotSymbols.count * 8 {
            let nameSymbol = shuffledSymbols[i % slotSymbols.count]
            let symbol = SKSpriteNode(imageNamed: nameSymbol)
            symbol.size = CGSize(width: 270, height: 470)
            symbol.zPosition = 1
            symbol.name = nameSymbol
            symbol.position = CGPoint(x: 0, y: size.height - CGFloat(i) * 580.5)
            contentNode.addChild(symbol)
        }
        contentNode.run(SKAction.moveBy(x: 0, y: 585.5 * CGFloat(slotSymbols.count * 3), duration: 0.0))
    }
    
}
