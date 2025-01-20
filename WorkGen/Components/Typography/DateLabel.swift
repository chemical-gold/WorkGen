import SwiftUI

struct DateLabel: View {
    
    var date: Date
    var active = false
    
    var body: some View {
        VStack {
            Text(date.getWeekday())
                .font(.custom("\(Constants.fontName)-Regular", size: 8))
                .foregroundColor(active ? .darkCyan : .black)
            Text(date.getDay())
                .font(.custom("\(Constants.fontName)-Bold", size: 12))
                .foregroundColor(.darkCyan)
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(active ? .lightBlue : .lightBlue.opacity(0.5))
        }
//        RoundedRectangle(cornerRadius: 12)
//            .fill(active ? .lightBlue : .lightBlue.opacity(0.5))
//            .frame(width: 45, height: 70)
//            .overlay(alignment: .center) {
//                VStack {
//                    BodyText(date.getWeekday())
//                        .foregroundColor(active ? .darkCyan : .black)
//                    Text(date.getDay())
//                        .font(.custom("Jost-Bold", size: 24))
//                        .foregroundColor(.darkCyan)
//                }
//            }
    }
    
}

#Preview {
    DateLabel(date: Date())
}
