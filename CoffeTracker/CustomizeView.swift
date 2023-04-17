//
//  CustomizeView.swift
//  CoffeTracker
//
//  Created by Anas Salah on 24/03/2023.
//

import SwiftUI

struct CustomizeView: View {
    let drink: Drink
    
    @EnvironmentObject var menu: Menu
    
    @State private var size = 0
    @State private var isDecaf = false
    @State private var extraShots = 0
    @State private var milk = ConfigurationOption.none
    @State private var syruo = ConfigurationOption.none

    
    
    let sizeOption = ["Small", "Medium", "Large"]
    
    var Caffeine: Int {
        var caffieneAmount = drink.caffeine[size]
        caffieneAmount += (extraShots * 20)
        
        if isDecaf {
            caffieneAmount /= 20
        }
        return caffieneAmount
    }
    
    var calories: Int {
        var calorieAmount = drink.baseCalories
        calorieAmount += extraShots * 10
        
        if drink.coffeeBased {
            calorieAmount += milk.calories
        } else {
            calorieAmount += milk.calories
        }
        return calorieAmount * (size + 1)
    }

    
    var body: some View {
        Form {
            Section("Basic options") {
                Picker("Size", selection: $size) {
                    ForEach(sizeOption.indices) { index in
                        Text(sizeOption[index])
                    }
                }
                .pickerStyle(.segmented)
                
                if drink.coffeeBased {
                    Stepper("Extra shots: \(extraShots)", value: $extraShots, in: 0...7)
                }
                
                Toggle("Decaffeinated", isOn: $isDecaf)
            }
            // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            Section("Customization") {
                Picker("Milk", selection: $milk) {
                    ForEach(menu.milkOptions) { option in
                        Text(option.name)
                            .tag(option)
                    }
                }
                
                if drink.coffeeBased {
                    Picker("Syrup", selection: $syruo) {
                        ForEach(menu.syrupOptions) { option in
                            Text(option.name)
                                .tag(option)
                        }
                    }
                }
            }
            

            // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            
            Section("Estimates") {
                Text("**Caffeine:** \(Caffeine)mg")
                Text("**Calories:** \(calories)")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(drink.name)
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: Drink.exmaple)
            .environmentObject(Menu())
    }
}
