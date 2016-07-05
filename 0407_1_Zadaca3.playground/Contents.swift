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
