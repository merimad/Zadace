import Foundation

//Zadatak 3
// 1) Struktura Contact
struct Contact {
    var name: String
    var phoneNumber: String
}
// 2) Klasa Message
class Message {
    enum Status {
        case Received
        case Read
    }
    let sender: Contact
    let text: String
    var status: Status = Status.Received
    init(sender: Contact, text: String){
        self.sender = sender
        self.text = text
        
    }
    func changeStatusToRead () {
        status = .Read
    }
}
// 3) Protokol
protocol MessageHandlerDelegate: class {
    func didReceiveMessage(message: Message)
}
// 4) Klasa Telephone
class Telephone {
    private var messages: [Message] = [Message]()
    var model: String
    weak var delegate: MessageHandlerDelegate?
    init(model: String){
        self.model = model
    }
    func addNewMessage(message: Message) {
        messages = [message] // messages je niz Message-a//
        delegate?.didReceiveMessage(message) /* može vratiti nil */
        
    }
}
// 5) Klasa Person
// 1) Zadaca4: Struktura Location sa poljima latitude i longitude i klasa Person
struct Location {
    var latitude: Double
    var longitude: Double
    init() {
        latitude = Double (arc4random() % 181 ) - 90
        longitude = Double (arc4random() % 361 ) - 90
    }
}
class Person:MessageHandlerDelegate {
    var name: String
    var lastName: String
    var yearOfBirth: Int
    var location = Location()
    var age: Int {
        get {
            return 2016 - yearOfBirth
        }
        set {
            yearOfBirth = 2016 - yearOfBirth
        }
    }
    var telephone: Telephone?
    init(name: String, lastName: String, yearOfBirth: Int, location: Location){
        self.name = name
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
        self.location = location
    }
    convenience init (name: String, lastName: String) {
        self.init(name: name, lastName: lastName,yearOfBirth: 1990,
                  location: Location() )
    }
    func introduction() -> String {
        return("Hi, my name is \(name) \(lastName).Age \(age).")
    }
    func addTelephone(telephone: Telephone){
        self.telephone = telephone
        telephone.delegate = self
    }
    func removeTelephone(){
        telephone = nil
        telephone?.delegate = nil
    }
    func didReceiveMessage(message: Message){
        readMessage(message)
        
    }
    private func readMessage(message: Message){
        message.changeStatusToRead()
        print("Hey I've got this message from \(message.sender.name) : \(message.text)")
    }
}
// 7) Implementacija
let telephone = Telephone(model:"Iphone 6 s")
let mirko = Person(name: "Mirko", lastName: "Babic", yearOfBirth: 1987, location: Location() )
mirko.addTelephone(telephone)
let contactOne = Contact(name:"Merima", phoneNumber:"062955406")
let contactTwo = Contact(name:"Mirsad", phoneNumber:"061380092")
let contactThree = Contact(name:"Berina", phoneNumber:"063366710")
let messageOne = Message(sender: contactOne, text: "Hi there!")
let messageTwo = Message(sender: contactTwo, text: "Hi!What are you doing?")
let messageThree = Message(sender: contactThree, text:"Are you comming to lunch?")
telephone.addNewMessage(messageOne)
telephone.addNewMessage(messageTwo)
mirko.removeTelephone()
telephone.addNewMessage(messageThree)