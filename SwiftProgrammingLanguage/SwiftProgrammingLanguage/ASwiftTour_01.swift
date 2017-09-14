//
//  ViewController.swift
//  SwiftProgrammingLanguage
//
//  Created by alldk on 2017/8/28.
//  Copyright © 2017年 alldk. All rights reserved.
//
/*lzy170905注:
 这个类，对应的是 The Swift Programming Language第一章（A Swift Tour）的内容：欢迎使用Swift。
 是Swift语言的整体概览。
 */


import UIKit

/*lzy170904注:
 1、使用 protocol 来声明一个协议。
 */
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

/*lzy170904注:
 练习: 给 Double 类型写一个扩展，添加 absoluteValue 功能。
 */
extension Double {
    
    func absoluteValue() -> Double {
        var a :Double = 0.0
        if self >= 0 {
            a = self
        } else if self < 0{
            a = -self
        }
        return a
    }
}

/*lzy170904注:
 2.2使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展在别处修改定义，甚至是 从外部库或者框架引入的一个类型，使得这个类型遵循某个协议。
 */
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}


/*lzy170904注:
 2.1类、枚举和结构体都可以实现协议。
 
 注意声明 SimpleStructure 时候 mutating 关键字用来标记一个会修改结构体的方法。 SimpleClass 的声明不需要 标记任何方法，因为类中的方法通常可以修改类属性(类的性质)。
 */
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "Now 100% adjusted."
    }
}
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure."
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
/*lzy170904注:
 练习：写一个实现这个协议的枚举。
 
 //作者：guoshengboy
 //链接：http://www.jianshu.com/p/abb731c4a91d
 //來源：简书
 //著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
enum SimpleEnum: ExampleProtocol {
    
    case Buy, Sell
    var simpleDescription: String {
        switch self {
        case .Buy: return "We're buying something"
        case .Sell: return "We're selling something"
        }
    }
    
    // lzy170904注：left side of mutating operator isn’t mutable:’simpleDescription’ is a get-only property
    //    mutating func adjust() {
    //        simpleDescription += "(adjusted)"
    //    }
    mutating func adjust() {
        print("left side of mutating operator isn’t mutable:’simpleDescription’ is a get-only property")
    }
}




/*lzy170831注:
 
 如果你不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用 willSet 和 didSet 。
 比如，下面的类确保三角形的边长总是和正方形的边长相同。
 */

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init (size: Double, name: String){
        
        square = Square (sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}


/*lzy170831注:
 除了储存简单的属性之外，属性可以有 getter 和 setter 。
 
 在 perimeter 的 setter 中，新值的名字是 newValue 。你可以在 set 之后显式的设置一个名字。 注意 EquilateralTriangle 类的构造器执行了三步:
 1. 设置子类声明的属性值
 2. 调用父类的构造器
 3. 改变父类定义的属性值。其他的工作比如调用方法、getters 和 setters 也可以在这个阶段完成。
 */

class EquilateralTriangle: NamedShape {
    
    var sideLength : Double = 0.0
    
    init (sideLength: Double, name: String){
        
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    // lzy170831注：周长
    var perimeter : Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}


/*lzy170831注:
 练习: 创建 NamedShape 的另一个子类 Circle ，构造器接收两个参数，一个是半径一个是名称，在子类 Circle 中实现 area() 和 simpleDescription() 方法。
 */

class Circle: NamedShape {
    var radius : Double
    
    init(radius : Double, name: String){
        self.radius = radius
        super.init(name: name)
        
    }
    
    func area() -> Double{
        
        return 3.14 * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)."
    }
}



/*lzy170831注:
 子类的定义方法是在它们的类名后面加上父类的名字，用冒号分割。创建类的时候并不需要一个标准的根类，所
 以你可以忽略父类。
 子类如果要重写父类的方法的话，需要用 override 标记——如果没有添加 override 就重写父类方法的话编译器 会报错。编译器同样会检测 override 标记的方法是否确实在父类中。
 */
class Square: NamedShape {
    
    var sideLength: Double
    
    init (sideLength: Double, name: String) {
        
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
        
    }
    
    func area() -> Double{
        
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
    
}


/*lzy170831注:
 使用 init 来创建一个构造器。
 如果你需要在删除对象之前进行一些清理工作，使用 deinit 创建一个析构函数。
 
 
 注意 self 被用来区别实例变量。当你创建实例的时候，像传入函数参数一样给类传入构造器的参数。每个属性都 需要赋值——无论是通过声明(就像 numberOfSides )还是通过构造器(就像 name )。
 
 */
class NamedShape {
    var numberOfSides: Int = 0
    var name : String
    
    init (name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


/*lzy170831注:
 使用 class 和类名来创建一个类。类中属性的声明和常量、变量声明一样，唯一的区别就是它们的上下文是 类。同样，方法和函数声明也一样。
 练习: 使用 let 添加一个常量属性，再添加一个接收一个参数的方法。
 要创建一个类的实例，在类名后面加上括号。使用点语法来访问实例的属性和方法。
 
 这个版本的 Shape 类缺少了一些重要的东西:一个构造函数来初始化类实例。使用 init 来创建一个构造器。
 */
class Shape {
    var numberOfSides = 0
    let constant = 9
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
        
    }
    
    func hasParamFunc(constantVar : Int) -> String {
        return "This is \(constantVar)."
    }
}

class ASwiftTour_01: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 常量、变量、类型自动推断
        // lzy170829注：在屏幕上打印“Hello, world”
        /*lzy170829注:
         这行代码就是一个完整的程 序。你不需要为了输入输出或者字符串处理导入一个单独的库。全局作用域中的代码会被自动当做程序的入口 点，所以你也不需要 main() 函数。你同样不需要在每个语句结尾写上分号。
         */
        print("hello swift")
        
        /*lzy170829注:
         使用 let 来声明常量，使用 var 来声明变量。
         
         
         一个常量的值，在编译的时候，并不需要有明确的值，但是你只能 为它赋值一次。也就是说你可以用常量来表示这样一个值:你只需要决定一次，但是需要使用很多次。
         
         常量或者变量的类型必须和你赋给它们的值一样。
         
         然而，你不用明确地声明类型，声明的同时赋值的话，编译器 会自动推断类型。
         
         在上面的例子中，编译器推断出 myVariable 是一个整数(integer)因为它的初始值是整数。
         */
        var myVaridalbe = 43
        
        myVaridalbe = 55
        
        let myConstant = 44
        
        let implicitInteger = 80
        
        let implicitDouble = 90.0
        
        // MARK: - 显式指定类型、类型转换
        
        /*lzy170829注:
         如果初始值没有提供足够的信息(或者没有初始值)，那你需要在变量后面声明类型，用冒号分割。
         显式指定类型.
         值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型，请显式转换。
         */
        
        let explicitDouble: Double = 99
        
        let aFloat: Float = 4
        
        /*lzy170829注:
         删除最后一行中的 String ，错误提示是什么?
         Binary operator ‘+’ cannot be applied to operands（n. [计] 操作数；[计] 操作对象；[计] 运算对象（operand的复数形式）） of type ‘String’ and ‘Int’
         */
        let label = "The width is"
        let width = 94
        let widthLabel = label + String(width)
        
        
        /*lzy170829注:
         有一种更简单的把值转换成字符串的方法:把值写到括号中，并且在括号之前写一个反斜杠。例如:
         */
        
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples."
        let fruitSummary = "I have \(apples + oranges) pieces of fruit."
        
        /*lzy170829注:
         练习: 使用 \() 来把一个浮点计算转换成字符串，并加上某人的名字，和他打个招呼。
         */
        let eyes = 3
        let greet = "Hello, \(eyes) eyes Json"
        
        // MARK: - 数组和字典
        /*lzy170829注:
         使用方括号 [] 来创建数组和字典，并使用下标或者键(key)来访问元素。最后一个元素后面允许有个逗号。
         */
        
        var shoppingList = ["catfish", "water", "tulips", "blue paint"]
        
        shoppingList[1] = "bottle of water"
        
        var occupations = [
            "Malcolm" : "Captain",
            "Kaylee" : "Mechanic",
            ]
        
        occupations["Jayne"] = "Public Relations"
        
        /*lzy170829注:
         要创建一个空数组或者字典，使用初始化语法。
         */
        let emptyArray = [String]()
        let emptyDictionary = [String : Float]()
        
        /*lzy170829注:
         如果类型信息可以被推断出来，你可以用 [] 和 [:] 来创建空数组和空字典——就像你声明变量或者给函数传参 数的时候一样。
         */
        shoppingList = []
        occupations = [:]
        
        // MARK: - 控制流
        
        /*lzy170829注:
         使用 if 和 switch 来进行条件操作，使用 for-in 、 for 、 while 和 repeat-while 来进行循环。包裹条件和循环变量的括号可以省略，但是语句体的大括号是必须的。
         */
        
        let individualScores = [75, 22, 103, 87, 12]
        var teamScore = 0
        for score in individualScores {
            if score > 50 {
                // lzy170829注：+= 这个运算符，两边都要有空格
                teamScore += 3
            } else {
                teamScore += 1
            }
        }
        
        print(teamScore)
        
        /*lzy170829注:
         在 if 语句中，条件必须是一个布尔表达式——这意味着像 if score { ... } 这样的代码将报错，而不会隐形地 与 0 做对比。
         */
        
        // MARK: 可选值
        
        /*lzy170829注:
         你可以一起使用 if 和 let 来处理值缺失的情况。这些值可由可选值来代表。一个可选的值是一个具体的值或者 是 nil 以表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的。
         */
        
        var optionalString : String? = "Hello"
        
        print(optionalString == nil)
        
        var optionalName: String? = "John Appleseed"
        
        var greeting = "Hello!"
        /*lzy170829注:
         把optionalName改成 nil ，greeting会是什么?添加一个else语句，当optionalName是nil时给 greeting 赋一个不同的值。
         
         如果变量的可选值是 nil ，条件会判断为 false，大括号中的代码会被跳过。如果不是 nil，会将值解包并赋给 let后面的常量，这样代码块中就可以使用这个值了。
         
         */
        optionalName = nil
        
        if let name = optionalName {
            greeting = "Hello \(name)"
        }else{
            greeting = "Hello friend!"
        }
        print(greeting)
        
        
        /*lzy170829注:
         另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。
         */
        
        let nickName : String? = nil
        let fullName : String = "John Appleseed"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        
        print(informalGreeting)
        
        // MARK: switch
        
        /*lzy170829注:
         switch 支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。
         
         注意 let 在上述例子的等式中是如何使用的，它将匹配等式的值赋给常量 x 。
         
         删除 default 语句，看看会有什么错误?
         
         switch must be exhaustive(详尽的、穷举的),consider adding a default clause（语句，条款）
         
         运行 switch 中匹配到的子句之后，程序会退出 switch 语句，并不会继续向下运行，所以不需要在每个子句结尾 写 break 。
         */
        
        let vegetable = "red pepper"
        switch vegetable {
        case "celery" :
            print("Add some raisins and make ants on a log.")
            
        case "cucumber", "watercress" :
            print("That would make a good tea sandwich.")
            
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
            
        default:
            print("Everything tastes good in soup.")
            
        }
        
        
        // MARK: for-in
        /*lzy170829注:
         你可以使用 for-in 来遍历字典，需要两个变量来表示每个键值对。字典是一个无序的集合，所以他们的键和值以 任意顺序迭代结束。
         */
        
        let interestingNumbers = [
            "Prime" : [2, 3, 5, 7, 11, 13],
            "Fibonacci" : [1, 1, 2, 3, 5, 8],
            "Square" : [1, 4, 9, 16, 25],
            
            ]
        
        
        /*lzy170829注:这个题不理解
         练习: 添加另一个变量来记录最大数字的种类(kind)，同时仍然记录这个最大数字的值。
         
         */
        /*lzy170906注:理解了。
         kind 和 numbers都是随意命名的。可以用任意的a,b之的替代。
         */
        
        
        var largest = 0
        // TODO: Immutable value 'kind' was never used;consider replacing with '_' or removing it

        for (kind, numbers) in interestingNumbers{
            for n in numbers{
                
                if n > largest {
                    largest = n
                }
                
            }
            
        }
        print(largest)
        
        // MARK: while
        
        /*lzy170829注:
         使用 while 来重复运行一段代码直到不满足条件。循环条件也可以在结尾，保证能至少循环一次。
         */
        
        var n = 2
        while n < 100 {
            n = n * 2
        }
        print(n)
        
        var m = 2
        repeat {
            
            m = m * 2
            
        } while m < 100
        print(m)
        
        /*lzy170829注:
         你可以在循环中使用 ..< 来表示范围。
         */
        var total = 0
        for i in 0 ..< 4{
            total += i
        }
        print(total)
        
        // MARK: - 函数与闭包
        
        // MARK: 函数的声明和调用
        /*lzy170830注:
         使用 func 来声明一个函数，使用名字和参数来调用函数。使用 -> 来指定函数返回值的类型。
         */
        func greetA(person: String, day: String) -> String{
            
            return "Hello \(person), today is \(day)."
        }
        greetA(person: "John", day: "Wednesday")
        
        /*lzy170830注:
         默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
         */
        /*lzy170906注:
         参数名前没有标签，默认使用参数名组成方法的一部分
         参数名前有标签，使用标签。
         使用 _ ，在参数名前使用它，则『参数名称不作为函数的参数标签』
         _ 和 自定义参数标签不可同时存在。
         */
        func greetB(_ person:String,on day:String) -> String {
            return "Hello \(person), today is \(day)."
        }
        

        
        greetB("John", on: "wednesday")
        
        // MARK: 函数返回值为元组
        /*lzy170830注:
         使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。
         */
        func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
            var min = scores[0]
            var max = scores[0]
            var sum = 0
            
            for score in scores {
                
                if score  > max {
                    max = score
                } else if score < min {
                    min = score
                }
                
                sum += score
            }
            
            return (min, max, sum)
        }
        
        let statistics = calculateStatistics(scores: [111,22,33,3,784,66])
        print(statistics.sum)
        print(statistics.2)// 取下标为2的元素，就是sum
        
        // MARK: 函数可以有可变个数的参数
        /*lzy170830注:
         函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式
         */
        
        func sumOf(numbers: Int...) -> Int {
            
            var sum = 0
            for number in numbers {
                sum += number
            }
            
            return sum
        }
        
        print(sumOf())
        print(sumOf(numbers: 1, 2, 3, 4, 5, 6, 7, 8))
        
        /*lzy170830注:
         练习：写一个计算参数平均值的函数。
         */
        func calculateAverage(nums: [Int]) -> Int {
            var sum : Int = 0
            for num in nums{
                sum += num
            }
            return (sum / nums.count)
            
        }
        
        func calculateAverageDouble(nums: [Double]) -> Double {
            var sum : Double = 0
            for num in nums{
                sum += num
            }
            
            return (sum / Double(nums.count))
            
        }
        
        
        print(calculateAverage(nums: [1, 2, 3, 4]))
        
        print(calculateAverageDouble(nums: [1.1, 1.2, 1.3, 1.4]))
        
        // MARK: 函数可以嵌套
        
        /*lzy170830注:
         函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
         */
        func returnFifteen() -> Int{
            var y = 10
            func add(){
                y += 5
            }
            add()
            return y
        }
        print(returnFifteen())
        
        // MARK: 函数可以作为另一个函数的返回值
        
        /*lzy170830注:
         函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
         */
        func makeIncrementer() -> ( (Int) -> Int ) {
            
            func addOne(number: Int) -> Int {
                return 1 + number
            }
            
            return addOne
        }
        
        func lessThanTen(number: Int) -> Bool{
            return number < 10
        }
        
        let increment = makeIncrementer()
        print(increment(9))
        
        // MARK: 函数可以作为参数传入另一个函数
        
        /*lzy170830注:
         函数也可以当做参数传入另一个函数。
         */
        func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool{
            
            for item in list {
                
                if condition(item){
                    return true
                }
                
            }
            return false
        }
        
        
        let arrayForClosure = [2, 44, 6, 09]
        let funcR1 = hasAnyMatches(list: arrayForClosure, condition: lessThanTen)
        print(funcR1)
        
        // MARK: 函数是一种特殊的闭包
        /*lzy170830注:
         函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包所建作用域中能得到的变量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数例子中所看到。
         你可以使用 {} 来创建 一个匿名闭包。使用 in 将参数和返回值类型声明与闭包函数体进行分离。
         */
        let funcR2 =  arrayForClosure.map { (number: Int) -> Int in
            let result = 3 * number
            return result
        }
        
        print(funcR2)
        
        /*lzy170830注:
         练习: 重写闭包，对所有奇数返回 0。
         */
        let funcR3 = arrayForClosure.map {
            /*lzy170830注:
             (number : Int) -> Int 是匿名闭包声明
             
             in 分割了 匿名闭包声明 和 匿名闭包函数体
             */
            (number : Int) -> Int in
            
            var res : Int
            if  number % 2 == 0{
                res = number
            }else {
                res = 0
            }
            
            return res
            
        }
        
        print(funcR3)
        
        
        /*lzy170830注:
         有很多种创建更简洁的闭包的方法。
         如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。
         单个语句闭包会把它语句的值当做结果返回。
         */
        let mappedNumbers = arrayForClosure.map({ number in 3 * number})
        print(mappedNumbers)
        
        /*lzy170830注:
         你可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。
         当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。
         当一个闭包是传给函数的唯一参数，你可以完全忽略括号。
         */
        
        let sortedNumbers = arrayForClosure.sorted{ $0 > $1}
        print(sortedNumbers)
        
        // lzy170830注：以上两个例子闭包都是作为参数传入的；mappedNumbers和sortedNumbers是map函数和sorted函数自身的返回值
        
        // MARK: - 对象和类
        
        /*lzy170831注:
         要创建一个类的实例，在类名后面加上括号。使用点语法来访问实例的属性和方法。
         */
        let shape = Shape()
        shape.numberOfSides = 9
        let shapeDescription = shape.simpleDescription()
        print(shapeDescription)
        
        let test = Square(sideLength: 5.2, name: "my test square")
        print(test.area())
        print(test.simpleDescription())
        
        let testCircle = Circle(radius: 9, name: "my test circle")
        print(testCircle.area())
        print(testCircle.simpleDescription())
        
        
        let triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
        print(triangle.perimeter)
        triangle.perimeter = 9.9
        print(triangle.sideLength)
        
        let triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
        print(triangleAndSquare.square.sideLength)
        print(triangleAndSquare.triangle.sideLength)
        
        triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
        print(triangleAndSquare.triangle.sideLength)
        
        /*lzy170831注:
         处理变量的可选值时，你可以在操作(比如方法、属性和子脚本)之前加 ? 。如果 ? 之前的值是 nil ， ? 后面 的东西都会被忽略，并且整个表达式返回 nil 。否则， ? 之后的东西都会被运行。在这两种情况下，整个表达式 的值也是一个可选值。
         
         */
        
        let optionalSquare: Square? = Square(sideLength: 2.5, name: "option square")
        let sideLength = optionalSquare?.sideLength
        
        
        // MARK: - 枚举和结构体
        
        // MARK: 枚举
        // lzy170901注：枚举似乎可以写在类中，也可以写在类外。这样的话，类将是枚举是否可以被发现被使用的范围
        /*lzy170901注:因为需要写一个枚举
         使用 enum 来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法。
         */
        enum Rank: Int {
            case Ace = 1
            case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
            case Jack, Queen, King
            
            func simpleDescription() -> String{
                switch self {
                case .Ace:
                    return "ace"
                    
                case .Jack:
                    return "jack"
                    
                case .King:
                    return "king"
                    
                default:
                    return String(self.rawValue)
                }
            }
        }
        
        
        func compareRank(rank1: Rank , rank2: Rank) -> Rank{
            return rank1.rawValue > rank2.rawValue ? rank1 : rank2
        }
        
        
        let ace = Rank.Ace
        print(ace.rawValue)
        
        /*lzy170901注:
         练习: 写一个函数，通过比较它们的原始值来比较两个 Rank 值。
         */
        
        let rank1 = Rank.Ten
        let rank2 = Rank.Queen
        
        print(compareRank(rank1: rank1, rank2: rank2))
        
        /*lzy170901注:
         默认情况下，Swift 按照从 0 开始每次加 1 的方式为原始值进行赋值，不过你可以通过显式赋值进行改变。
         在 上面的例子中， Ace 被显式赋值为 1，并且剩下的原始值会按照顺序赋值。
         你也可以使用字符串或者浮点数作为 枚举的原始值。
         使用 rawValue 属性来访问一个枚举成员的原始值。
         */
        
        /*lzy170901注:
         使用 init?(rawValue:) 初始化构造器在原始值和枚举值之间进行转换。
         */
        
        if let convertedRank = Rank(rawValue: 4) {
            let fourDescription = convertedRank.simpleDescription()
            print(fourDescription)
        }
        
        /*lzy170901注:
         枚举的成员值是实际值，并不是原始值的另一种表达方法。实际上，如果没有比较有意义的原始值，你就不需要提供原始值。
         
         */
        
        enum Suit {
            case Spades, Hearts, Diamonds, Clubs
            func simpleDescription() -> String {
                switch self {
                case .Spades:
                    return "spades"
                case .Hearts:
                    return "hearts"
                    
                case .Diamonds:
                    return "diamonds"
                case .Clubs:
                    return "clubs"
                    
                }
            }
            
            /*lzy170901注:
             练习: 给 Suit 添加一个 color() 方法，对 spades 和 clubs 返回“black”，对 hearts 和 diamonds 返回“red”。
             */
            func color() -> String{
                
                switch self {
                case .Spades:
                    return "black"
                case .Clubs:
                    return "black"
                case .Hearts:
                    return "red"
                case .Diamonds:
                    return "red"
                    
                }
            }
        }
        
        /*lzy170901注:
         注意，有两种方式可以引用 Hearts 成员:给 hearts 常量赋值时，枚举成员 Suit.Hearts 需要用全名来引用，因为常量没有显式指定类型。
         在 switch 里，枚举成员使用缩写 .Hearts 来引用，因为 self 的值已经知道是一个suit 。已知变量类型的情况下你可以使用缩写。
         */
        let hearts = Suit.Hearts
        print(hearts.simpleDescription())
        
        print(Suit.Hearts.color())
        
        
        /*lzy170901注:
         一个枚举成员的实例可以有实例值。相同枚举成员的实例可以有不同的值。创建实例的时候传入值即可。实例值
         和原始值是不同的:枚举成员的原始值对于所有实例都是相同的，而且你是在定义枚举的时候设置原始值。
         */
        
        /*lzy170901注:
         例如，考虑从服务器获取日出和日落的时间。服务器会返回正常结果或者错误信息。
         练习: 给 ServerResponse 和 switch 添加第三种情况。
         注意日升和日落时间是如何从 ServerResponse 中提取到并与 switch 的 case 相匹配的。
         */
        
        enum ServerResponse {
            case Result(String, String)
            case Failure(String)
            case CannotConnectToServerCode(String)
        }
        
        let success = ServerResponse.Result("6:00 am", "8:09 pm")
        let failure = ServerResponse.Failure("Out of cheese.")
        let code = ServerResponse.CannotConnectToServerCode("-1086")
        
        switch success {
            
        case let .Result(sunrise, sunset):
            let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
            
        case let .Failure(message):
            print("Failure... \(message)")
            
        case let .CannotConnectToServerCode(code):
            print("Cannot Connect To Server Code:\(code)")
        }
        
        // MARK: 结构体
        
        /*lzy170901注:
         使用 struct 来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用。
         
         */
        // TODO:         练习: 给 Card 添加一个方法，创建一副完整的扑克牌并把每张牌的 rank 和 suit 对应起来。

        
        struct Card {
            
            var rank: Rank
            var suit: Suit
            func simpleDescription() -> String {
                return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
            }
        }
        
        let threeOfSpades = Card(rank: .Three, suit: .Spades)
        print(threeOfSpades.simpleDescription())
        
        
        // MARK: - 协议和扩展
        
// lzy170904注：Protocol cannot be nested inside another declaration
//        protocol ExampleProtocol {
//            var simpleDescription: String { get }
//            mutating func adjust()
//        }
        /*lzy170904注:
         使用 protocol 来声明一个协议。
         类、枚举、结构体都可以实现协议。
         
         */
        var a = SimpleClass()
        print(a.simpleDescription)
        a.adjust()
        print(a.simpleDescription)
        
        
        var b = SimpleStructure()
        print(b.simpleDescription)
        b.adjust()
        print(b.simpleDescription)
        
        var c = SimpleEnum.Buy
        print(c.adjust())
        
        // lzy170904注：使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展在别处修改定义，甚至是 从外部库或者框架引入的一个类型，使得这个类型遵循某个协议。
        print(7.simpleDescription)
        // lzy170904注： 练习: 给 Double 类型写一个扩展，添加 absoluteValue 功能。
        print((-0.3).absoluteValue())
        
        /*lzy170904注:
         你可以像使用其他命名类型一样使用协议名——例如，创建一个有不同类型但是都实现一个协议的对象集合。当你处理类型的是协议的值，协议外定义的方法不可用。
         */
        let protocolValue: ExampleProtocol = a
        print(protocolValue.simpleDescription)
//        print(protocolValue.anotherProperty)// 去掉注释可以看到错误value of type ‘ExampleProtocol’ has no member ‘anotherProperty’
        
        // MARK: - 错误处理
        /*lzy170904注:
         使用 『采用Error协议的类型』来表示错误。
         */
        enum PrinterError: Error {
            case OutOfPaper
            case NoToner
            case OnFire
        }
        /*lzy170904注:
         使用throws 来表示一个可以抛出错误的函数。
         使用throw 来抛出一个错误。
         如果在函数中抛出了一个错误，这个函数会立即返回，并且调用该函数的代码会进行错误处理。
         */
        
        func send(job: Int, toPrinter printerName: String) throws -> String {
            if printerName == "Never Has Toner" {
                throw PrinterError.NoToner
            }
            return "Job sent"
        }
        
        // MARK: do-catch
        /*lzy170904注:
         有多种方式可以用来进行错误处理。一种方式是使用 do-catch 。
         在 do 代码块中，使用 try 来标记可以抛出错误 的代码。
         在 catch 代码块中，除非你另外命名，否则错误会自动命名为 error 。
         */
        
        do {
            let printerResponse = try send(job: 1040, toPrinter: "Bi sheng")
            print(printerResponse)
        }catch {
            print(error)
        }
        
        /*lzy170904注:
         练习: 将 printer name 改为 "Never Has Toner" 使 send(job:toPrinter:) 函数抛出错误。
         */
        do {
            let printerResponse = try send(job: 110, toPrinter: "Never Has Toner")
            print(printerResponse)
        }catch {
            print(error)
        }
        
        /*lzy170904注:
         可以使用多个 catch 块来处理特定的错误。参照 switch 中的 case 风格来写 catch 。
         */
        
        do {
            let printerResponse = try send(job: 100, toPrinter: "Gutenberg")
            print(printerResponse)
        }catch PrinterError.OnFire {
            print("I'll just put this over here, with the rest of the fire.")
        }catch let printerError as PrinterError {
            print("Printer error: \(printerError)")
        }catch {
            print(error)
        }
        /*lzy170904注:这里是翻译有问题。看英文的就好。要使得触发以上三个不同catch代码执行，需要在原函数中根据商定的判断标准，分别进行throw。
         Add code to throw an error inside the do block. What kind of error do you need to throw so that the error is handled by the first catch block? What about the second and third blocks?

         练习: 在 do 代码块中添加抛出错误的代码。你需要抛出哪种错误来使第一个 catch 块进行接收?怎么使第二 个和第三个 catch 进行接收呢?
         */

        // MARK: try?
        /*lzy170904注:
         另一种处理错误的方式使用 try? 将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为 nil 。否则的话，结果会是一个包含函数返回值的可选值。
         
         Optional("Job sent")
         nil
         */
        let pSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
        let pFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
        print(pSuccess)
        print(pFailure)
        
        /*lzy170904注:
         使用 defer 代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执行。
         使用 defer ，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执 行时机截然不同。
         */
        
        var fridgeIsOpen = false
        let fridgeContent = ["milk", "eggs", "leftovers"]
        
        func fridgeContains(_ food: String) ->Bool {
            fridgeIsOpen = true
            defer {
                fridgeIsOpen = false
            }
            
            let result = fridgeContent.contains(food)
            return result
        }
        
        
        
        print(fridgeContains("banner"))
        print(fridgeContains("milk"))
        print(fridgeIsOpen)
        
        // MARK: - 泛型
        /*lzy170904注:
         在尖括号里写一个名字来创建一个泛型函数或者类型。
         */
        func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
            var result = [Item]()
            
            for _ in 0..<numberOfTimes {
                result.append(item)
            }
            
            return result
        }
        
        print(repeatItem(repeating: "knock", numberOfTimes: 4))
        
        /*lzy170904注:
         你也可以创建泛型函数、方法、类、枚举、结构体。
         */
        // TODO:这个压根没有概念，没有理解
        
        // 重新实现Swift标准库中的可选类型
        enum OptionalValue<Wrapped> {
            case None
            case Some(Wrapped)
        }
        
        var possibleInteger: OptionalValue<Int> = OptionalValue.None
        possibleInteger = OptionalValue.Some(100)
        
        /*lzy170904注:
         在类型名后面使用 where 来指定对类型的需求，
         比如，限定类型实现某一个协议，限定两个类型是相同的，或者 限定某个类必须有一个特定的父类。
         练习: 修改 anyCommonElements(_:_:) 函数,
         来创建一个函数，返回一个数组，内容是两个序列的共有元素。
         <T: Equatable> 和 <T> ... where T: Equatable> 是等价的。
         */

        func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
            where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
                for lhsItem in lhs {
                    for rhsItem in rhs {
                        if lhsItem == rhsItem {
                            return true
                        } }
                }
                return false
        }
        anyCommonElements([1, 2, 3], [3])
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

