import SwiftUI

class WheelManager: ObservableObject {
    @Published var currentAngle: Double = 0
    private let totalSpins: Double = 5 // Количество оборотов
    private let targetAngle: Double = 270 // Угол, на который должно остановиться колесо (например, 270 градусов)
    private let animationDuration: Double = 3 // Время анимации
    
    func spinWheel(completion: @escaping () -> Void) {
        // Начальный угол
        let startAngle = currentAngle
        
        // Финальный угол с учётом количества оборотов
        let finalAngle = startAngle + (360 * totalSpins) + targetAngle
        
        // Анимация вращения колеса
        withAnimation(.easeOut(duration: animationDuration)) {
            currentAngle = finalAngle
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            completion()
        }
    }
}
