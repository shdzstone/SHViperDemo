//
//  QSwiftSyxTest.swift
//  QSwiftTest
//
//  Created by cdz's mac on 2017/6/2.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

import Foundation
import UIKit


//基础语法学习类
//---------------变量、常量、if、while、for、func、closure测试

class QBaseSyxTest {
    
    public func simpleValuesTest() {
        var myVariable = 42
        myVariable = 50
        let myConstant = 42
        
        
        let implicitInteger = 70
        let implicitDouble = 70.0
        let explicitDouble: Double = 70
        

        //: Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type.
        let label = "The width is "
        let width = 94
        let widthLabel = label + String(width)
        
        

        //: There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (\) before the parentheses.
        let apples = 3
        let oranges: Float = 5.0
        let appleSummary = "I have \(apples) apples."
        let fruitSummary = "I have \(Float(apples) + oranges) pieces of fruit."
        
        
        //: Create arrays and dictionaries using brackets (`[]`), and access their elements by writing the index or key in brackets. 
        //:
        var shoppingList = ["catfish", "water", "tulips", "blue paint"]
        shoppingList[1] = "bottle of water"
        
        var occupations = [
            "Malcolm": "Captain",
            "Kaylee": "Mechanic",
            ]
        occupations["Jayne"] = "Public Relations"
        
        //: To create an empty array or dictionary, use the initializer syntax.
        //:
        let emptyArray = [String]()
        let emptyDictionary = [String: Float]()
        
        shoppingList = []
        occupations = [:]
     
        print(shoppingList,occupations)

    }
    
    func controlFlowTest() {
        
        //: Use `if` and `switch` to make conditionals, and use `for`-`in`, `while`, and `repeat`-`while` to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required.
        //:
        let individualScores = [75, 43, 103, 87, 12]
        var teamScore = 0
        for score in individualScores {
            if score > 50 {
                teamScore += 3
            } else {
                teamScore += 1
            }
        }
        
        //: In an `if` statement, the conditional must be a Boolean expression—this 
        //:
        //: use `if` and `let` together to work with values that might be missing. 
        //: An optional value either contains a value or contains `nil` to indicate that a value is missing.
        //:
        var optionalString: String? = "Hello"
        if optionalString == nil {
            
        }
        
        var optionalName: String? = "John Appleseed"
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello, \(name)"
        }
        


        //: Another way to handle optional values is to provide a default value using the `??` operator. If the optional value is missing, the default value is used instead.
        //:
        let nickName: String? = nil
        let fullName: String = "John Appleseed"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        
//        print(informalGreeting)

        //: case let x where x.hasSuffix("pepper"):
        
        /*
        var vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
        }
        */
        
        
        //: for (kind, numbers) in interestingNumbers
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
            ]
        var largest = 0
        var larKind = ""
        for (kind, numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number
                    larKind = kind
                }
            }
        }
//        print(largest,larKind)
        
        var n = 2
        while n < 100 {
            n *= 2
        }
        print(n)
        
        var m = 2
        repeat {
            m *= 2
        } while m < 100
        print(m)

        //: Use ..< to make a range that omits its upper value, and use ... to make a range that includes both values.
        var total = 0
        for i in 0..<4 {
            total += i
        }
        print(total)

        
    }
    
    //: ## Functions and Closures

    func greet(person: String, day: String) -> String {
        return "Hello \(person), today is \(day)."
    }

    func greet(_ person: String, day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    
    //: By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write _ to use no argument label.
    func greet(_ person: String, on day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
//    let tour = QBaseSyxTest()
//    print(tour.greet("Bob", day: "Tuesday"))

    //: Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
    //:
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        
        return (min, max, sum)
    }

    
    
    func functionTest() {
        //用var 来声明变量；用let来声明常量；可以显式的注明数据类型；也可以隐式的的注明数据类型；
        var v1 = 17.0;
        
        let con1ImplicitDouble = 17.0, con1ExplicitDouble:Double = 18
        
        let con2ExplicitFloat:Float = 18;
        
        
        //此处注意 \()的应用，可以在字符串中引用别的变量的值
        //注意多个常量的声明，可以放在同一行。
        let label = "the width is", width = 94, width1 = 95
        
        let lebelWidth = label + String(label);
        
        let lebelWidth1 = "the width is \(width+width1)";
        
        var floatText = "my first writting with swift \(v1+Double(con2ExplicitFloat))";
        
        //字典及数组的声明
        var shopList = ["water","fruit","flower","fish","rain"];
        shopList[1] = "bottle of water";
        
        var dicText = ["key1":"value1",
                       "key2":"value2",
                       "key3":"value3"
        ];
        
        //空数组和空字典的声明
        let emptyArray = [String]();
        let emptyDic = [String:Float]();
        
        shopList = [];
        dicText = [:];
        
    }
    
    func ifFunc() {
        
        //此处注意if的条件必须是一个boolean类型的表达式，它不会隐性的和0比较
        let individualScore = [ 18,20,30,40,60,66,77];
        var teamScore = 0;
        for score in individualScore {
            //可以使用隐性变量，来引用数组中的元素；
            if score>40 {
                teamScore += 3;
            }else {
                teamScore += 1;
            }
            
        }
        print(teamScore);
    }
    
    
    func optionalFunc() {
        //此处的重点是optional value的用法
        var optionalString : String? = "string that are optional";
        print(optionalString == nil);
        
        var optionalName : String? = "Jim kukle";
        //optionalName = nil;
        
        var greeting =  "hello";
        
        //if-let链来判断某optional value是否为空
        if let name = optionalName {
            print("hello ,\(optionalName)");
            print("hello ,\(name)");
            print(optionalName);
            
        }else {
            print("hello ,\(optionalName)");
            print(optionalName);
            
        }
        
        
    }
    
    func switchFun()  {
        
        var nickName : String? = nil;
        var fullName :String = "john appleseed";
        let informationGreet = "Hi \(nickName ?? fullName)";
        print(informationGreet);
        
        var vegetable = "red pepper";
        
        switch vegetable {
            //switch可以做各种类型的比较，而不仅限于整型和字符串
        //switch执行完相对应的情况后就直接跳出，不用每种情况后面break out；
        case "celery":
            print("add some rainsins and make ants on a log.")
        case"cucumber","watercress":
            print("that would make a good tea sandwich")
        case let x where x.hasSuffix("peper"):
            //此行待解释。
            print("Is it a spicy \(x)")
            
        default:
            print("Everything tasts good in soup.");
        }
    }
    
    func forFunc() {
        
        let interestingNumbers = [
            "Prime":[2,3,5,7,11,13],
            "Fibonacci":[1,1,2,3,5,8],
            "Square":[1,4,9,16,25],
            ]
        
        var largest = 0
        var larKind : String? = nil;
        
        
        for (kind,numbers) in interestingNumbers {
            //尼玛，可以使用未声明的变量来引用字典或数组中的元素
            for number in numbers {
                if number>largest {
                    largest = number
                    larKind = kind;
                }
            }
            
        }
        print("the largest number is \(largest),its kind is \(larKind)");
    }
    
    func whileFunc() {
        //此处注意repeat－while循环体至少执行一次
        var n = 2
        while n < 100 {
            n = n*2
        }
        print(n)
        var m = 2
        repeat {
            m = m*2
        }while m<100
        print(m)
        
    }
    
    func forInFunc() {
        //a..<b 省略了比a大的数字；a...b则包含b本身
        var total = 0
        for i in 0...4 {
            total += i
            print(i)
        }
        print(total);
        
    }
    
    func tupleFunc() {
        //tuple 的运用。使用tuple来返回一个数据集合。可以通过名，也可以通过编号来引用tuple中的数据。
        func caculateStatistics(scores:[Int]) ->(min:Int , max:Int, sum:Int) {
            
            var min = scores[0]
            var max = scores[0]
            var sum = 0
            
            for score in scores {
                if score>max {
                    max = score
                }else if score < min {
                    min = score
                }
                sum += score
            }
            return(min,max,sum)
        }
        
        let statistics = caculateStatistics(scores: [5,3,100,9,15])
        print(statistics.max)
        print(statistics.min)
        print(statistics.sum)
        
    }
    
    func simpleFunc() {
        //func
        func greet(name:String,day:String,lunch:String)->String {
            return "hello \(name), today is \(day),we have a good lunch ,its \(lunch)"
        }
        print(greet(name: "Bob", day: "Tuesday",lunch: "pepor"))
    }
    
    func multiArgFunc() {
        //func也可以使用同类型多参数，使用...来表示不定数目的同类型多参数
        //swift 中类型很严格，Double,Float,Int在做数学运算时必须进行转换
        func avervageOf(numbers : Int...) -> Double {
            var average = 0.0
            var sum = 0
            
            for number in numbers {
                sum += number
            }
            
            average = Double(sum)/Double(numbers.count)
            
            return average
            
        }
        print(avervageOf())
        print(avervageOf(numbers:1,2,3,9))
    }
    
    func nestedFunc()  {
        
        //func可以嵌套使用；嵌套的函数可以使用已声明的var；复杂的函数中可以使用嵌套函数；
        func returnFifteen() -> Int {
            var a = 10
            
            func add() {
                a += 5
            }
            
            add()
            
            return a
        }
        
        print(returnFifteen())
        
    }
    
    func returnedFunc() {
        //func也可以使用函数作为其返回值；
        //这个示例发现个有趣的现象：可以使用常量或变量来获取某个func的引用；使用该变量时和使用函数调用一样，必须按照该函数的格式传参；
        func makeIncrement() -> ((Int)->Int) {
            func addOne(number:Int)->Int {
                return number+1
            }
            
            return addOne(number:)
        }
        
        let increment = makeIncrement()
        print(increment(7))
        
    }
    
    //--------------函数作为参数、closure、
    func argumentFunc() {
        //func也可以使用函数作为其参数
        func hasAnyMatches(list:[Int],condition : (Int)->Bool ) ->Bool {
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }
        func lessThanTen(number:Int) -> Bool {
            return number < 10
        }
        
        var numbers = [2,3,4,1,10]
        print(hasAnyMatches(list: numbers, condition: lessThanTen(number:)))
        
        //closures  func是closures的一种特例：代码块可以被调用。closures中的代码可以访问创建该closure的作用域中的有效的变量或函数，上面的嵌套函数即是一个示例；
        //可以声明匿名的closure,该closure中的代码用{}括住；使用in把匿名closure的参数、返回类型和执行代码区分开；consecutive statements
        print(numbers.map({
            (number:Int)->Int in
            
            if number%2 != 0{
                return 0
            }else {
                let result = number*3;
                return result;
            }
        }))
        print(numbers);
        
        //closure可以使用更简洁的语法来写
        //若该colsure的类型已经知道，比如调用delegate时，可以省略掉其参数类型、返回值类型，也可以都省掉；
        //Single statement closure implicitly return the value of their only statement;
        let mappedNumbers = numbers.map({number in number * 3 })
        print(mappedNumbers)
        
        
        //两个要点：1、closure中，引用参数时可以使用其数字引用来代替变量名引用；
        //2、当一个closure作为某func的最后一个参数时，该closure可以紧跟在括号后面，示例如下
        let sortedNumbers = numbers.sorted(){$0 > $1}
        //当一个closure作为某func唯一的一个参数时，可以省略掉括号，示例如下
        //let sortedNumbers = numbers.sorted{$0 > $1}
        //待解决，排序方法如何传？
        
        print(sortedNumbers)
    }
    
}


//-----------------Class and Object 初步
//类可以有superclass，也可以没有superclass。没有superclass的可以不写。
class NamedShape: NSObject {
    
    
    //每个property必须初始化。要么在创建时初始化，要么在初始化函数中初始化。
    //self用以区分对象本身与传来的参数；
    var numberOfSides : Int = 0
    var name :String
    
    //子类若要重写父类的某个函数，必须使用关键字override，否则编译报错
    //若override函数没有做一些操作，其superclass也没做，编译器报错。例如，重写的初始化函数，没有完成初始化
    override init() {
        self.name = "square"
    }
    
    init(name:String) {
        self.name = name;
    }
    
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
    
    //如有需要，可以创建deinit函数来做一些清理工作
    func _deinit() {
        //此处可以做一些清理工作
    }
}

//        var shp = NamedShape(name:"square")
//        shp.numberOfSides = 4
//        var shpDes = shp.simpleDescription()


//---------------父类及初始化
class Square: NamedShape {
    var sideLength : Double;
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        //注意父类的property的初始化要调用父类的初始化函数
        super.init(name:name);
        
        numberOfSides = 4;
    }
    
    func area() -> Double {
        return sideLength*sideLength;
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
    
}

//        let square = Square(sideLength: 5.1, name: "square");
//        print(square.area());
//        print(square.simpleDescription());


//---------------此处注意property的getter及setter；使用closure来声明、或者叫block program
class EquilateralTriangle: NamedShape {
    var sideLength : Double = 0.0
    
    //此处的初始化分三个步骤：1、subclass自身变量的初始化
    //2、调用superclass的init
    //3、改变superclass定义的property的值。此处可以做其它任何初始化操作：调用setter、getter、method等等均可进行
    init(sideLength : Double, name : String) {
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 3
    }
    
    //边长
    var perimeter : Double {
        get {
            return 3*sideLength
        }
        set {
            sideLength = newValue/3.0
            // 在setter中，newValue是一个隐性的名字叫newValue，当然，也可以显式的指定为别的名称
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with side length \(sideLength)."
    }
}

//        let triangle = EquilateralTriangle(sideLength: 8.0, name: "a triangle");
//        print(triangle.simpleDescription())
//        print(triangle.perimeter)
//        triangle.perimeter = 9.0
//        print(triangle.perimeter)


//--------------此处注意willSet的用法：使用willSet及didSet来监测property值的变化，即该代码在property的值变动时调用
class TriangleAndSquare {
    var triangle : EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square : Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size:Double, name:String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
    
}

//var triangelAndSquare = TriangleAndSquare(size:10.0, name:"Another test of shape")
//print(triangelAndSquare.square.sideLength)
//print(triangelAndSquare.triangle.sideLength)
////注意：若只改变某property的某项属性值，willSet及didSet则不会被调用；只有当该property整体改变才会调用willSet及didSet
////        triangelAndSquare.square.sideLength = 8.0
////        print(triangelAndSquare.square.sideLength)
//triangelAndSquare.square = Square(sideLength: 8.0, name: "square test")
//print(triangelAndSquare.triangle.sideLength)





////-------------optional的应用
////对于某些可能为空的值，可以使用optional即?在该值被操作（method、properties、subscriping等）之前标记。
////若?之前的值为nil，则?之后的操作会被编译器忽略，而整个表达式的值为nil;
////若？之前的值不为空，则该optional value会被解封，且？之后对该值的操作均有效。
////以上两种情况下，该表达式的值也为optional。例如：
//let optionalSquare : Square? = Square(sideLength: 5.0, name: "optional square")
//let sideLength = optionalSquare?.sideLength
//print(sideLength)
//print(optionalSquare)


//---------------枚举及结构体
//使用enum来声明枚举类型；
//枚举类型可以有func
//swift默认指定枚举的初始值为0，依次递增；可以使用赋值的方法显式的指定初始值，该初始值可以为Int、Float point、String等；可以使用rawValue property来访问某种枚举实例的值
enum Rank : Int {
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "Ace"
        case .Two:
            return "Two"
        case .Jack:
            return "Jack"
            
        default:
            return String(self.rawValue)
        }
    }
    
    static let allValues = [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
}


//let king = Rank.King
//let kingRawValue = king.rawValue
//print(king.simpleDescription(),kingRawValue)
//
////可以通过raw value，使用init?(rawValue:)来指定一个枚举实例;
////注意枚举的初始化
//if let convertedRank = Rank(rawValue: 11) {
//    let convertedDescription = convertedRank.simpleDescription()
//    print(convertedDescription)
//    
//}

enum Suit {
    case Spades,Hearts,Diamonds,Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            //注意，此处使用缩写格式.Spades来引用spades case。当某个对象的类型编译器已经知晓时，可以使用缩写格式.property来访问其属性。
            return "spades"
        case .Clubs:
            return "Clubs"
        case .Diamonds:
            return "Diamonds"
        case.Hearts:
            return "Hearts"
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades,.Clubs:
            return "black"
        case .Diamonds,.Hearts:
            return "red"
        }
    }
    
    static let allValues = [Spades, Hearts, Diamonds, Clubs]

}

////此处使用Suit.Hearts来赋值hearts常量，因为hearts没有显式的指定类型；
//let hearts = Suit.Hearts
//let heartsDescription = hearts.simpleDescription()
//print(heartsDescription,hearts.hashValue,hearts.color())


//struct 
//struct和class的区别：struct使用时往往是copy过去的，class则是通过引用by reference。

struct Card {
    var rank : Rank
    var suit : Suit
    
    func simpleDescription() -> String {
        return "the \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    
    /*
     //疑问：此处语法有些不明白
    func createFullDeckCards() -> [Card] {
        var cards : [Card] = []
        var suits : [Suit] = [.Hearts,.Clubs,.Spades,.Diamonds]
        
        for i in 1...13 {
            for suit in suits {
                cards += Card(rank: Rank.init(rawValue: i)!, suit: suit)
                //疑问：！的用法，是必须解包么
                //疑问：可变数组如何添加元素
            }
        }
        
        return cards
    }
 
 */
}

////注意.的使用，若编译器知道某数据类型，则可以使用.property来取该类型的属性；
////结构体的初始化
//let threeOfSpades = Card(rank: .Three, suit: .Spades)
//let threeOfSpadesDescription = threeOfSpades.simpleDescription()
//print(threeOfSpades,threeOfSpadesDescription)



////某enumeration case有两个值：rawValue、associated value。
////rawValue是在enumeration定义时赋值给它的，不可变；对于同一enumeration case的所有instance来讲，其rawValue是相同的；
////associated value是enumeration case instance创建时提供的；对于同一种enumeration case的不同instance来说,associated value可能不同；

enum ServerResponse {
    //注意此处tuple的用法
    //此处Result tuple可以用来存储associated value
    case Result(String,String)
    case Falure(String)
}


//let success = ServerResponse.Result("6:00 am", "8:09 pm")
//let falure = ServerResponse.Falure("out of cheese")
//
//switch success {
////注意此处associated value是如何取出的
//case let .Result(sunrise,sunset):
////此行的意思是，取出success中存储的associated value，并赋值给sunrise、sunset两个变量
////疑问：case是如何判断得知的
//    print("sunrise is at \(sunrise),sunset is at \(sunset)")
//case let .Falure(message):
//    print("Falure...\(message)")
//}


//protocols extensions
//classes、enumerations、structs均可以采用某协议protocol
protocol ExampleProtocol {
    var simpleDescription : String { get }
    mutating func adjust()
}

//注意此处class实现protocol的adjust函数，没有添加mutating关键字，因为class中的method本来就可以改变class中的值
class SimpleClass: ExampleProtocol {
    var simpleDescription : String = "A very simple class"
    var anotherProperty : Int = 69105
    
    func adjust() {
        simpleDescription += "   Now 100% adjust"
    }
    
}

//var a = SimpleClass()
//a.adjust()
//let aDescription = a.simpleDescription
//print(aDescription)

////注意，protocol类型和其它类型一样，可以使用其name，来创建protocol instance。
////该protocol instance只能访问该protocol拥有的property及method，而不能访问该protocol没有声明的property、method。
////示例中，protocolValue在runtime中虽然是一个SimpleClass，但编译器仍把它当作ExampleProtocol来处理。只能访问该protocol声明的property、method，而不能访问SimpleClass中的其它property、method
//let protocolValue : ExampleProtocol = a
//print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty)

//注意此处structure实现protocol的adjust函数，前面添加了mutating关键字来标明：该method修改了该structure
struct SimpleStructure: ExampleProtocol {
    var simpleDescription : String = "A very simple structure"
    
    mutating func adjust() {
        simpleDescription += "  (adjust)"
    }
}

//var b = SimpleStructure()
//b.adjust()
//let bDescription = b.simpleDescription
//print(bDescription)


////疑问：enum如何添加协议
//enum SimpleEnumeration: ExampleProtocol {
//    case simpleDescription : String = "A very simple structure"
//    
//    mutating func adjust() {
//        simpleDescription += "  (adjust)"
//    }
//}

extension Int : ExampleProtocol {
    var simpleDescription : String { return "The number of \(self)"}
    mutating func adjust() {
        self += 42
    }
}

//var a : Int = 7
//a.adjust()
//print(a.simpleDescription)

extension Double {
    var absoluteValue : Int { return Int(self) }
    
}

//var a : Double = 6.998
//print(a.absoluteValue)

//error handling
//任何采用Error protocol的类型，均可以用来表达error
enum PrinterError : Error {
    case OutOfPaper
    case NoToner
    case OnFire
}


////异常抛出
////使用throws关键字来标记某function会抛出异常；使用throw语句来抛出异常；
////当throw抛出异常时，该抛出异常的函数马上结束，调用该函数的代码负责处理异常
//func sendToPrinter(printerName : String) throws -> String {
//    if printerName == "Never has toner" {
//        throw PrinterError.NoToner
//    }else if printerName == "On fire" {
//        throw PrinterError.OnFire
//    }else if printerName == "Out of paper" {
//        throw PrinterError.OutOfPaper
//    }
//    return "Job sent"
//}

/*
 //异常捕获、处理
 //使用do-catch来处理异常。在do block中，使用try关键字来标记可能抛出异常的代码。在catch block中，编译器会自动把异常命名为error，除非用代码命名为其它名字，在此可以处理该error。
 //使用multiple catch block来处理一些特定的异常。
 do {
 //            let printerResponse = try sendToPrinter(printerName: "Gutunberg")
 //            print(printerResponse)
 
 //            let a = try sendToPrinter(printerName: "On fire")
 //            print(a)
 
 //            let b = try sendToPrinter(printerName: "Out of paper")
 //            print(b)
 
 let c = try sendToPrinter(printerName: "Out of paper")
 print(c)
 
 }catch PrinterError.OnFire {
 print("I'll just put this over there, with the rest of fire")
 
 }
 //        catch let printerError as PrinterError{
 //            //疑问：此处let-as是什么意思
 //            print("Printer error : \(printerError).")
 //
 //        }
 //注意：若catch没有具体指定某种特定错误，则抛出的异常均会在此处显示，编译器默认用error来命名该异常
 catch {
 print(error)
 }
 */

////另一种处理异常的方法是用try?把func结果转换为optional类型，若该func抛出异常，则异常会被抛出，该func result为nil;若该func没有异常，则该func result为一个optional类型的instance，且该func result会赋值给它。
//let printerSuccess = try? sendToPrinter(printerName: "Success")
//let printerFalure = try? sendToPrinter(printerName: "On fire")


////defer block中的代码在function中会延迟执行：仅仅在return之前，其它所有代码之后。
////defer block中的代码一定会执行，不管该function是否抛出错误throws an error。
////使用defer block把setup code及cleanup code写在一起，虽然它们在不同的时间执行。
//var fridgeIsOpen = false
//let fridgeContent = ["milk","eggs","leftovers"]
//
//func fidgeContents(itemName:String)->Bool {
//    fridgeIsOpen = true
//    
//    defer {
//        fridgeIsOpen = false
//    }
//    
//    let result = fridgeContent.contains(itemName)
//    return result
//}
//
//fidgeContents(itemName: "banana")
//print(fridgeIsOpen)



////在尖括号中写一个名称，可以定义一个通用函数或通用类型。
//func repeatItems<Item> (item:Item,numberOfTimes:Int) -> [Item] {
//    var result = [Item]()
//    //等同于 var result : [Item] = []
//    
//    //疑问：_的用法
//    for _ in 0..<numberOfTimes {
//        result.append(item)
//    }
//    return result
//}
//
//print(repeatItems(item: "knock", numberOfTimes: 4))

//可以使用<>来声明通用funtion、method、class、structure、enumeration等等，均可
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
    
}

////注意此处 : OptionalValue<Int>的用法，其它相当于?，声明该值为optional，可能为空
//var possibleInteger : OptionalValue<Int> = .None
//possibleInteger = .Some(100)
//print(possibleInteger)


//where的用法
//where：在类型后面使用where，来添加一系列对该类型的限制：比如要求该type必须采用某protocol，要求某两种type必须一样，要求某class必须有某特定的 particular superclass
//<T:Equatable> 相当于 <T where T:Equatable>
//疑问：sequence的用法
//疑问：lhs、rhs运算符重载？
//疑问：Equatable
//func anyCommonElements <T:Sequence, U:Sequence> (lhs:T, _ rhs:U) -> Bool where T.Iterator.Element:Equatable, T.Iterator.Element==U.Iterator.Element {
//    for lhsItem in lhs {
//        for rhsItem in rhs {
//            if lhsItem == rhsItem {
//                return true
//            }
//        }
//    }
//    
//    return false
//}
//
//print(anyCommonElements( lhs:[1,2,3,], [3]))




// Playground - how to implement Hashable and Equatable

import UIKit

//MARK: - Equatable
func ==(lhs: Bit, rhs: Bit) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

class Bit : Hashable {
    
    var point : CGPoint
    
    //MARK: - Hashable
    var hashValue : Int {
        get {
            return "\(self.point.x),\(self.point.y)".hashValue
        }
    }
    
    //MARK: - Bit
    init(point: CGPoint) {
        self.point = point
    }
    
}

//var point_a_1_0 = Bit(point: CGPoint(x: 1, y: 0))
//var point_b_1_0 = Bit(point: CGPoint(x: 1, y: 0))
//var point_c_0_1 = Bit(point: CGPoint(x: 0, y: 1))
//
//point_a_1_0 == point_b_1_0
//point_a_1_0 == point_c_0_1
//


//
////fallthrough测试
//let integerToDescrib = 5
//var description = "the number \(integerToDescrib)"
//
//switch integerToDescrib {
//case 1,3,5,7,9,11:
//    description += "a prime number ,and alse "
//    fallthrough
//    
//case 2,4,6,8,10:
//    description += "fallthrough test"
//    
//default:
//    description += "an integer"
//}
//
//print(description)
