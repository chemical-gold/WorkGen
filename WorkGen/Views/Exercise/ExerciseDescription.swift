import SwiftUI

struct ExerciseDescription: View {
    
    let name: String
    let description: String
    let targetMuscles: String
    let image: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                
                BodyText("Description: ", weight: "Bold")
                BodyText(description)
                    .padding(.bottom)
                
                BodyText("Muscles: ", weight: "Bold")
                BodyText(targetMuscles)
                
                Spacer()
            }
            .padding(32)
        }
        .withTitle(name)
    }
}

#Preview {
    ExerciseDescription(
        name: "Bench Press",
        description: "The bench press is a compound weightlifting exercise where a person lies on a flat bench, lowers a barbell to their chest, then pushes it upward, primarily targeting the chest, shoulders, and triceps muscles.",
        targetMuscles: "Chest, shoulders, triceps, core, upper back",
        image: "benchpress"
    )
}
