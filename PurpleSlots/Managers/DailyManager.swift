import Foundation
import Combine
import SwiftUI
import Combine

class DailyManager: ObservableObject {
    @Published var isLocked: Bool = false
    @Published var remainingTimeFormatted: String = "24:00"
    
    private let userDefaults = UserDefaults.standard
    private let lastUsedKey = "lastUsedTime"
    private var timer: Timer?
    private let lockTimeInterval: TimeInterval = 24 * 60 * 60 // 24 часа
    private var remainingTime: TimeInterval = 0
    
    init() {
        checkAvailability() // Проверить доступность функции при инициализации
    }
    
    // Функция для проверки, прошло ли 24 часа
    func checkAvailability() {
        guard let lastUsed = userDefaults.object(forKey: lastUsedKey) as? Date else {
            isLocked = false // Если функция никогда не использовалась, она доступна
            return
        }
        
        let now = Date()
        let timePassed = now.timeIntervalSince(lastUsed)
        
        if timePassed >= lockTimeInterval {
            isLocked = false // 24 часа прошли, функция доступна
        } else {
            remainingTime = lockTimeInterval - timePassed
            isLocked = true // Функция заблокирована
            updateRemainingTimeFormatted()
            startTimer(withRemainingTime: remainingTime)
        }
    }
    
    // Функция для использования (например, получения бонуса)
    func useFunction() {
        if !isLocked {
            // Логика использования функции, например, начисление бонуса
            print("Функция использована!")
            userDefaults.set(Date(), forKey: lastUsedKey) // Сохранить текущее время как время последнего использования
            remainingTime = lockTimeInterval
            isLocked = true
            updateRemainingTimeFormatted()
            startTimer(withRemainingTime: remainingTime) // Запустить таймер на 24 часа
        } else {
            print("Функция заблокирована, подождите окончания таймера.")
        }
    }
    
    // Обновление форматированного времени
    private func updateRemainingTimeFormatted() {
        let hours = Int(remainingTime) / 3600
        let minutes = (Int(remainingTime) % 3600) / 60
        remainingTimeFormatted = String(format: "%02d:%02d", hours, minutes)
    }
    
    // Запуск таймера с оставшимся временем
    private func startTimer(withRemainingTime time: TimeInterval) {
        timer?.invalidate() // Остановить предыдущий таймер, если он есть
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.remainingTime -= 1
            self.updateRemainingTimeFormatted()
            if self.remainingTime <= 0 {
                self.isLocked = false
                self.timer?.invalidate()
                self.timer = nil
                print("Таймер завершен, функция снова доступна.")
            }
        }
        print("Таймер запущен на \(time) секунд.")
    }
    
    // Функция для остановки таймера
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

