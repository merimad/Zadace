//Kontrola toka
//Petlje
// for in
for number in 1...3{
    print("\(number) times 5 is \(number * 5)")
}

//for in - moj primjer
for letter in "Bosnia and Herzegovina".characters{
    print(letter)
}

// for in bez vrijednosti kolekcije ili intervala
for _ in 1...3{
    print("Hello world")
}
//Iteriranje kroz kolekcije
//Nizovi
let names = ["Alex", "Tracy", "Jack"]
for name  in names{
    print("Hello, \(name) !")
}
//Nizovi - moj primjer
let daysInWeek = ["Monday", "Tuesday", "Wednesday", "Thursday" ,"Friday"]
for day in daysInWeek{
    print(day)
}
//Rječnici
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for(animal, legCount) in numberOfLegs{
    print("\(animal) has \(legCount) legs")
}
//Rječnici - moj primjer
let daysUntillWeekend = ["Monday": 5, "Tuesday": 4, "Wednesday": 3,"Thursday": 2,"Friday": 1]
for (day, daysCount) in daysUntillWeekend{
    print("Today is \(day).That is \(daysCount) days untill weekend!")
}
//While petlja
var numbers = [3, 2, 5]
while numbers.isEmpty == false {
    print("\(numbers.removeAtIndex(0)) is out!")
}
//while petlja - moj primjer
var someAnimals = ["dog", "cat", "mouse", "bird"]
while someAnimals.isEmpty == false {
    print("\(someAnimals.removeAtIndex(0)) is out!")
}
//Repeat while
var count = 3
repeat {
    print(count)
    count-=1
} while count > 0
//Repeat while - moj primjer
var numberOfStrings = someAnimals.count
repeat {
    print("\(numberOfStrings) strings left in array")
    numberOfStrings -= 1
} while numberOfStrings > 0

// if else naredba
var temperature = 22
if temperature >= 18 {
    print("It would be good to wear shorts")
}
temperature = 15
if temperature >= 18 {
    print("It would be good to wear shorts")
} else {
    print("It would be good to wear pants")
}
if temperature >= 18 {
    print("It would be good to wear shorts")
} else if temperature >= 0 && temperature < 18 {
    print("It would be good to wear pants")
} else {
    print("It 's best to stay home")
}
// if naredba - moj primjer - greška nije mi jasno šta
/*var timeOfDay = 11
if timeOfDay >= 10 && timeOfDay <=12 {
    print("It is time for breakfast!")
} else if timeOfDay >= 12 && timeOfDay <= 16 {
    print("It is time for lunch!")
} else if timeOfDay >= 18 && timeOfDay <= 20{
    print("It is time for dinner!")
} else {
    print("It is time for snack! ")
}
 */
//Switch naredba
let character = "e"
switch character {
case "a","e","i","o","u":
    print("\(character) is a vowel")
case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
    print("\(character) is a constant")
default:
    print("\(character) is not a vowel or a constant")
}
// Switch naredba - moj primjer
let grade = 5
switch grade {
case 5:
    print("\(grade): Failed.")
case 6:
    print("\(grade): Acceptable")
case 7:
    print("\(grade): Satisfactory")
case 8:
    print("\(grade): Good")
case 9:
    print("\(grade): Very good")
case 10:
    print("\(grade): Excellent")
default:
    print("\(grade): is not grade!")
}
let age = 28
switch age {
case 1..<18:
    print("Underaged")
default:
    print("Adult")
}

//Kontola transfera
//Continue
let string = "Hello World"
var stringWithoutVowels = ""
for character in string.characters {
    switch character {
    case "a","e","i","o","u":
        continue
    default:
        stringWithoutVowels.append(character)
    }
}
print(stringWithoutVowels)
//Continue - moj primjer
let newString = "Merima Delic"
var stringWithVowels = ""
for character in newString.characters {
    switch character {
    case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
        continue
    default:
        stringWithVowels.append(character)
        
    }
}
print(stringWithVowels)

//Break
let array = [1,4,15,-2,9]
for number in array {
    if number > 0 {
        print(number)
    } else {
        break
    }
}
//Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

// Switch naredba - moj primjer
let newGrade = 5
switch newGrade {
case 5:
    print("\(newGrade): Failed.")
    fallthrough
case 6:
    print("\(newGrade): Acceptable")
    fallthrough
case 7:
    print("\(newGrade): Satisfactory")
    fallthrough
case 8:
    print("\(newGrade): Good")
    fallthrough
case 9:
    print("\(newGrade): Very good")
    fallthrough
case 10:
    print("\(newGrade): Excellent")
    fallthrough
default:
    print("\(newGrade): is not a grade!")
}
//Guard
let ages = [27,31,15,17]
for age in ages {
    guard age > 18 else {
        print("We have a minor")
        break
    }
    print("He is an adult")
}
//Funkcije
func printHelloWorld() {
    print("Hello World")
}
func add(a: Int, b: Int) -> Int {
    return a + b
}
printHelloWorld()
var number = add(3, b: 7)
print("Number has a value \(number) after add Function.")

//Funkcije bez argumenata
func sayHelloWorld() -> String {
    return "Hello world"
}
print(sayHelloWorld())
//Funkcije sa argumentima
func say(greeting: String, to: String) {
    print("\(greeting), \(to)")
}
say("Hi", to:"Rick")

//Funkcije koje ne vracaju vrijednost
func printTheArgument(argument: String) {
    print(argument)
}
printTheArgument("Hello")
//Funkcije koje vracaju mješovite vrijednosti
func minMax(array:[Int]) -> (min: Int, max: Int){
    var newMin = array[0]
    var newMax = array[0]
    for value in array[1..<array.count] {
        if value < newMin {
            newMin = value
        } else if value > newMax {
            newMax = value
        }
    }
    return  (newMin, newMax)
}
let bounds = minMax([8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
//Funkcija koja vraca opcional
func optionalMinMax(array:[Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var newMin = array[0]
    var newMax = array[0]
    for value in array[1..<array.count] {
        if value < newMin {
            newMin = value
        } else if value > newMax {
            newMax = value
        }
    }
    return  (newMin, newMax)
}

if let newBounds = optionalMinMax([8, -6, 2, 109, 3, 71]) {
    print("min is \(newBounds.min) and max is \(newBounds.max)")
}

if let optionalBounds = optionalMinMax([Int]()){
    print(optionalBounds)
}
//Imena argumenata funkcije
func someFunction(firstArg: String,secondArg: Int) {
    // some code
}
someFunction("Hello", secondArg: 3)
//Specifikovanje eksternog imena
func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)"
}
print(sayHello(to: "Bill", and: "Ted"))
func someFunction(parameterWithDeafult: Int = 12) {
    print(parameterWithDeafult)
}
someFunction(6)
someFunction()

//Variadicni argumenti funkcije
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
var resultOfFunction = arithmeticMean(1, 2, 3, 4, 5)
print(resultOfFunction)
//Funkcije- moj primjer

func arraySum(array:[Int]) -> Int {
    var sum = 0
    for value in array[1..<array.count]{
        sum += array[value]
}
    return sum
}
//let someArray = arraySum([1, 2, 3, 8, 7])

//In out argumenti
func swapTwoInts(inout a:  Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
//funkcija kao tip
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
print(mathFunction(3,9))

//Ugnijezdene funkcije
func printThreeTimesHelloWorld() {
    func printNestedHelloWorld() {
        print("Hello World")
    }
    for _ in 1...3 {
        printNestedHelloWorld()
    }
}
printThreeTimesHelloWorld()

// Closure
let greet = { (name: String) -> Void in
print("Hello\(name) ")
}
greet("Jill")
//Enumeracije
enum CompassPoint{
case North
case South
case East
case West
}
enum Planet{
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
var directionToGHead = CompassPoint.North
directionToGHead = .East
func whereToHead(direction: CompassPoint){
switch direction {
case .North:
print("Wear jacket")
case .South:
print("Wear shorts")
default:
print("Take care")
}
}
whereToHead(.North)

enum Planet2: Int{
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
Planet2.Earth.rawValue

let planet = Planet2(rawValue: 3)


