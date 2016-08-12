//: Playground - noun: a place where people can play

import UIKit
import Foundation

func delayPrint(string: String){
    sleep(2)
    print(string)
}

class Person{
    var firstName: String
    var lastName: String
    var age: Int
    init(firstName: String, lastName: String, age: Int){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
enum DrivingLicenceType {
    case A, B, C, D
}
class Driver: Person, DrivingLicence{
    
    var set: Set <DrivingLicenceType>
    var mechanic: Mechanic?
    var car: Car?
    init(set: Set <DrivingLicenceType>,firstName: String, lastName: String, age: Int){
        self.set = set
        super.init(firstName: firstName, lastName: lastName, age: age)
    }
    func callMechanic(mechanic: Mechanic, toFixACar car: Car){
        if mechanic.authorizedServicerForLicenceTypes.contains(car.licenceType) {
            delayPrint("Mechanic responded he can fix this car")
            mechanic.fixCar(car)
        } else {
            delayPrint("Mechanic responded he can not fix this car")
        }
    }
    func driveCar(){
        car?.drive()
    }
}
extension Driver: CarMonitoringDelegate {
    func engineBroke (){
        delayPrint("Calling a mechanic")
        callMechanic(mechanic!,toFixACar: car!)
    }
    func lowOnFuel(){
        if arc4random() % 3 < 1 {
            delayPrint("I will add some gas later")
        } 
        else {
        delayPrint("I will add some gas now.")
    //    while car!.fuelLevel <= car!.fuelTank {
            let randomFuel = arc4random() % car!.fuelTank
            car?.fuelLevel += randomFuel
            delayPrint("Added fuel.Current fuel level \(car!.fuelLevel)")
      //  }
    }
    }
    func outOfFuel(){
        delayPrint("I will add some gas now.")
      //  while car!.fuelLevel <= car!.fuelTank {
            let randomFuel = arc4random() % 100
            car?.fuelLevel += randomFuel
            delayPrint("Added fuel.Current fuel level \(car!.fuelLevel)")
       // }
        
    }
}
class Mechanic: Person {
    var authorizedServicerForLicenceTypes: Set <DrivingLicenceType>
    init(authorizedServicerForLicenceTypes: Set <DrivingLicenceType>,firstName: String, lastName: String, age: Int){
        self.authorizedServicerForLicenceTypes = authorizedServicerForLicenceTypes
        super.init(firstName: firstName, lastName: lastName, age: age)
    }
    func fixCar(car: Car){
        delayPrint("\(firstName) is fixing car")
        car.broken = false
        delayPrint("Car fixed")
    }
}
protocol DrivingLicence {
    var set: Set <DrivingLicenceType> {get set}
}
protocol CarMonitoringDelegate{
    func engineBroke()
    func lowOnFuel()
    func outOfFuel()
}
class Car {
    var name: String
    var model: String
    var licenceType: DrivingLicenceType
    var fuelTank: UInt32
    var crossedKilometers = 0
    private var fuel : UInt32 = 0
    var broken = false
    var engineOn = false
    var driver: DrivingLicence?
    var delegate: CarMonitoringDelegate?
    
    var fuelLevel: UInt32 {
        get {
            return fuel
        }
        set (newFuelLevel){
            if newFuelLevel > fuelTank {
                fuel = fuelTank
            }
            else {
        
                fuel = newFuelLevel
        }
        }
    }
    init(name: String,model: String, licenceType: DrivingLicenceType, fuelTank: UInt32, fuelLevel: UInt32 ){
        self.name = name
        self.model = model
        self.licenceType = licenceType
        self.fuelTank = fuelTank
        self.fuelLevel = fuelLevel
        
    }
    func stop(){
        engineOn = false
    }
    func drive(){
        delayPrint("Starting engine")
        engineOn = true
        while (engineOn == true){
            if broken == true {
                delayPrint("Engine broke")
                delegate?.engineBroke()
                stop()
                break
            }
            if fuelLevel <= 10 {
                delayPrint("Fuel low")
                delegate?.lowOnFuel()
            }
            guard fuelLevel > 0 else {
                delayPrint("Empty fuel tank")
                delegate?.outOfFuel()
                stop()
                break
            }
            fuelLevel -= 1
            crossedKilometers += 10
            if arc4random() % 100 == 99 {  /*ako je generisani broj 100                                               onda je broken = true*/
                broken = true
            }
             delayPrint("Car passed \(crossedKilometers) km and a fuel level in the tank is \(fuelLevel) l.")
        }
    }}

let driver = Driver(set: [DrivingLicenceType.B], firstName:"Merima", lastName:"Delic",age: 27)
let car = Car(name: "BMW", model: "X6", licenceType: DrivingLicenceType.B, fuelTank: 20, fuelLevel:20)
let mechanic = Mechanic(authorizedServicerForLicenceTypes:[DrivingLicenceType.B,DrivingLicenceType.C], firstName: "Ena",lastName: "Topoljak", age: 24 )
driver.car = car
car.delegate = driver
driver.mechanic = mechanic
for value in 1...10 {
    driver.driveCar()
}
delayPrint("Car crossed \(car.crossedKilometers) km in this run")
