import SwiftUI

struct ExerciseLabel: View {
    
    var name: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            BodyText(name, weight: "Bold")
                .frame(maxWidth: .infinity, alignment: .leading)
            BodyText(description)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 4))
        .background {
            RoundedRectangle(cornerRadius: 6)
                .fill(.white)
                .shadow(radius: 10)
        }
//        RoundedRectangle(cornerRadius: 6)
//            .fill(.white)
//            .shadow(radius: 10)
//            .frame(height: 48)
//            .overlay(alignment: .leading) {
//                VStack(alignment: .leading) {
//                    BodyText(name, weight: "Bold")
//                    BodyText(description)
//                }
//                .padding()
//            }
    }
}

#Preview {
    ExerciseLabel(name: "Bench Press", description: "6 reps for 3 sets")
}
