
//Konstante i varijable

let pi = 3.14
print(pi)
var varijabla = 6
print(varijabla)

//Print na konzoli

var hello = "Hello world"
print(hello)
let swift = "Swift"
print("\(hello) we print in \(swift)")

//Moj primjer print

let ime = "Merima"
let prezime = " Delic"
print("My name is \(ime)\(prezime)")

//Opcionali (opcionalno vezivanje)

var name : String!
var comment : String?
name = "Travnik"
comment = "Cool town"
if let comment = comment
{
    print(comment)
    
}

//Moj primjer opcionalno vezivanje

var second: String?
second = "second value"
if let third = second
{
    print(third)

}
//Operatori

let b = 10
var a = 5
a = b
print("a ima vrijednost \(a)")
print("b ima vrijednost \(b)")
print("a i b su jednaki")

//Moj primjer operatori

let i = 12
var j = 3
var c = i % j
print ("Ostatak pri djeljenju \(i) sa \(j) je \(c) ")

//Unarni minus i plus

let three = 3
let minusThree = -three
let alsoMinusThree = +minusThree

print(three)
print(minusThree)
print(alsoMinusThree)

//Moj primjer unarni minus i plus

let two = 2
let five = 5
let minusFive = -five
print("\(two) plus \(minusFive) is equal \(two + minusFive)" )

//Ternari operator

let negativeNumber = -6
print(negativeNumber < 0 ? "Negative" : "Positive")

//Moj primjer Ternarni operator

var one = 1
var six = 6
print(one != six ? "Not equal" : "Equal")

//Operator ??

var newTown: String?
print(newTown ?? "Banja Luka")

//Moj primjer operator ??

var first = second
print(first ?? "Second has no value.")

//Intervali

for i in 1...3
{
    print("\(i) times 3 equals \(i * 3)")
}
//Intervali moj primjer

var suma: Int = 0
for j in 0..<6
{
    suma = suma + j
}
print("Sum value is \(suma).")

//Logički operatori

var lightsOn = true
if lightsOn == true
{
    lightsOn = false
}
let isTired = true
if lightsOn == false && isTired == true
{print("Go to sleep!") }

let time = 3.15
if (isTired == true && lightsOn == false) || time > 3.0
{
    print("Go to sleep!")
}

//Logički operatori moj primjer

var doorsOpened = true
if doorsOpened == true
{
    doorsOpened == false
}

let windowOpened = true
if doorsOpened == true && windowOpened == true
{
    doorsOpened == false
    print("Zatvori vrata, ubit ce nas promaha!")
}

//Stringovi i karakteri

for character in "BiH".characters
{
    print(character)
}

// Stringovi i karakteri moj primjer

var someString = "Count characters"
var charactersCount: Int = 0
for character in someString.characters
{
    print(character)
    charactersCount += 1
    
}
print("This string has \(charactersCount) characters.")

//Iniciranje stringa preko niza karaktera

let characters: [Character] = ["l","o","v","e"]
let loveString = String(characters)
print(loveString)

//Konkatenacija Stringova i Karaktera

var newHelloWorld = "Hello" + " world"
newHelloWorld += "!"
print(newHelloWorld)
let exclamation: Character = "!"
newHelloWorld.append(exclamation)
print(newHelloWorld)

//Interpolacija stringova

let sest = 6
let pet = 5
let result = "\(pet) times \(sest) is equal \(sest*pet) "

//Interpolacija stringova moj primjer

let today = "today"
let temperatureValue = 32
let temperature = "Temperature"
let sentence = "\(temperature) is \(temperatureValue) degrees Celsius \(today) . That is \(temperatureValue + 9/5 + 32) Fahrenheit."

let quote = "\"Be yourself; everyone is already taken.\"\n - Oscar Wilde "

let chick = "Chick"
let anotherChick = "Chick"
if chick == anotherChick
{
    print("This is same chick")

}

//Kolekcije - nizovi

var strings = [String]()
var shoppingList = ["Eggs", "Milk"]
let additionalList = ["Cookies", "Bananas"]
let newList = shoppingList + additionalList

var newArray = [3]
newArray.isEmpty
newArray.append(5)
newArray.count

print(newArray[0])
let subArray = newArray[0...1]
newArray.insert(6, atIndex: 1)
newArray.removeAtIndex(0)

for item in shoppingList
{
    print(item)
    
}

//Nizovi - moj primjer

var colors = ["black", "white" , "yellow"]
var favouriteColors = ["green", "blue", "red"]
let newColor = colors + favouriteColors
favouriteColors.insert("orange", atIndex: 3)
colors.removeAtIndex(0)

//Kolekcije - skupovi

var favouriteGenres : Set <String> = ["Rock", "Classical","Hip Hop"]
favouriteGenres.isEmpty
favouriteGenres.count
favouriteGenres.insert("Metal")
favouriteGenres.remove("Classical")
//favouriteGenres.removeAll()
favouriteGenres.contains("Rock")
for genre in favouriteGenres
{
    print(genre)
}

let setA: Set<Int> = [1, 2, 3]
let setB: Set<Int> = [2, 3, 5]
setA.intersect(setB)
setA.union(setB)
setA.exclusiveOr(setB)
setA.subtract(setB)


//Rjecnici

var airPorts: [String: String] =
["XYZ":"Toronto Pearson","DUB": "Dublin"]
airPorts.isEmpty
airPorts.count
airPorts["XYZ"] = "BiH"
airPorts["XYZ"] = nil

for(code, name) in airPorts
{
    print("\(code): \(name)")
}


