import Foundation
//////Zadaca 5
//1. Klasa Parent
class Parent : Person {
    
    var children: [Person]
    var savings: Double?
    init(name: String, lastName: String, yearOfBirth: Int, location: Location, children: [Person],savings: Double?) {
        self.children = children
        self.savings = savings
        super.init(name: name, lastName: lastName, yearOfBirth: yearOfBirth, location: location)
    }
    
    convenience init(children: [Person]){
        self.init(children: [])
        //Moze li ovako, poziva se inicijalizator klase Person i onda se postavlja children na prazan niz?
        //self.init()
        //self.children = []
        /*self.init(name: name, lastName: lastName,yearOfBirth: 1990,
        location: Location(), children: [] )*/
    }
    override func introduction () -> String {
        if children.isEmpty {
            return "Niz je prazan"
        }
        return super.introduction() + "I' m a parent of \(children.count)."
    }
    
}
// 1) Zadaca4: Struktura Location sa poljima latitude i longitude
struct Location {
    var latitude: Double
    var longitude: Double
    init() {
        latitude = Double (arc4random() % 181 ) - 90
        longitude = Double (arc4random() % 361 ) - 90
    }
}
// 2) Klasa Person sa poljima father i mother
class Person {
    weak var father: Parent?
    weak var mother: Parent?
    var name: String
    var lastName: String
    var yearOfBirth: Int
    var location = Location()
    var age: Int {
        get {
            return 2016 - yearOfBirth
        }
        set {
            yearOfBirth = 2016 - age
        }
    }
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
}
// 3) Konstante mirko i nedim

let mirko = Person(name: "Mirko", lastName: "Babic", yearOfBirth: 1987, location: Location() )
let nedim = Person(name: "Nedim", lastName: "Sabic", yearOfBirth: 1982, location: Location())

mirko.introduction()
print(mirko.introduction())
nedim.introduction()
print(nedim.introduction())

/// Dio 2
// 1) Struktura Course
struct Course {
    var teacher: Person
    var courseName: String
    func aboutCourse() -> String {
        return ("\(courseName) course by prof. \(teacher.lastName)")
        
    }
    
}
// 2) Klasa Student

class Student: Person {
    var attendingCourses: [Course]
    var grades: [Int]
    var faculty = "WiP"
    var averageGrade: Double {
        get {
            var sum = 0
            for grade in grades {
                sum += grade
                
            }
            return Double (sum) / Double (grades.count)
            
        }
    }
    
    init (name: String, lastName: String, yearOfBirth: Int, location: Location, attendingCourses: [Course], grades: [Int]) {
        self.attendingCourses = attendingCourses
        self.grades = grades
        super.init(name: name, lastName: lastName, yearOfBirth: yearOfBirth, location: location)
    }
    
    override func introduction () -> String {
        
        if father?.savings == nil && mother?.savings == nil {
            return super.introduction() + "I' m a student at \(faculty). My favourite course is " + attendingCourses.first!.aboutCourse() + "We are broke." }
        else if father?.savings != nil && mother?.savings != nil {
            return super.introduction() + "I' m a student at \(faculty). My favourite course is " + attendingCourses.first!.aboutCourse() + "My parents have $ \(mother!.savings)  + \(father!.savings) savings. "
        }
        else if father?.savings != nil {
            return super.introduction() + "I' m a student at \(faculty). My favourite course is " + attendingCourses.first!.aboutCourse() + "My father has $ \(father!.savings) savings. "
        }
        else {
            return super.introduction() + "I' m a student at \(faculty). My favourite course is " + attendingCourses.first!.aboutCourse() + "My mother has $ \(mother!.savings ) savings. "
        }
    }
}

/// 3) Kursevi
var iOSDevelopment = Course(teacher: mirko, courseName: "iOSDevelopment")
var seo = Course(teacher: nedim, courseName: "SEO")
var courses : [Course] = [seo, iOSDevelopment]
var student = Student(name: "Merima", lastName: "Delic", yearOfBirth: 1989, location: Location(), attendingCourses: courses, grades: [8, 7, 9, 8, 9, 7])
print(student.introduction())

// 5. Int proöiriti sa metodom ageInDays

extension Int {
    mutating func ageInDays() -> Int {
        return self * 365
    }
}
var someInt=1
var nesto = someInt.ageInDays()
print(nesto)
let brother = Person(name: "Anes", lastName: "Delic", yearOfBirth: 1991, location: Location())
var father = Parent(name: "Enes", lastName: "Delic", yearOfBirth: 1956, location: Location(),children:[student, brother], savings:500 )
print(father.introduction())
var mother = Parent(name: "Berina", lastName: "Delic", yearOfBirth: 1958, location: Location(),children:[student, brother], savings: Double (arc4random() % 10000 )  )
print(mother.introduction())
student.father = father
student.mother = mother
print(student.introduction())
let ageInDays = student.age.ageInDays()
print("Student's age in days is \(ageInDays)" )
print(student.introduction())

