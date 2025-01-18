import FirebaseFirestore

class DatabaseManager: ObservableObject {
    
    let errorHandler: ErrorHandler
    let database = Firestore.firestore()
    
    init(errorHandler: ErrorHandler) {
        self.errorHandler = errorHandler
    }
    
    func getWorkoutsBy(date: Date, userId: String, callback: @escaping ([Workout]) -> Void) {
        var listener: ListenerRegistration?
        
        listener = self.database.collection("workouts")
            .whereField("date", isDate: date)
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { querySnapshot, error in
                if (querySnapshot != nil) {
                    var workouts: [Workout] = []
                    for document in querySnapshot!.documents {
                        if let parsedWorkout = try? document.data(as: Workout.self) {
                            workouts.append(parsedWorkout)
                        }
                        
                    }
                    
                    callback(workouts)
                }
                
                listener?.remove()
            }
    }
    
    func createWorkout(from workout: Workout) {
        let reference = self.database.collection("workouts")
        
        do {
            try reference.addDocument(from: workout)
        } catch {
            self.errorHandler.handle("Failed to add workout")
        }
    }
    
    func createOrUpdateWorkout(from workout: Workout) {
        let reference = self.database.collection("workouts")
        
        if workout.id == nil {
            createWorkout(from: workout)
            return
        }
        
        do {
            try reference.document(workout.id!).setData(from: workout)
        } catch {
            self.errorHandler.handle("Error updating workout")
        }
    }
    
    func deleteWorkout(from workout: Workout) {
        let reference = self.database.collection("workouts")
        
        if workout.id == nil {
            return
        }
        
        let document = reference.document(workout.id!)
        document.delete()
    }
    
//    func testFunction() {
//        let reference = self.datebase.collection("workouts")
//        let exercises = [
//            Exercise(name: "Bench Press", description: "6 reps for 3 sets", group: 1),
//            Exercise(name: "Dumbbell Curl", description: "10 reps for 3 sets", group: 1),
//            Exercise(name: "Jog", description: "20 min for 1 set", group: 2)
//        ]
//        let workout = Workout(exercises: exercises, date: Date(), completed: false)
//        
//        try! reference.addDocument(from: workout)
//    }
    
}
