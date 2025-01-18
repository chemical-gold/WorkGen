import SwiftUI
import SwiftUICalendar


struct CalendarView: View {
    
    let callback: (Date) -> Void
    @ObservedObject var controller: CalendarController = CalendarController(orientation: .horizontal)
    @State var selectedDate: YearMonthDay = YearMonthDay.current
    
    var body: some View {
        GeometryReader { reader in
            VStack(alignment: .center, spacing: 0) {
                BodyText("\(controller.yearMonth.monthShortString) \(String(controller.yearMonth.year))", weight: "Bold")
                HStack(alignment: .center, spacing: 0) {
                    ForEach(DateFormatter().shortWeekdaySymbols, id: \.self) { weekday in
                        BodyText(weekday)
                            .frame(width: reader.size.width / 7)
                    }
                }
                
                SwiftUICalendar.CalendarView(controller) { date in
                    GeometryReader { geometry in
                        Button {
                            selectedDate = date
                            callback(date.date ?? Date())
                        } label: {
                            if selectedDate == date {
                                ZStack(alignment: .center){
                                    Circle()
                                        .fill(.accent.opacity(0.5))
                                    
                                    BodyText("\(date.day)")
                                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                        .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                        .foregroundColor(.black)
                                }
                            } else {
                                BodyText("\(date.day)")
                                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                    .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 32, bottom: 8, trailing: 32))
        .frame(height: 320)
    }
    
}

#Preview {
    CalendarView { date in
        print(date)
    }
}
