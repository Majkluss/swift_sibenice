//
//  main.swift
//  swift_sibenice
//
//  Created by Michal Zoubek on 14.12.2021.
//

import Foundation

let slovo = "antiperspirant"
var ui = [Character]()
for _ in 0...slovo.count-1 {
    ui.append("_")
}
var konec = false
var pokusy = 5
var veta = "Zbývá ti \(pokusy) pokusů"

func odecti() {
    pokusy -= 1
    if pokusy == 0 {
        print("Prohrál jsi")
        konec = true
    }

    else {
        if pokusy > 1 && pokusy < 5 {
            veta = "Zbývají ti \(pokusy) pokusy"
        }
        else if pokusy == 1 {
            veta = "Zbývá ti 1 pokus"
        }
    print("\(veta)")
    }
}

print("Vítám tě ve hře 'Šibenice'. Nyní hledáme slovo s \(slovo.count) písmeny. Na uhodnutí máš \(pokusy) pokusů.")
while konec == false {
    for char in ui {
        print(char, terminator: " ")
    }
    print("\n")
    print("Zadej písmeno, nebo zkus slovo uhodnout: ")
    let vstup = readLine()!

    if vstup.count > 1 {
        if vstup == slovo {
            print("Uhodl jsi celé slovo!")
            konec = true
        }
        else {
            print ("To není správné slovo.")
            odecti()
        }
    }
    else {
        let pismeno = Character(vstup)
        if ui.contains(pismeno) {
            odecti()
            print("Toto písmeno už je uhodnuté!")
        }
        else {
            if slovo.contains(pismeno) {
                print("Správně")
                for i in 0...slovo.count-1 {
                    if pismeno == slovo[slovo.index(slovo.startIndex, offsetBy: i)] {
                        ui[i] = pismeno
                    }
                }
            }
            else {
                odecti()
                print("Špatně, zkus to znovu.")
            }
            if ui == Array(slovo){
                print("Vyhrál jsi!")
                konec = true
            }
        }
    }
}
