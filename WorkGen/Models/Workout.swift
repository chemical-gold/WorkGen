import FirebaseFirestore

struct Workout: Codable, Identifiable {
    @DocumentID var id: String?
    var exercises: [Exercise]
    var date: Date
    var completed: Bool
    var userId: String
}
