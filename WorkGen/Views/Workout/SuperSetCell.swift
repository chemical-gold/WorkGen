import SwiftUI

struct SuperSetCell: View {
    
    let label: String
    let exercises: [Exercise]
    
    var body: some View {
        HStack(alignment: .top) {
            CircularLabel(label)
                .padding(.top, 8)
            VStack {
                ForEach(exercises, id: \.name) { exercise in
                    ExerciseLabel(name: exercise.name, description: exercise.description)
                }
            }
        }
    }
}

#Preview {
    VStack {
        SuperSetCell(
            label: "#1",
            exercises: [
                Exercise(name: "Bench Press", description: "6 reps for 3 sets", group: 1),
                Exercise(name: "Dumbbell Curl", description: "10 reps for 3 sets", group: 1)
            ]
        )
        
        SuperSetCell(
            label: "#2",
            exercises: [
                Exercise(name: "Bench Press", description: "6 reps for 3 sets", group: 1),
                Exercise(name: "Dumbbell Curl", description: "10 reps for 3 sets", group: 1)
            ]
        )
    }
}
