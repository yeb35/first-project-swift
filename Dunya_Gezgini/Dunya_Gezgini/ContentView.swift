//
//  ContentView.swift
//  Dunya_Gezgini
//
//  Created by Yunus Emre BOLGÖNÜL on 8.05.2023.
//
import SwiftUI

struct ContentView: View {
    
    @State var fahrenheitValue: String = ""
    
    @State var isvisible = false
    
    let numberFormatter: NumberFormatter = {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func converToCelcius() -> String {
        
        if let value = Double(fahrenheitValue){
            
            
            let fahrenheit =
                Measurement<UnitTemperature>(value:
                value, unit: .fahrenheit)
            
            let celciusValue =
                fahrenheit.converted(to: .celsius)
            return numberFormatter.string(from: NSNumber(value: celciusValue.value)) ?? "???"
                
//          return "\(celciusValue.value)"  // double değeri string e çevirmek için ters slash koyduk
            
        }else{
            return"???"
        }
    }
        
    
    var body: some View {
        VStack {
            TextField("value", text: $fahrenheitValue)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.center)
                .font(Font.system(size: 64.0))
            Text("fahrenheit")
            Text("is actually")
                .foregroundColor(.gray)
            Text(converToCelcius())
            Text("degree Celcius")
            Spacer()//mevcut boşluğu dolduran
        }
        .foregroundColor(.orange)
        .font(.title)
        .opacity(isvisible ? 1.0 : 0.0) // tek satırlık if else komutu
        .offset(x:0, y: isvisible ? 0 : 20)
        .animation(.easeIn(duration: 2.0))
        .onAppear{
            self.isvisible = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
