//
//  main.swift
//  FifthLesson
//
//  Created by ZamiRich on 25.12.2020.
//  Copyright © 2020 ZamiRich. All rights reserved.
//

import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

enum Brand {
    case bmw, vw, mercedes, porsche, skoda, opel, renault, tesla, volvo
}

enum EngineType {
    case disel, petrol, electric, hybrid
}

enum EngineAction {
    case startEngine, stopEngine
}

enum WindowsAction {
    case openWindows, closeWindows
}

protocol Car {
    var brand: Brand {get set}
    var engineType: EngineType {get set}
    var yearOfProduction: Int {get set}
    var mileage: Int {get set}
    var engineIsOn: Bool {get set}
    var windowsAreOpen: Bool {get set}
    
    mutating func engineAction(_ engineAction: EngineAction)
    mutating func windowsAction(_ windowsAction: WindowsAction)
}

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

extension Car {
    mutating func engineAction(_ engineAction: EngineAction) {
        switch engineAction {
        case .startEngine:
            self.engineIsOn = true
            print("Engine of \(brand) is on. Please fasten your seat belts")
        case .stopEngine:
            self.engineIsOn = false
            print("Egine of \(brand) is off. Please don't forget your cell phone in the car")
        }
    }
}

extension Car {
    mutating func windowsAction(_ windowsAction: WindowsAction) {
        switch windowsAction {
        case .openWindows:
            self.windowsAreOpen = true
            print("Windows in \(brand) are open. Don't forget to close when you leave the car")
        case .closeWindows:
            self.windowsAreOpen = false
            print("Windows in \(brand) are closed.")
        }
    }
}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

class SportCar: Car {
    
    var brand: Brand
    var engineType: EngineType
    var yearOfProduction: Int
    var mileage: Int
    var engineIsOn: Bool
    var windowsAreOpen: Bool

    //specific properties:
    var maxSpeed: Int //not really specific, but rather more applicable for sport car
    
    
    init(brand: Brand, engineType: EngineType, yearOfProduction: Int, milage: Int, engineIsOn: Bool, windowsAreOpen: Bool, maxSpeed: Int) {
        self.brand = brand
        self.engineType = engineType
        self.yearOfProduction = yearOfProduction
        self.mileage = milage
        self.engineIsOn = engineIsOn
        self.windowsAreOpen = windowsAreOpen
        self.maxSpeed = maxSpeed
    }
}

class TruckCar: Car {
    
    var brand: Brand
    var engineType: EngineType
    var yearOfProduction: Int
    var mileage: Int
    var engineIsOn: Bool
    var windowsAreOpen: Bool
    
    //specific properties:
    var tankCapacity: Int
    var tankOccupancy: Int
    
    
    init(brand: Brand, engineType: EngineType, yearOfProduction: Int, milage: Int, engineIsOn: Bool, windowsAreOpen: Bool, tankCapacity: Int, tankOccupancy: Int) {
        self.brand = brand
        self.engineType = engineType
        self.yearOfProduction = yearOfProduction
        self.mileage = milage
        self.engineIsOn = engineIsOn
        self.windowsAreOpen = windowsAreOpen
        self.tankCapacity = tankCapacity
        self.tankOccupancy = tankOccupancy
    }
}

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

    print("Task 4. TODO")
    print()

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

var myTesla = SportCar(brand: .tesla, engineType: .electric, yearOfProduction: 2020, milage: 7_500, engineIsOn: false, windowsAreOpen: false, maxSpeed: 210)
myTesla.windowsAction(.openWindows)
myTesla.windowsAction(.closeWindows)
print()

var myVolvo = TruckCar(brand: .volvo, engineType: .petrol, yearOfProduction: 2018, milage: 123, engineIsOn: false, windowsAreOpen: false, tankCapacity: 5_000, tankOccupancy: 2_450)
myVolvo.engineAction(.startEngine)
myVolvo.engineAction(.stopEngine)
print()

//6. Вывести сами объекты в консоль.

print(myVolvo.brand, myVolvo.engineType, myVolvo.yearOfProduction, myVolvo.mileage, myVolvo.engineIsOn, myVolvo.windowsAreOpen)
print()
