//
//  ViewController.swift
//  SwiftProgrammingLanguage
//
//  Created by alldk on 2017/9/5.
//  Copyright © 2017年 alldk. All rights reserved.
//
/*lzy170905注:
 这个类，对应的是 The Swift Programming Language第二章（Language Guide）的内容：Swift教程。
 
 Swift 包含了 C 和 Objective-C 上所有基础数据类型，Int表示整型值;Double和Float表示浮点型 值;  Bool 是布尔型值; String是文本型数据。 Swift 还提供了三个基本的集合类型，Array，Set 和 Dictionary。
 
 就像 C 语言一样，Swift 使用变量来进行存储并通过变量名来关联值。在 Swift 中，广泛的使用着值不可变的 变量，它们就是常量，而且比 C 语言的常量更强大。
 
 Swift 还增加了 Objective-C 中没有的高阶数据类型比如元组(Tuple)。元组可以让你 创建或者传递一组数据，比如作为函数的返回值时，你可以用一个元组可以返回多个值。
 
 Swift 还增加了可选(Optional)类型，用于处理值缺失的情况。可选表示 “那儿有一个值，并且它等于 x ” 或者 “那儿没有值” 。可选有点像在 Objective-C 中使用nil，但是它可以用在任何类型上，不仅仅是 类。可选类型比 Objective-C 中的nil指针更加安全也更具表现力，它是 Swift 许多强大特性的重要组成部分。
 
 Swift 是一门类型安全的语言，这意味着 Swift 可以让你清楚地知道值的类型。尽早发现并修正错误。
 
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - 常量和变量
        
        /*lzy170905注:
         常量和变量把一个名字(比如 maximumNumberOfLoginAttempts 或者 welcomeMessage )和一个指定类型的 值(比如数字 10 或者字符串 "Hello" )关联起来
         
         常量的值一旦设定就不能改变，而变量的值可以随意更 改。
         
         */
        
        // MARK: 声明常量和变量
        /*lzy170905注:
         常量和变量必须在使用前声明，用 let 来声明常量，用 var 来声明变量。
         只将需要改变的值声明为变量
         
         “声明一个名字是 maximumNumberOfLoginAttempts 的新常量，并给它一个值 10 。"
         许的最大尝试登录次数被声明为一个常量，因为这个值不会改变。
         */
        let maximumNumberOfLoginAttempts = 10
        // 在一行中声明多个常量或者多个变量，用逗号隔开:
        
        var x = 0.0, y = 0.0, z = 0.0
        
        // MARK: 类型标注
        
        /*lzy170905注:
         1、类型标注(type annotation)，说明常量或者变量中要存储的值的类型。
         在常量或者变量名后面加上一个冒号和空格，然后加上类型名称
         
         2、声明中的冒号代表着“是...类型”，所以这行代码可以被理解为: “声明一个类型为 String ，名字为 welcomeMessage 的变量。”
         3、“类型为 String ”的意思是“可以存储任意 String 类型的值。”
         
         一般来说你很少需要写类型标注。如果你在声明常量或者变量的时候赋了一个初始值，Swift可以推断出这个常 量或者变量的类型。看onevcat在微博和大家讨论，似乎国内更多的还是显示声明类型，而不是让swift去做类型推断，来提高swift的编译效率。onevcat并不建议这么做。
         
         */
        
        var welcomMessage: String
        
        // 在一行中定义多个同样类型的变量，用逗号分割，并在最后一个变量名之后添加类型标注:
        var red, green, blue: Double
        

        // MARK: 常量和变量的命名
        
        // 你可以用任何你喜欢的字符作为常量和变量名，包括 Unicode 字符:
        
        let π = 3.1415926
        let 你好 = "你好世界"
        let ？？ = "dogcow"
        
        /*lzy170905注:
         常量与变量名不能包含数学符号，箭头，保留的(或者非法的)Unicode 码位，连线与制表符。也不能以数字开 头，但是可以在常量与变量名的其他地方包含数字。
         一旦你将常量或者变量声明为确定的类型，你就不能使用相同的名字再次进行声明，或者改变其存储的值的类型。
         同时，你也不能将常量与变量进行互转。
         
         注意: 如果你需要使用与Swift保留关键字相同的名称作为常量或者变量名，你可以使用反引号(`)将关键字包围的方 式将其作为名字使用。无论如何，你应当避免使用关键字作为常量或变量名，除非你别无选择。
         */
        
        // 可以更改现有的变量值为其他同类型的值
        var friendlyWelcome = "Hello!"
        friendlyWelcome = "Bonjour!"
        // 量的值一旦被确定就不能更改了。尝试这样做会导致编译时报错:cannot assign to value:’languageName’ is a ‘let’ constant
        let languageName = "Swift"
//        languageName = "Swift++"
        
        // MARK: 输出常量和变量
//        print(<#T##items: Any...##Any#>)
//        print(<#T##items: Any...##Any#>, to: &<#T##TextOutputStream#>)
//        print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)
//        print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>, to: &<#T##TextOutputStream#>)
        
        /*lzy170905注:
         print(_:separator:terminator:) 是一个用来输出一个或多个值到适当输出区的全局函数。
         如果你用 Xcode， print(_:separator:terminator:) 将会输出内容到“console”面板上。
         separator 和 terminator 参数具有默认值，因此你调用这个函数的时候可以忽略它们。
         默认情况下，该函数通过添加换行符来结束当前行。如果不想换行，可以传递一个空字符串给 terminator 参数
         例如， print(someValue, terminator:"") 。
         
         Swift 用字符串插值(string interpolation)的方式把常量名或者变量名当做占位符加入到长字符串中，Swift 会用当前常量或变量的值替换这些占位符。将常量或变量名放入圆括号中，并在开括号前使用反斜杠将其转义:

         */
        
        print("abcd efgh \(friendlyWelcome)")
        
        
        // MARK: - 注释
        /*lzy170905注:
         代码中的非执行文本
         Swift 的编译器将会在编译代码时自动忽略掉注释部分。
         
         单行注释以双正斜杠( // )作为起始标记
         多行注释，其起始标记为单个正斜杠后跟随一个星号( /* )，终止标记为一个星号后跟随单个正斜 杠(*/)
         
         与 C 语言多行注释不同，Swift 的多行注释可以嵌套在其它的多行注释之中。
         通过运用嵌套多行注释，你可以快速方便的注释掉一大段代码，即使这段代码之中已经含有了多行注释块。
         */
        // e.g. 嵌套多行注释示例
        /* 这是第一个多行注释的开头
         /* 这是第二个被嵌套的多行注释 */ 这是第一个多行注释的结尾 */
        
        
        // MARK: - 分号
        /*lzy170905注:
         与其他大部分编程语言不同，Swift 并不强制要求你在每条语句的结尾处使用分号( ; )，当然，你也可以按照 你自己的习惯添加分号。
         有一种情况下必须要用分号，即你打算在同一行内写多条独立的语句:
         */
        let cat = "?"; print(cat)
        
        // MARK: - 整数
        /*lzy170905注:
         整数就是没有小数部分的数字，比如 42 和 -23 。
         整数可以是 有符号 (正、负、零)或者 无符号 (正、零)。
         Swift 提供了8，16，32和64位的有符号和无符号整数类型。这些整数类型和 C 语言的命名方式很像，比如8位无 符号整数类型是 UInt8 ，32位有符号整数类型是 Int32 。就像 Swift 的其他类型一样，整数类型采用大写命名法。

         */
        
        // MARK: 整数范围
        // 你可以访问不同整数类型的 min 和 max 属性来获取对应类型的最小值和最大值:
        let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
        let maxVlue = UInt8.max  // maxValue 为 255，是 UInt8 类型
        
        // MARK: Int
        /*lzy170905注:
         一般来说，你不需要专门指定整数的长度。Swift 提供了一个特殊的整数类型   ，长度与当前平台的原生字长 相同:
         • 在32位平台上，Int和 Int32  长度相同。 
         • 在64位平台上，Int和 Int64 长度相同。
         
         除非你需要特定长度的整数，一般来说使用 Int 就够了。可以提高代码一致性和可复用性。
         */
        
        // MARK: UInt
        /*lzy170905注:
         特殊的无符号类型 UInt,长度与当前平台的原生字长相同:
          在32位平台上， UInt 和 UInt32 长度相同。
         在64位平台上， UInt 和 UInt64 长度相同。
         尽量不要使用 UInt ，除非你真的需要存储一个和当前平台原生字长相同的无符号整数。除了这种情况，最好使 用 Int ，即使你要存储的值已知是非负的。统一使用 Int 可以提高代码的可复用性，避免不同类型数字之间的 转换，并且匹配数字的类型推断
         */
        
        // MARK: - 浮点数
        
        /*lzy170905注:
         浮点数是有小数部分的数字，比如 3.14159 ，0.1 和 -273.15。
         浮点类型比整数类型表示的范围更大，可以存储比 Int 类型更大或者更小的数字。
         Swift 提供了两种有符号浮点数类型:
         Double表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。
         Float表示32位浮点数。精度要求不高的话可以使用此类型。
         
         Double 精确度很高，至少有15位数字，而 Float 只有6位数字。选择哪个类型取决于你的代码需要处理的值的范围，在两种类型都匹配的情况下，将优先选择 Double。
         */
        
        // MARK: - 类型安全和类型推断
        
        /*lzy170905注:
         Swift 是一个类型安全(type safe)的语言。类型安全的语言可以让你清楚地知道代码要处理的值的类型。如果
         你的代码需要一个 String ，你绝对不可能不小心传进去一个 Int 。
         
         由于 Swift 是类型安全的，所以它会在编译你的代码时进行类型检查(type checks)，并把不匹配的类型标记 为错误。这可以让你在开发的时候尽早发现并修复错误。
         
         编译器可以在编译代码的时候自动推断出表达式的类型。原理很简单，只要检查你赋的值即可。
         
        当你在声明常量或者变量的时候赋给它们一个字面 量(literal value 或 literal)即可触发类型推断。
         */
        
        let meaningOfLife = 42
        // meaningOfLife 会被推测为 Int 类型
        
        // 注意：当推断浮点数的类型时，Swift 总是会选择Double而不是Float。
        let pi = 3.14159
        // pi 会被推测为 Double 类型
        
        // 如果表达式中同时出现了整数和浮点数，会被推断为Double类型:
        let anotherPi = 3 + 0.14159
        // anotherPi 会被推测为 Double 类型
        
        // MARK: - 数值型字面量
        let decimalInteger = 17
        let binaryInteger = 0b10001 // 二进制的17
        let octalInteger = 0o21 // 八进制的17
        let hexadecimalInteger = 0x11 // 十六进制的17
        
        /*lzy170905注:
         1.25e2 表示 1.25 × 10^2，等于 125.0 。
         1.25e-2 表示 1.25 × 10^-2，等于 0.0125
         
         数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量:
         */
        let paddedDouble = 000123.456
        let oneMillion = 1_000_000
        let justOverOneMillion = 1_000_000.000_000_1
        
        
        // MARK: - 数值型类型转换
        
        /*lzy170905注:apple真是强力灌输 最佳实践
         通常来讲，即使代码中的整数常量和变量已知非负，也请使用 Int 类型。总是使用默认的整数类型可以保证你的 整数常量和变量可以直接被复用并且可以匹配整数类字面量的类型推断。
         
         只有在必要的时候才使用其他整数类型，比如要处理外部的长度明确的数据或者为了优化性能、内存占用等等。
         使用显式指定长度的类型可以及时发现值溢出并且可以暗示正在处理特殊数据。
         */
        
        // MARK: 整数转换
        /*lzy170905注:
         不同整数类型的变量和常量可以存储不同范围的数字。 Int8 类型的常量或者变量可以存储的数字范围是 -128 ~ 1 27 ，而 UInt8 类型的常量或者变量能存储的数字范围是 0 ~ 255 。如果数字超出了常量或者变量可存储的范 围，编译的时候会报错:
         */
        
//        let cannotBeNegative: UInt8 = -1
        // UInt8 类型不能存储负数，所以会报错 Negative integer ‘-1’ overflows when stored into unsigned type ‘Uint8’
    
//        let tooBig: Int8 = Int8.max + 1
        // Int8 类型不能存储超过最大值的数，所以会报错 Arithmetic operation ‘127 + 1’ (on type ‘Int8’) results in an overflow
        
        /*lzy170905注:
         由于每种整数类型都可以存储不同范围的值，所以你必须根据不同情况选择性使用数值型类型转换。这种选择性
         使用的方式，可以预防隐式转换的错误并让你的代码中的类型转换意图变得清晰。

         要将一种数字类型转换成另一种，你要用当前值来初始化一个期望类型的新数字，这个数字的类型就是你的目标 类型。在下面的例子中，常量 twoThousand 是 UInt16 类型，然而常量 one 是 UInt8 类型。它们不能直接相 加，因为它们类型不同。所以要调用 UInt16(one) 来创建一个新的 UInt16 数字并用 one 的值来初始化，然后使用 这个新数字来计算:
         */
        
        let twoThousand: UInt16 = 2_000
        let one: UInt8 = 1
        let twoThousandAndOne = twoThousand + UInt16(one)
        
        /*lzy170905注:
         现在两个数字的类型都是 UInt16 ，可以进行相加。目标常量 twoThousandAndOne 的类型被推断为 UInt1 6 ，因为它是两个 UInt16 值的和。
         
         omeType(ofInitialValue) 是调用 Swift 构造器并传入一个初始值的默认方法。在语言内部， UInt16 有一个 构造器，可以接受一个 UInt8 类型的值，所以这个构造器可以用现有的 UInt8 来创建一个新的 UInt16 。注 意，你并不能传入任意类型的值，只能传入 UInt16 内部有对应构造器的值。不过你可以扩展现有的类型来让它 可以接收其他类型的值(包括自定义类型)
         */

        // MARK: 整数和浮点数转换
        
        /*lzy170905注:
         整数和浮点数的转换必须显式指定类型:
         整数类型可以用 Double 或者 Float 类型来初始化:当用这种方式来初始化一个新的整数值时，浮点值会被截断,也就是说 4.75 会变成 4 ， -3.9 会变成 -3 。
         */
        
        let three = 3
        let pointOneFourOneFiveNine = 0.14159
        let pi = Double(three) + pointOneFourOneFiveNine
        // pi 等于 3.14159，所以被推测为 Double 类型。如果不进行转换，两者无法相加。
        
        let integerPi = Int(pi)
        // integerPi 等于 3，所以被推测为 Int 类型
        
        /*lzy170905注:
         注意:
         结合数字类常量和变量不同于结合数字类字面量。字面量 3 可以直接和字面量 0.14159 相加，因为数字字面量 本身没有明确的类型。它们的类型只在编译器需要求值的时候被推测。
         */
        
        // MARK: - 类型别名

        /*lzy170905注:
         类型别名(type aliases)就是给现有类型定义另一个名字。你可以使用 typealias 关键字来定义类型别名。
         当你想要给现有类型起一个更有意义的名字时，类型别名非常有用。假设你正在处理特定长度的外部资源的数
         据。
         
         */
        typealias AudioSample = UInt16
        // 定义了一个类型别名之后，你可以在任何使用原始名的地方使用别名:
        var maxAmplitudeFound = AudioSample.min // maxAmplitudeFound 现在是 0
//        本例中， AudioSample 被定义为 UInt16 的一个别名。因为它是别名， AudioSample.min 实际上是 UInt16.mi n ，所以会给 maxAmplitudeFound 赋一个初值 0 。

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
