
import SwiftUI

enum Operation: String, CaseIterable, Identifiable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "×"
    case division = "÷"
    
    var id: Self { self }
}

struct ContentView: View {
    @State private var number1 = ""
    @State private var number2 = ""
    @State private var signNumber = Operation.addition
    @State private var result = "0"
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("", text: $number1)
            TextField("", text: $number2)
            
//            Picker(selection: $signNumber, label: Text("符号を選択")) {
//                Text("+")
//                    .tag(0)
//                Text("-")
//                    .tag(1)
//                Text("×")
//                    .tag(2)
//                Text("÷")
//                    .tag(3)
//            }
            
            Picker("Operation", selection: $signNumber) {
                ForEach(Operation.allCases) { operation in
                    Text(operation.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            Button(action: {
                result = calclation()
            }) {
                Text("計算")
            }
            Text(result)
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(width: 200)
    }
    func calclation() -> String {
        let num1 = Double(number1) ?? 0
        let num2 = Double(number2) ?? 0
        
        switch signNumber {
        case .addition:
            return String(num1 + num2)
        case .subtraction:
            return String(num1 - num2)
        case .multiplication:
            return String(num1 * num2)
        case .division:
            guard num2 == 0 else {
                return String(num1 / num2)
            }
            return "割る数には0以外を入力してください"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
