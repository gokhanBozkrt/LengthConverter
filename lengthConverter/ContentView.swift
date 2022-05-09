//
//  ContentView.swift
//  lengthConverter
//
//  Created by Gokhan Bozkurt on 28.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    let lengths : [String] = ["Mile","Kilometer","Meter","Feet","Yard"]
    @State private var lengthValue : Double = 0.0
    @State private var choosenLength : String = "Mile"
    @State private var convertedLength : String = "Kilometer"
    @FocusState private var amountIsFocused : Bool
    
    
    var body: some View {
        NavigationView {
               
               
                Form {
                            Section {
                                TextField("Value", value: $lengthValue, format: .number)
                             .keyboardType(.decimalPad)
                             .focused($amountIsFocused)
                                Picker("Choose Length", selection: $choosenLength) {
                                    ForEach(lengths, id : \.self) {
                                        Text("\($0)")
                                    }
                                }.pickerStyle(.segmented)
                            } header: {
                                Text("Sayı Giriniz")
                            }
                            Section {
                                Picker("Choose Length",selection:$convertedLength)  {
                                    ForEach(lengths, id : \.self) {
                                        Text("\($0)")
                                    }
                                }.pickerStyle(.segmented)
                            }header: {
                                Text("Ölçü Birimini Seçin")
                            }
                            Section {
                                Text(convertedValue.formatted())
                            }header: {
                                Text("Sonuc")
                            }
                            
                            
                        }.navigationTitle("Length Conververter")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                               Spacer()
                                Button("Done") {
                                    amountIsFocused = false
                                }
                            }
                        }
            
          
            }
    
        }

    func ValueToKm() -> Double {
          var valueConverted : Double
          
          switch choosenLength {
          case "Mile":
          valueConverted = lengthValue*1.609344
          case "Meter":
          valueConverted = lengthValue*0.001
          case "Feet":
            valueConverted = lengthValue*0.0003048
          case "Yard":
              valueConverted = lengthValue*0.0009144
          default:
              valueConverted = lengthValue
          }
      return valueConverted
    }
      
      var convertedValue : Double {
          var theFinalValue : Double
          
          switch convertedLength {
          case "Mile":
          theFinalValue = ValueToKm()*0.621371192
          case "Meter":
          theFinalValue = ValueToKm()*1000
          case "Feet":
           theFinalValue = ValueToKm()*3280.84
          case "Yard":
            theFinalValue = ValueToKm()*1093.6132983
          default:
              theFinalValue = ValueToKm()
          }
          
       return theFinalValue
      }

   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

