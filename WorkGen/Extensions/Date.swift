import Foundation

extension Date {
    
    func getDay() -> String {
        return self.formatted(
            .dateTime
                .day(.twoDigits)
        )
    }
    
    func getWeekday() -> String {
        return self.formatted(
            .dateTime
                .weekday(.abbreviated)
        )
    }
    
    func prettyFormat() -> String {
        return self.formatted(
            .dateTime
                .weekday()
                .month()
                .day()
                .year()
        )
    }
    
}
