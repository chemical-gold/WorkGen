import FirebaseFirestore

extension CollectionReference {
    func whereField(_ field: String, isDate value: Date) -> Query {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: value)
        
        let start = Calendar.current.date(from: components)!
        let end = Calendar.current.date(byAdding: .day, value: 1, to: start)!

        return whereField(field, isGreaterThanOrEqualTo: start).whereField(field, isLessThan: end)
    }
}
