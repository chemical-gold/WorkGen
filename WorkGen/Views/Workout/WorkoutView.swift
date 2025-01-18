import SwiftUI

struct WorkoutView: View {
    
    @Binding var date: Date
    let editCallback: ((Workout) -> Void)?
    let deleteCallback: ((Workout) -> Void)?
    
    @EnvironmentObject var databaseManager: DatabaseManager
    @EnvironmentObject var authContext: AuthContext
    @State var workouts: [Workout] = []
    @State var refreshTrigger = false

    var body: some View {
        VStack(spacing: 32) {
            if workouts.count < 1 {
                BodyText("There's nothing here. Go to your schedule to create a workout!")
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                ForEach(workouts, id: \.id) { workout in
                    WorkoutCell(workout: workout, editCallback: editCallback, deleteCallback: deleteCallback)
                    Divider()
                }
            }
        }
        .onAppear {
            databaseManager.getWorkoutsBy(date: date, userId: authContext.user?.uid ?? "") { workouts in
                self.workouts = workouts
            }
        }
        .onChange(of: date) { oldValue, newValue in
            databaseManager.getWorkoutsBy(date: newValue, userId: authContext.user?.uid ?? "") { workouts in
                self.workouts = workouts
            }
        }
    }
}
//
//#Preview {
//    WorkoutLayout(
//        workouts: .constant([
//            Workout(
//                exercises: [
//                    Exercise(name: "Bench Press", description: "6 reps for 3 sets", group: 1),
//                    Exercise(name: "Dumbbell Curl", description: "10 reps for 3 sets", group: 1),
//                    Exercise(name: "Jog", description: "20 min for 1 set", group: 2)
//                ],
//                date: Date(),
//                completed: false
//            ),
//            Workout(
//                exercises: [
//                    Exercise(name: "Bench Press", description: "6 reps for 3 sets", group: 1),
//                    Exercise(name: "Dumbbell Curl", description: "10 reps for 3 sets", group: 1),
//                    Exercise(name: "Jog", description: "20 min for 1 set", group: 2)
//                ],
//                date: Date(),
//                completed: false
//            )
//        ])
//    )
//}
