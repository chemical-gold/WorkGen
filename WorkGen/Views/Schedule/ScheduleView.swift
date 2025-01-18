import SwiftUI

struct ScheduleView: View {
    
    @EnvironmentObject var authContext: AuthContext
    @EnvironmentObject var databaseManager: DatabaseManager
    
    @State var currentDate: Date = Date()
    @State var editingWorkout: Workout? = nil
    
    var body: some View {
        ScrollView {
            VStack {
                CalendarView { date in
                    currentDate = date
                }
                
                VStack(alignment: .leading) {
                    BodyText(currentDate.prettyFormat(), weight: "Bold")
                    WorkoutView(date: $currentDate) { workout in
                        editingWorkout = workout
                    } deleteCallback: { workout in
                        databaseManager.deleteWorkout(from: workout)
                        currentDate = currentDate.advanced(by: 0.01)
                    }
                }
                .padding(32)
                
                VStack {
                    RoundedButton("Create Workout") {
                        editingWorkout = Workout(
                            exercises: [Exercise(name: "", description: "", group: 1)],
                            date: currentDate,
                            completed: false,
                            userId: authContext.user?.uid ?? ""
                        )
                    }
                    
//                    Button {
//                        editingWorkout = Workout(
//                            exercises: [Exercise(name: "", description: "", group: 1)],
//                            date: currentDate,
//                            completed: false,
//                            userId: authContext.user?.uid ?? ""
//                        )
//                    } label: {
//                        Label("Add Workout", systemImage: "plus")
//                            .font(.custom("Jost-Regular", size: 18))
//                    }
//                    
//                    Button {
//                        generateWorkout = true
//                    } label: {
//                        Label("Generate Workout with AI", systemImage: "plus")
//                            .font(.custom("Jost-Regular", size: 18))
//                    }
                }
                .padding(.horizontal, 32)
            }
            .padding(.bottom, 64)
        }
        .padding(.top)
        .withTitle("Schedule")
        .background(.white)
        .sheet(item: $editingWorkout) { workout in
            EditView(workout: workout) {
                editingWorkout = nil
                currentDate = currentDate.advanced(by: 0.01)
            }
        }
    }
}

#Preview {
    ScheduleView()
}
