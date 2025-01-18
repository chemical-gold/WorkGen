import SwiftUI

struct EditView: View {
    
    @EnvironmentObject var databaseManager: DatabaseManager
    
    @State var workout: Workout
    var completionCallback: () -> Void
    
    @State var exerciseGroups: [[Exercise]]
    
    init(workout: Workout, completionCallback: @escaping () -> Void) {
        self.workout = workout
        self.completionCallback = completionCallback
        
        let groupings = Dictionary(grouping: workout.exercises) { $0.group }
        let sortedKeys = groupings.keys.sorted()
        self.exerciseGroups = sortedKeys.map { groupings[$0] ?? [] }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ForEach(0..<exerciseGroups.count, id: \.self) { index in
                    VStack(alignment: .trailing) {
                        HStack(alignment: .top) {
                            CircularLabel("#\(index + 1)")
                            
                            VStack(spacing: 32) {
                                ForEach(0..<exerciseGroups[index].count, id: \.self) { exerciseIndex in
                                    HStack(alignment: .top) {
                                        VStack {
                                            RoundedTextField("Enter exercise name", text: $exerciseGroups[index][exerciseIndex].name)
                                            RoundedTextField("Enter exercise description", text: $exerciseGroups[index][exerciseIndex].description)
                                        }
                                        
                                        Button {
                                            exerciseGroups[index].remove(at: exerciseIndex)
                                        } label: {
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                        }
                                        .padding(.top, 16)
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                        
                        HStack {
                            Button {
                                exerciseGroups.remove(at: index)
                            } label: {
                                Label("Remove Group", systemImage: "trash")
                                    .foregroundColor(.red)
                            }
                            
                            Spacer()
                            
                            Button {
                                exerciseGroups[index].append(Exercise(name: "", description: "", group: index + 1))
                            } label: {
                                Label("Add Exercise", systemImage: "plus")
                                    .font(.custom("\(Constants.fontName)-Regular", size: 18))
                            }
                        }
                    }
                }
                
                Button {
                    exerciseGroups.append([Exercise(name: "", description: "", group: exerciseGroups.count + 1)])
                } label: {
                    Label("Add Group", systemImage: "plus")
                        .font(.custom("\(Constants.fontName)-Regular", size: 18))
                }
                
                RoundedButton("Save") {
                    workout.exercises = exerciseGroups.joined().map { $0 }
                    databaseManager.createOrUpdateWorkout(from: workout)
                    completionCallback()
                }
            }
            .padding(16)
        }
        .withTitle("Edit Workout")
    }
    
}

//#Preview {
//    EditView(
//        workout: Workout(
//            exercises: [
//                Exercise(name: "Bench Press", description: "6 reps for 3 sets", group: 1),
//                Exercise(name: "Dumbbell Curl", description: "10 reps for 3 sets", group: 1),
//                Exercise(name: "Jog", description: "20 min for 1 set", group: 2)
//            ],
//            date: Date(),
//            completed: false,
//            userId: ""
//        )
//    )
//}
