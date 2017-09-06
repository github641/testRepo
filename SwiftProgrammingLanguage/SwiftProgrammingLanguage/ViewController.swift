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
        let Pi = Double(three) + pointOneFourOneFiveNine
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
        
        
        // MARK: - 布尔值
        /*lzy170906注:
         Swift 有一个基本的布尔(Boolean)类型，叫做 Bool 。布尔值指逻辑上的值，因为它们只能是真或者假。Swift 有两个布尔常量，true 和 false:
         
         初始化常量或者变量的时候如果所赋的值类型已知，就可以触发类型推断
         */
        let orangesAreOrange = true
        let turnipsAreDelicious = false
        
        
        if turnipsAreDelicious {
            print("Mmm, tasty turnips!")
        } else {
            print("Eww, turnips are horrible.")
        }
        // 输出 "Eww, turnips are horrible."
        
        /*lzy170906注:
         如果你在需要使用 Bool 类型的地方使用了非布尔值，Swift 的类型安全机制会报错.
         和 Swift 中的其他类型安全的例子一样，这个方法可以避免错误并保证这块代码的意图总是清晰的。
         */
        
        let i = 1
        //        if i {
        // 这个例子不会通过编译，会报错Int is not convertible to ‘Bool’
        //        }
        
        if i == 1 {
            // 这个例子会编译成功
        }
        
        // MARK: - 元组
        /*lzy170906注:
         
         元组(tuples)把多个值组合成一个复合值。
         组内的值可以是任意类型，并不要求是相同类型。
         
         */
        
        let http404Error = (404, "Not Found")
        // http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
        /*lzy170906注:
         这个例子中，(404, "Not Found") 是一个描述 HTTP 状态码(HTTP status code)的元组。HTTP 状态码是 当你请求网页的时候 web 服务器返回的一个特殊值。如果你请求的网页不存在就会返回一个 404 Not Found 状 态码。
         
         (404, "Not Found") 元组把一个Int值和一个String值组合起来表示 HTTP 状态码的两个部分:一个数字和一个人类可读的描述。这个元组可以被描述为“一个类型为(Int, String)的元组”。
         
         你可以把任意顺序的类型组合成一个元组，这个元组可以包含所有类型。只要你想，你可以创建一个类型为 (Int, Int, Int)或者(String, Bool)或者其他任何你想要的组合的元组。
         */
        
        // 你可以将一个元组的内容分解(decompose)成单独的常量和变量，然后你就可以正常使用它们了:
        
        let (statusCode, statusMessage) = http404Error
        print("statusCode:The status code is \(statusCode)")// 输出 "The status code is 404"
        print("statusMessage:The status message \(statusMessage)")// 输出 "The status message is Not Found"
        
        // 如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线( _ )标记
        
        let (justTheStatusCode, _) = http404Error
        print("justTheStatusCode:The status code is \(justTheStatusCode)")
        
        // 此外，你还可以通过下标来访问元组中的单个元素，下标从零开始:
        print("access from index:The status code is \(http404Error.0)")
        print("access from index:The status message is \(http404Error.1)")
        
        // 你可以在定义元组的时候给单个元素命名:
        let http200Status = (statusCode: 200, description: "OK")
        // 给元组中的元素命名后，你可以通过名字来获取这些元素的值:
        print("access with element name:The status code is \(http200Status.statusCode)")
        print("access with element name:The status code is \(http200Status.description)")
        
        /*lzy170906注:
         作为函数返回值时，元组非常有用。
         一个用来获取网页的函数可能会返回一个 (Int, String) 元组来描述是否 获取成功。
         和只能返回一个类型的值比较起来，一个包含两个不同类型值的元组可以让函数的返回信息更有用。
         
         注意:
         元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。
         如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组。请参考类和结构体。
         */
        
        // MARK: - 可选类型
        /*lzy170906注:
         使用可选类型(optionals)来处理值可能缺失的情况。
         可选类型表示:
         • 有值，等于 x
         或者
         • 没有值
         
         
         注意:
         C 和 Objective-C 中并没有可选类型这个概念。
         最接近的是 Objective-C 中的一个特性，一个方法要不返回一个对象要不返回 nil ， nil 表示“缺少一个合法的对象”。
         然而，这只对对象起作用——对于结构体，基本的 C 类型或者枚举类型不起作用。对于这些类型，Objective-C 方法一般会返回一个特殊值(比如 NSNotFound )来暗示值缺失。这种方法假设方法的调用者知道并记得对特殊值进行判断。
         然而，Swift 的可选类型可以让你暗示任意类型的值缺失，并不需要一个特殊值。
         
         
         Swift 的 Int 类型有一种构造器，作用是将一个 String 值转换成一个 Int 值。然而，并 不是所有的字符串都可以转换成一个整数。字符串 "123" 可以被转换成数字 123 ，但是字符串 "hello, wor ld" 不行。
         
         */
        
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        // convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
        
        /*lzy170906注:
         因为该构造器可能会失败，所以它返回一个可选类型(optional) Int ，而不是一个 Int 。一个可选的 Int 被写作 Int? 而不是 Int 。问号暗示包含的值是可选类型，也就是说可能包含 Int 值也可能不包含值。(不能包含其他任何值比如 Bool 值或者 String 值。只能是 Int 或者什么都没有。)
         */
        
        // MARK: 可选类型：nil
        // 你可以给可选变量赋值为 nil 来表示它没有值:
        var serverResCode: Int? = 404
        // serverResponseCode 包含一个可选的 Int 值 404
        serverResCode = nil
        // serverResponseCode 现在不包含值
        
        /*lzy170906注:
         nil 不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。
         */
        
        //        如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil :
        var surveyAnswer: String?
        print("可选类型：nil的值是\(surveyAnswer)")// String interpolation(插入、插值) produces a debug description for an optional value;did you mean to make this explicit?
        
        /*lzy170906注:
         注意:
         Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中， nil 是一个指向不存在对象的指 针。在 Swift 中， nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil ，不只是对象类型。
         */
        
        // MARK: 可选类型：if语句以及强制解析
        /*lzy170906注:
         你可以使用 if 语句和 nil 比较来判断一个可选值是否包含值。你可以使用“相等”(==)或“不 等”( != )来执行比较。
         如果可选类型有值，它将不等于 nil :
         */
        
        if convertedNumber != nil {
            print("convertedNumber contains some integer value.")
            // 输出 "convertedNumber contains some integer value."
        }
        
        
        /*lzy170906注:
         可选值的强制解析(forced unwrapping):
         当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号( ! )来获取值。这个惊叹号表示“我知道这个可选有值，请使用它。”
         
         注意:
         使用 ! 来获取一个不存在的可选值会导致运行时错误。使用 ! 来强制解析值之前，一定要确定可选包含一 个非 nil 的值。
         */
        
        if convertedNumber != nil {
            print("可选值的强制解析(forced unwrapping):convertedNumber has an integer value of \(convertedNumber!).")
        }
        
        // MARK: 可选类型: 可选绑定
        
        /*lzy170906注:
         使用可选绑定(optional binding)来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。
         可选绑定可以用在 if 和 while 语句中，这条语句不仅可以用来判断可选类型中是否有值，同时可以将 可选类型中的值赋给一个常量或者变量
         */
        // 格式
//        if let constantName = someOptional {
//            statements
//        }
        
        if let actualNumber = Int (possibleNumber) {
            print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
        }else {
            print("\'\(possibleNumber)\' could not be converted to an integer")
        }
        /*lzy170906注:
         
         // 输出 "'123' has an integer value of 123"

         “如果 Int(possibleNumber) 返回的可选 Int 包含一个值，创建一个叫做 actualNumber 的新常量并将可选 包含的值赋给它。”
         如果转换成功， actualNumber 常量可以在 if 语句的第一个分支中使用。它已经被可选类型 包含的 值初始化 过，所以不需要再使用 ! 后缀来获取它的值。在这个例子中，actualNumber 只被用来输出转换结果。
         你可以在可选绑定中使用常量和变量。如果你想在if语句的第一个分支中操作 actualNumber 的值，你可以改 成 if var actualNumber ，这样可选类型包含的值就会被赋给一个变量而非常量。
         */
        
        
        /*lzy170906注:
         你可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行。
         只要有任意一个可选绑定 的值为nil，或者任意一个布尔条件为false，则整个if条件判断为false，这时你就需要使用嵌套 if 条件语句来处理，如下所示:
         */
        if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
            
            print("可选绑定与多个布尔条件写在一行：\(firstNumber) < \(secondNumber) < 100")
        }
        
        if let firstNumber = Int("4"){
            if let secondNumber = Int("42"){
                if firstNumber < secondNumber && secondNumber < 100 {
                    print("可选绑定、布尔条件嵌套：\(firstNumber) < \(secondNumber) < 100")
   
                }
            }
        }
        
        // MARK: 可选类型：隐式解析可选类型
     
        /*lzy170906注:

         如上所述，可选类型暗示了常量或者变量可以“没有值”。可选可以通过 if 语句来判断是否有值，如果有值的 话可以通过可选绑定来解析值。
         
         隐式解析可选类型(implicitly unwrapped optionals):
         第一次被赋值之后，可以确定一个可选类型总会有值

         有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型总会有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。
         这种类型的可选状态被定义为隐式解析可选类型(implicitly unwrapped optionals)。把想要用作可选的类型 的后面的问号( String? )改成感叹号( String! )来声明一个隐式解析可选类型。
         
         当可选类型被第一次赋值之后就可以确定之后一直有值的时候，隐式解析可选类型非常有用。隐式解析可选类型 主要被用在 Swift 中类的构造过程中。
         
         一个隐式解析可选类型其实就是一个普通的可选类型，但是可以被当做非可选类型来使用，并不需要每次都使用 解析来获取可选值。下面的例子展示了可选类型 String 和隐式解析可选类型 String 之间的区别:
         */
        
        let possibleString: String? = "An optional string"
        let forcedString: String = possibleString! // 需要感叹号来获取值 Value of optinal type ‘String?’ not unwrapped; did you mean to use ‘!’ or ‘?’
        print("var forcedString:\(forcedString)")
        
        let assumedString: String! = "An implicitly unwrapped optional string."
        let implicitString: String = assumedString // 不需要感叹号
        /*lzy170906注:
         你可以把隐式解析可选类型当做一个可以自动解析的可选类型。你要做的只是声明的时候把感叹号放到类型的结
         尾，而不是每次取值的可选名字的结尾。
         注意:
         如果你在隐式解析可选类型没有值的时候尝试取值，会触发运行时错误。和你在没有值的普通可选类型后面加一个惊叹号一样。
         */
        
        // 你仍然可以把隐式解析可选类型当做普通可选类型来判断它是否包含值:
        if assumedString != nil {
            print(assumedString)
        }// 输出 "An implicitly unwrapped optional string."
        
        // 你也可以在可选绑定中使用隐式解析可选类型来检查并解析它的值:
        if let definiteString = assumedString {
            print(definiteString)
        }// 输出 "An implicitly unwrapped optional string."
        
        /*lzy170906注:
         注意:
         如果一个变量之后可能变成 nil 的话请不要使用隐式解析可选类型。如果你需要在变量的生命周期中判断是否 是 nil 的话，请使用普通可选类型。
         */
        
        // MARK: - 错误处理
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
