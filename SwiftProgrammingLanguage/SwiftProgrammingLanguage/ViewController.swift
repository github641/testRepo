//
//  ViewController.swift
//  SwiftProgrammingLanguage
//
//  Created by alldk on 2017/8/28.
//  Copyright © 2017年 alldk. All rights reserved.
//

import UIKit

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

class ViewController: UIViewController {
    
    
    
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
        greetA(person: "John", day: "Wednesday")
        
        greetB("John", on: "wednesday")
        
        // MARK: 函数返回值为元组
        
        let statistics = calculateStatistics(scores: [111,22,33,3,784,66])
        print(statistics.sum)
        print(statistics.2)// 取下标为2的元素，就是sum
        
        // MARK: 函数可以有可变个数的参数
        print(sumOf())
        print(sumOf(numbers: 1, 2, 3, 4, 5, 6, 7, 8))
        
        print(calculateAverage(nums: [1, 2, 3, 4]))
        
        print(calculateAverageDouble(nums: [1.1, 1.2, 1.3, 1.4]))
        
        // MARK: 函数可以嵌套
        print(returnFifteen())
        
        // MARK: 函数可以作为另一个函数的返回值
        let increment = makeIncrementer()
        print(increment(9))
        
        // MARK: 函数可以作为参数传入另一个函数
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
    }


    
    
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
    func lessThanTen(number: Int) -> Bool{
        return number < 10
    }
    
    /*lzy170830注:
     函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
     */
    func makeIncrementer() -> ( (Int) -> Int ) {
        
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        
        return addOne
    }
    
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
    
    /*lzy170830注:
     默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
     */
    func greetB(_ person:String,on day:String) -> String {
        return "Hello \(person), today is \(day)."
    }
    
    /*lzy170830注:
     使用 func 来声明一个函数，使用名字和参数来调用函数。使用 -> 来指定函数返回值的类型。
     */
    func greetA(person: String, day: String) -> String{
        
        return "Hello \(person), today is \(day)."
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

