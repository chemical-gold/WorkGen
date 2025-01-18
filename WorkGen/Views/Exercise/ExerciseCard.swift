import SwiftUI

struct ExerciseCard: View {
    
    let name: String
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                BodyText(name)
                    .padding(4)
                    .background {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.lightBlue.opacity(0.75))
                    }
            }
            .cornerRadius(12)
    }
}

// Squats, Deadlifts, Bench Press, Overhead Press, Pull-Ups, Barbell Row, Dips, Lunges
#Preview {
    GeometryReader { geometryReader in
        VStack {
            HStack {
                ExerciseCard(name: "Squats", image: "squats")
                    .frame(width: geometryReader.size.width / 2)
                ExerciseCard(name: "Deadlifts", image: "deadlifts")                    .frame(width: geometryReader.size.width / 2)
            }
            
            HStack {
                ExerciseCard(name: "Bench Press", image: "benchpress")
                    .frame(width: geometryReader.size.width / 2)
                ExerciseCard(name: "Overhead Press", image: "overheadpress")
                    .frame(width: geometryReader.size.width / 2)
            }
            
            HStack {
                ExerciseCard(name: "Pull-Ups", image: "pullups")
                    .frame(width: geometryReader.size.width / 2)
                ExerciseCard(name: "Barbell Row", image: "barbellrows")
                    .frame(width: geometryReader.size.width / 2)
            }
            
            HStack {
                ExerciseCard(name: "Dips", image: "dips")
                    .frame(width: geometryReader.size.width / 2)
                ExerciseCard(name: "Lunges", image: "lunges")
                    .frame(width: geometryReader.size.width / 2)
            }
        }
    }
}
