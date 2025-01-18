import SwiftUI

struct HomeView: View {
    
    
    @Binding var tabSelection: Int
    
    @EnvironmentObject var authContext: AuthContext
    @EnvironmentObject var databaseManager: DatabaseManager
    @State var currentDate: Date = Date()
    var dates: [Date] = []
    
    init(tabSelection: Binding<Int>) {
        self._tabSelection = tabSelection
        
        dates.append(currentDate)
        var currentDate = Date()

        for _ in 1...6 {
            let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
            dates.append(nextDay)
            currentDate = nextDay
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    BodyText("Where would you like to go?", weight: "Bold")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Button() {
                                tabSelection = 2
                            } label: {
                                Label("Schedule", systemImage: "calendar")
                            }
                            .buttonStyle(BorderedProminentButtonStyle())
                            .tint(.lightBlue.opacity(0.5))
                            .foregroundStyle(.darkCyan)
                            
                            Button() {
                                tabSelection = 3
                            } label: {
                                Label("Exercises", systemImage: "figure.run")
                            }
                            .buttonStyle(BorderedProminentButtonStyle())
                            .tint(.lightBlue.opacity(0.5))
                            .foregroundStyle(.darkCyan)
                        }

                        Button {
                            tabSelection = 4
                        } label: {
                            Label("Settings", systemImage: "gear")
                        }
                        .buttonStyle(BorderedProminentButtonStyle())
                        .tint(.lightBlue.opacity(0.5))
                        .foregroundStyle(.darkCyan)
                    }
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    BodyText("Overview", weight: "Bold")
                    
                    HStack {
                        ForEach(dates, id: \.timeIntervalSince1970) { date in
                            Button {
                                currentDate = date
                            } label: {
                                DateLabel(date: date, active: currentDate == date)
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    BodyText(currentDate.prettyFormat(), weight: "Bold")
                    WorkoutView(date: $currentDate, editCallback: nil, deleteCallback: nil)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(24)
        }
        .withTitle(Constants.displayName != nil ? "Hey \(Constants.displayName!)!" : "WorkGen")
    }
}

//#Preview {
//    HomeView()
//}
