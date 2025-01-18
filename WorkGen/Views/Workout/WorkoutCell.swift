import SwiftUI

struct WorkoutCell: View {
    
    let workout: Workout
    let editCallback: ((Workout) -> Void)?
    let deleteCallback: ((Workout) -> Void)?
    
    @State var deleteAlertPresenting = false
    
    var body: some View {
        VStack(spacing: 32) {
            let groupings = Dictionary(grouping: workout.exercises) { $0.group }
            let sortedKeys = Array(groupings.keys).sorted { (lhs, rhs) -> Bool in
                return lhs < rhs
            }
            
            ForEach(sortedKeys, id: \.self) { key in
                SuperSetCell(label: "#\(key)", exercises: groupings[key] ?? [])
            }
            
            if editCallback != nil || deleteCallback != nil {
                HStack {
                    if let editCallback = editCallback {
                        Button {
                            editCallback(workout)
                        } label: {
                            Label("Edit", systemImage: "pencil")
                                .font(.custom("\(Constants.fontName)-Regular", size: 16))
                        }
                    }
                    
                    Spacer()
                    
                    if let deleteCallback = deleteCallback {
                        Button {
                            deleteAlertPresenting = true
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .font(.custom("\(Constants.fontName)-Regular", size: 16))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .alert("Are you sure you want to delete this workout?", isPresented: $deleteAlertPresenting) {
            Button(role: .destructive) {
                if let deleteCallback = deleteCallback {
                    deleteCallback(workout)
                }
            } label: {
                Text("Delete")
            }
        } message: {
            Text("You will not be able to recover this workout.")
        }

    }
}
//
//#Preview {
//    WorkoutCell(
//        workout: .constant(
//            Workout(
//                exercises: [
//                    Exercise(name: "Bench Press", description: "6 reps for 3 sets", group: 1),
//                    Exercise(name: "Dumbbell Curl", description: "10 reps for 3 sets", group: 1),
//                    Exercise(name: "Jog", description: "20 min for 1 set", group: 2)
//                ],
//                date: Date(),
//                completed: false
//            )
//        )
//    )
//}
