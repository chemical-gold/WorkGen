import SwiftUI

struct ExerciseView: View {
    var body: some View {
        GeometryReader { geometryReader in
            ScrollView {
                VStack {
                    HStack {
                        NavigationLink {
                            ExerciseDescription(
                                name: "Squats",
                                description: "Squats are a compound strength-training exercise where a person lowers their body by bending their knees and hips, engaging primarily the quadriceps, hamstrings, glutes, and core muscles.",
                                targetMuscles: "Quads, Hamstrings, Glutes, Core, Lower Back",
                                image: "squats"
                            )
                        } label: {
                            ExerciseCard(name: "Squats", image: "squats")
                                .frame(width: geometryReader.size.width / 2)
                        }
                        
                        NavigationLink {
                            ExerciseDescription(
                                name: "Deadlifts",
                                description: "Deadlifts are a compound weightlifting exercise where a person lifts a loaded barbell from the ground to a standing position, engaging the muscles of the posterior chain including the hamstrings, glutes, lower back, and traps, along with the core and grip strength.",
                                targetMuscles: "Hamstrings, Glutes, Lower Back, Traps, Core, Forearms, Grip",
                                image: "deadlifts"
                            )
                        } label: {
                            ExerciseCard(name: "Deadlifts", image: "deadlifts")                    .frame(width: geometryReader.size.width / 2)
                        }
                    }
                    
                    HStack {
                        NavigationLink {
                            ExerciseDescription(
                                name: "Bench Press",
                                description: "The bench press is a compound weightlifting exercise where a person lies on a flat bench, lowers a barbell to their chest, then pushes it upward, primarily targeting the chest, shoulders, and triceps muscles.",
                                targetMuscles: "Chest, Shoulders, Triceps, Core, Upper Back",
                                image: "benchpress"
                            )
                        } label: {
                            ExerciseCard(name: "Bench Press", image: "benchpress")
                                                        .frame(width: geometryReader.size.width / 2)
                        }
                        
                        NavigationLink {
                            ExerciseDescription(
                                name: "Overhead Press",
                                description: "The overhead press, also known as the shoulder press, is a compound weightlifting exercise where a person lifts a weighted barbell or dumbbells from shoulder height to overhead, primarily targeting the deltoid muscles of the shoulders, along with the triceps and upper chest.",
                                targetMuscles: "Shoulders, Triceps, Upper Chest, Core",
                                image: "overheadpress"
                            )
                        } label: {
                            ExerciseCard(name: "Overhead Press", image: "overheadpress")
                                                        .frame(width: geometryReader.size.width / 2)
                        }
                    }
                    
                    HStack {
                        NavigationLink {
                            ExerciseDescription(
                                name: "Pull-Ups",
                                description: "Pull-ups are a bodyweight exercise where a person hangs from a bar and pulls themselves upward until their chin passes the bar, primarily targeting the muscles of the back, including the latissimus dorsi, as well as the biceps and forearms.",
                                targetMuscles: "Back, Biceps, Deltoids, Forearms, Core",
                                image: "pullups"
                            )
                        } label: {
                            ExerciseCard(name: "Pull-Ups", image: "pullups")
                                                        .frame(width: geometryReader.size.width / 2)
                        }
                        
                        NavigationLink {
                            ExerciseDescription(
                                name: "Barbell Rows",
                                description: "Barbell rows are a compound weightlifting exercise where a person bends at the hips and knees, pulls a loaded barbell towards their abdomen, engaging the muscles of the upper back, including the latissimus dorsi, rhomboids, and traps, as well as the biceps and forearms.",
                                targetMuscles: "Upper Back, Biceps, Forearms, Core",
                                image: "barbellrows"
                            )
                        } label: {
                            ExerciseCard(name: "Barbell Rows", image: "barbellrows")
                                                        .frame(width: geometryReader.size.width / 2)
                        }
                    }
                    
                    HStack {
                        NavigationLink {
                            ExerciseDescription(
                                name: "Dips",
                                description: "Dips are a bodyweight exercise where a person lowers their body by bending their elbows until their shoulders are below their elbows, primarily targeting the chest, shoulders, and triceps.",
                                targetMuscles: "Chest, Shoulders, Triceps, Core",
                                image: "dips"
                            )
                        } label: {
                            ExerciseCard(name: "Dips", image: "dips")
                                                        .frame(width: geometryReader.size.width / 2)
                        }
                        
                        NavigationLink {
                            ExerciseDescription(
                                name: "lunges",
                                description: "Lunges are a lower body exercise where a person steps forward or backward, lowering their body until both knees are bent at a 90-degree angle, primarily targeting the quadriceps, hamstrings, glutes, and calves, while also engaging the core for stability.",
                                targetMuscles: "Quads, Hamstrings, Glutes, Calves, Core",
                                image: "lunges"
                            )
                        } label: {
                            ExerciseCard(name: "Lunges", image: "lunges")
                                                        .frame(width: geometryReader.size.width / 2)
                        }
                    }
                }
            }
            .padding(.top)
        }
        .withTitle("Exercises")
    }
}

#Preview {
    ExerciseView()
}
