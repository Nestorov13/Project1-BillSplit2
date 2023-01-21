//
//  ContentView.swift
//  Project1-BillSplit
//
//  Created by Borislav on 13.01.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var priceAmount = 0.0
    @State private var tipPercent = 5
    @State private var numOfPeople = 1
    @FocusState private var priceFocused: Bool
    
    var grandeTotal: Double{
        let tipSelection2 = Double(tipPercent)
        let tipValue2 = priceAmount / 100 * tipSelection2
        let total2 = priceAmount + tipValue2
            return total2
    }
    var totalByPerson: Double{
            
        let peopleCount = Double(numOfPeople + 1)
        let tipSelection = Double(tipPercent)
     
        let tipValue = priceAmount / 100 * tipSelection
        let total = priceAmount + tipValue
        let amountPerPerson = total / peopleCount
            return amountPerPerson
    }
    
   let tipPercentage = [5, 10, 15, 20, 25, 0]
    var currencyFormat:  FloatingPointFormatStyle<Double>.Currency  {
        FloatingPointFormatStyle<Double>.Currency.currency(code: Locale.current.currencyCode ?? "USD")
        
    }
    
    var body: some View {
        NavigationView {
            
            Form{
                Section{
                    TextField("Enter the bill", value: $priceAmount, format: currencyFormat)//.currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.numberPad).focused($priceFocused)
                }header: {
                Text("Enter the bill")
                }
                
                Section {
                        Text(totalByPerson, format: currencyFormat) //.currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                Text("Required amount by each person:")
                }
                    Picker("Number of people:", selection: $numOfPeople){
                        ForEach(1..<100){
                            Text("\($0) ")
                    }
                }
                
                Section{
                  //  Text("How much would you like to tip?")
                    Picker("Tip percentage", selection: $tipPercent){
                        ForEach(0..<101){
                            Text("\($0,format: .percent)")
                        }
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("How much would you like to tip?")
                }
                
                Section{
                    if tipPercent == 0 {
                        Text(grandeTotal, format: currencyFormat)
                            .padding(8)
                            .background(.red)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    else{
                        Text(grandeTotal, format: currencyFormat)
                            .padding(8)
                            .background(.green)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                        //format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        
                }header: {
                Text("Grand Total")
                }
                
            }.navigationTitle("Dutchy Splitter")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        Button("Done"){
                            priceFocused = false
                        }
                    }
                }
            
            
            
            
        }
    }
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }

}
//Picker from array selection row
/*
Section{
  //  Text("How much would you like to tip?")
    Picker("Tip percentage", selection: $tipPercent){
        ForEach(tipPercentage, id: \.self){
            Text($0, format: .percent)
        }
    }.pickerStyle(.segmented)
} header: {
    Text("How much would you like to tip?")
}
*/

//Create picker from array
//let students = ["Harry", "Hermione", "Ron"]
// @State private var selectedStudent = "Harry"
/* NavigationView{
     Form {
         Picker("Select your Hero", selection: $selectedStudent){
             ForEach(students, id: \.self){x
                 Text($0)
             }
         }
     }
     
 } */



// "$" Sign makes var two-way read-write
//@State private var nameVar = ""
//Text Input code
//TextField("Please enter your name: ", text: $nameVar)
//Text("Hello \(nameVar)")


//Navigation list and button state check
//Button state change
//@State private var tapCount: Int = 0
/*
 NavigationView{
 
 // List creation
 Form{
 //Grouping by 10 max
 //Using Section for splitting the lists
 
 Section{
 Text("Option1")
 Text("Option2")
 Text("Option3")
 }
 
 Section{
 Text("Option4")
 Text("Option5")
 Text("Option6")
 }
 }
 .navigationTitle("SplitTheBill")
 .navigationBarTitleDisplayMode(.inline)
 }
 Button("Tap count: \(tapCount)"){
 self.tapCount += 1
 }
 
 }
 */
