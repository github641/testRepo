//
//  ViewController.swift
//  SwiftProgrammingLanguage
//
//  Created by admin on 2017/9/8.
//  Copyright © 2017年 alldk. All rights reserved.
//
/*lzy170908注:
 这个类，对应的是 The Swift Programming Language第二章（Language Guide）的内容：
 『字符串和字符(Strings and Characters)』、『 合类型 (Collection Types)』
 
 字符串和字符(Strings and Characters)：
 • 字符串字面量 (页 0)
 • 初始化空字符串 (页 0)
 • 字符串可变性 (页 0)
 • 字符串是值类型 (页 0)
 • 使用字符 (页 0)
 • 连接字符串和字符 (页 0)
 • 字符串插值 (页 0)
 • Unicode (页 0)
 • 计算字符数量 (页 0)
 • 访问和修改字符串 (页 0)
 • 比较字符串 (页 0)
 • 字符串的 Unicode 表示形式 (页 0)
 
 
 集合类型 (Collection Types)：
 
 • 集合的可变性 (页 0)
 • 数组 (页 0)
 • 集合 (页 0)
 • 集合操作 (页 0)
 • 字典 (页 0)
 
 
 
 */




import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*lzy170911注:
         
         
         字符串是例如 "hello, world" ， "albatross" 这样的有序的 Character (字符)类型的值的集合。通过 String 类型来表示。 一个 String 的内容可以用许多方式读取，包括作为一个 Character 值的集合。
         Swift 的 String 和 Character 类型提供了快速和兼容 Unicode 的方式供你的代码使用。创建和操作字符串的语法与 C 语言中字符串操作相似，轻量并且易读。 字符串连接操作只需要简单地通过 + 符号将两个字符串相连即可。与 Swift 中其他值一样，能否更改字符串的值，取决于其被定义为常量还是变量。你也可以在字符串内插程中使用字符串插入常量、变量、字面量表达成更长的字符串，这样可以很容易的创建自定义的字符串值，进行展示、存储以及打印。
         尽管语法简易，但 String 类型是一种快速、现代化的字符串实现。 每一个字符串都是由编码无关的 Unicode 字符组成，并支持访问字符的多种 Unicode 表示形式(representations)。
         注意:
         Swift 的 String 类型与 Foundation NSString 类进行了无缝桥接。Foundation 也可以对 String 进行扩展，暴露在 NSString 中定义的方法。 这意味着，如果你在 String 中调用这些 NSString 的方法，将不用进行 转换。
         更多关于在 Foundation 和 Cocoa 中使用 String 的信息请查看 Using Swift with Cocoa and Objective-C (Swift 3.0.1)。
         
         
         
         // MARK: 字符串字面量
         
         字符串字面量是由双引号 ( "" ) 包裹着的具有固定顺序的文本字符。
         
         您可以在您的代码中包含一段预定义的字符串值作为字符串字面量。
         
         字符串字面量可以用于为常量和变量提供初始值:
         
         let someString = "Some string literal value"
         注意 someString 常量通过字符串字面量进行初始化，Swift 会推断该常量为 String 类型。
         注意: 更多关于在字符串字面量中使用特殊字符的信息，请查看 字符串字面量的特殊字符 (页 0) 。
         
         // MARK: 初始化空字符串
         
         要创建一个空字符串作为初始值，可以将空的字符串字面量赋值给变量，也可以初始化一个新的 String 实例:
         
         // 两个字符串均为空并且等价
         
         可以通过检查其Bool类型的isEmpty 属性来判断该字符串是否为空：
         
         
         
         
         // MARK: 字符串可变性
         
         将特定的字符串赋值给一个变量，来修改变量中其中代表的数据
         赋值给一个常量，来保证字符串不会被改变
         
         在 Objective-C 和 Cocoa 中，您需要通过选择两个不同的类( NSString 和 NSMutableString )来指定字符串是 否可以被修改。
         */
        
        var emptyString = "" // 空字符串字面量
        var anotherEmptyString = String() // 初始化方法
        
        if emptyString.isEmpty {
            
            print("Nothing to see here")
        }
        
        // 打印输出："Nothing to see here"
        
        var variableString = "Horse"
        variableString += " and carriage"
        
        // variableString 现在为 "Horse and carriage"
        
        let constantString = "Highlander"
        //        constantString += " and another Highlander"// 这会报告一个编译错误 (compile-time error) - 常量字符串不可以被修改。 Left side of mutating operator isno’t mutable: ‘constantString’ is a ‘let’ constant
        
        // MARK: ====字符串是值类型====
        
        /*lzy170911注:
         
         Swift 的 String 类型 是 值类型。如果您创建了新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。
         
         任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操 作。 值类型在 结构体和枚举是值类型 (页 0) 中进行了详细描述。
         Swift 默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值。 很明显无论该值来自于哪里，都是您 独自拥有的。 您可以确信传递的字符串不会被修改，除非你自己去修改它。
         在实际编译时，Swift 编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您将字 符串作为值类型的同时可以获得极高的性能。
         
         */
        
        // MARK: ====使用字符====
        /*lzy170911:
         可以通过for-in 循环来遍历字符串中的characters 属性来获取每一个字符的值：
         for-in
         循环在 For 循环 (页 0) 中进行了详细描述。
         
         通过标明一个Character类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量：
         
         
         字符串可以通过传递一个值类型为 Character 的数组作为自变量来初始化：
         */
        for character in "Dog!?".characters {
            print(character)
        }
        
        let exclamationMark: Character = "!"
        
        let catCharacters: [Character] = ["C", "a", "t", "!", "?"]
        let catString = String(catCharacters)
        print(catString)
        
        // MARK: ====连接字符串和字符====
        /*lzy170911:
         字符串可以通过加法运算符（+）相加在一个（或称『连接』）创建一个新的字符串：
         
         通过加法赋值运算符（+=）将一个字符添加到一个已经存在的字符串变量上：
         
         使用append()方法将一个字符附加到一个字符串变量的尾部：
         
         注意：不能将一个字符串或字符添加到一个已经存在的 字符变量 上，因为字符变量只能包含一个字符。
         */
        
        let string1 = "hello"
        let string2 = " there"
        var welcome = string1 + string2
        print(welcome)
        
        var instruction = "look over"
        instruction += string2
        print(instruction)
        
        welcome.append(exclamationMark)
        print(welcome)// welcome 现在等于 "hello there!"
        
        // MARK: ====字符串插值====
        /*lzy170911:
         字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。插入的字符串字面量的每一项都在以 反斜线为前缀 的圆括号中：
         */
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        print(message)
        
        /*lzy170911注:
         在上面的例子中， multiplier 作为 \(multiplier) 被插入到一个字符串常量量中。 当创建字符串执行插值计算 时此占位符会被替换为 multiplier 实际的值。
         
         multiplier 的值也作为字符串中后面表达式的一部分。 该表达式计算 Double(multiplier) * 2.5 的值并将结果 ( 7.5 ) 插入到字符串中。 在这个例子中，表达式写为 \(Double(multiplier) * 2.5) 并包含在字符串字面量中。
         
         注意:
         插值字符串中写在括号中的表达式不能包含 非转义反斜杠 ( \ )，并且不能包含回车或换行符。不过，插值字符串可以包含其他字面量。
         */
        
        // MARK: ====Unicode====
        /*lzy170911:
         
         Unicode是一个国际标准，用于文本的编码和表示。 它使您可以用标准格式表示来自任意语言几乎所有的字 符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。 Swift 的 String 和 Character 类型是完 全兼容 Unicode 标准的。
         这一节没有代码，是概念和理论扩展，有以下主题：
         
         Unicode 标量：
         Swift 的 String 类型是基于 Unicode 标量 建立的。 Unicode 标量是对应字符或者修饰符的唯一的21位数 字
         
         字符串字面量的特殊字符：
         转义字符 \0 (空字符)、 \\ (反斜线)、 \t (水平制表符)、 \n (换行符)、 \r (回车符)、 \" (双引 号)、 \' (单引号)。
         • Unicode 标量，写成 \u{n} (u为小写)，其中 n 为任意一到八位十六进制数且可用的 Unicode 位码。
         
         
         可扩展的字形群：
         可扩展的字符群 是一个灵活的方法，用许多复杂的脚本字符表示单一的 Character 值。
         可拓展的字符群 可以使包围记号(例如 COMBINING ENCLOSING CIRCLE 或者 U+20DD )的标量包围其他 Unicode 标 量，作为一个单一的 Character 值；
         地域性指示符号的 Unicode 标量可以组合成一个单一的 Character 值
         */
        
        let eAcute: Character = "\u{E9}" // é
        let combinedEAcute: Character = "\u{65}\u{301}" // e 后面加上 ? // eAcute 是 é, combinedEAcute 是 é
        print(eAcute)
        print(combinedEAcute)
        
        // MARK: ====计算字符数量====
        /*lzy170911:
         如果想要获得一个字符串中 Character 值的数量，可以使用字符串的 characters 属性的 count 属性：
         */
        
        let unusualMenagerie = "Koala ?, Snail ?, Penguin ?, Dromedary ?"
        print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")// 40个，算了空格
        
        /*lzy170911注:
         注意在 Swift 中，使用可拓展的字符群 作为Character值来连接或改变字符串时，并不一定会更改字符串的字符数量。
         
         Swift 中的字符在一个字符串中并不一定占用相同的内存空间数量。
         
         另外需要注意的是通过Character属性返回的字符数量并不总是与包含相同字符的NSString的length 属性相同。（NSString的length属性是利用 UTF-16 表示的十六位代码单元数字，而不是 Unicode 可扩展的字符群集)
         
         */
        
        // MARK: ====访问和修改字符串====
        /*lzy170911:
         每一个 String值都有一个关联的索引(index)类型，String.Index，它对应着字符串中的每一个Character 的位置。
         
         前面提到，不同的字符可能占用不同的内存空间，所以要知道Character的确切位置，就必须从String开头遍历每一个Unicode标量直到结尾。因此，Swift的字符串不能使用（integer）做索引。
         
         使用startIndex 属性可以获取一个String 的第一个Character的索引。
         使用endIndex属性可以获取最后一个 Character 的后一个位置的索引。因此，endIndex属性不能作为一个字符串的有效下标。如果String 是空串，startIndex 和 endIndex  是相等的。
         
         通过调用 String 的 index(before:) 或 index(after:)方法，可以立即得到前面或者后面的索引。还可以通过index(_offsetBy:)来获取对应偏移量的索引。
         这种方式可以避免多次调用 index(before:) 或 index(after:) 方法。
         
         使用下面的下标语法来访问 String 特定索引的 Character。
         
         注意:
         您可以使用 startIndex 和 endIndex 属性或者 index(before:) 、 index(after:) 和 index(_:offsetB y:) 方法在任意一个确认的并遵循 Collection 协议的类型里面，如上文所示是使用在 String 中，您也可 以使用在 Array 、 Dictionary 和 Set 中。
         */
        
        let greeting = "Guten tag!"
        greeting[greeting.startIndex]
        
        greeting[greeting.index(before: greeting.endIndex)]
        
        greeting[greeting.index(after: greeting.startIndex)]
        
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        greeting[index]
        
        // 试图获取越界索引对应的 Character ，将引发一个运行时错误。
        
        //       var endIdx = greeting.endIndex
        //        print(greeting.index(after: endIdx))// fatal error: cannot increment beyond endIndex
        
        /*lzy170911注:
         使用 characters 属性的 indices(指数、索引、指标) 属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单 个字符。
         
         */
        
        for index in greeting.characters.indices {
            /*lzy170911注:
             G
             u
             t
             e
             n
             
             t
             a
             g
             !
             */
            print("\(greeting[index]) ")
            print("\(greeting[index]) ", terminator: "")
            
        }
        // 打印输出 "G u t e n T a g ! "
        
        // MARK: ====插入和删除====
        /*lzy170912:
         调用 insert(_:at:) 方法可以在一个字符串的指定索引插入一个字符，调用 insert(contentsOf:at:) 方法可以在一个字符串的指定索引插入一个段字符串。
         */
        
        welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        // welcome 变量现在等于『hello!』
        
        welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))
        // welcome 变量现在等于 "hello there!"
        
        /*lzy170912注:
         调用 remove(at:)方法可以在一个字符串的指定索引删除一个字符，调用 removeSubrange(_:)可以在一个字符串的指定索引删除一个子字符串。
         */
        
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        // welcome现在等于"hello there"
        let range = welcome.index(welcome.endIndex, offsetBy: -6) ..< welcome.endIndex
        welcome.removeSubrange(range)
        // welcome现在等于 "hello"
        
        /*lzy170912注:
         注意：
         可以使用 insert(_:at:)  insert(contentsOf:at:) remove(at:) 和 removeSubrange(_:)方法在任意一个确认的并遵循RangeReplaceableCollection 协议的类型里面，如上文所示，是使用在String中，也可以使用在Array Dictionary 和 Set中。
         
         */
        
        // MARK: 比较字符串
        /*lzy170912注:
         Swift 提供了三种方式来比较文本值:字符串字符相等、前缀相等和后缀相等。
         */
        // MARK: ====字符串/字符相等====
        /*lzy170912:
         字符串/字符可以用等于操作符( == )和不等于操作符( != )
         quotation  报价、引用、引证
         */
        
        let quotation = "We're a lot alike, you and I."
        let sameQuotation = "We're a lot alike, you and I."
        
        if quotation == sameQuotation {
            print("These two strings are considered equal")
        }// 打印输出 "These two strings are considered equal"
        
        /*lzy170912注:
         如果两个字符串(或者两个字符)的可扩展的字形群 是标准相等的，那就认为它们是相等的。在这个情况 下，即使可扩展的字形群 是有不同的 Unicode 标量构成的，只要它们有同样的语言意义和外观，就认为它们标 准相等。
         例如， LATIN SMALL LETTER E WITH ACUTE ( U+00E9 )就是标准相等于 LATIN SMALL LETTER E ( U+0065 )后面加上 C OMBINING ACUTE ACCENT ( U+0301 )。这两个字符群 都是表示字符 é 的有效方式，所以它们被认为是标准相等 的:
         */
        
        // "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
        let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
        // "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
        let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
        
        if eAcuteQuestion == combinedEAcuteQuestion {
            print("These two strings are considered equal")
        }
        // 打印输出 "These two strings are considered equal"
        
        /*lzy170912注:
         相反，英语中的 LATIN CAPITAL LETTER A ( U+0041 ，或者 A )不等于俄语中的 CYRILLIC CAPITAL LETTER A ( 0 ，或者 A )。两个字符看着是一样的，但却有不同的语言意义:
         */
        
        let latinCapitalLetterA: Character = "\u{41}"
        let cyrillicCapitalLetterA: Character = "\u{0410}"
        if latinCapitalLetterA != cyrillicCapitalLetterA {
            print("These two characters are not equivalent")
        }
        // 打印 "These two characters are not equivalent"
        // lzy170912注：注意:在 Swift 中，字符串和字符并不区分地域(not locale-sensitive)。
        
        
        // MARK: ====前缀/后缀相等====
        /*lzy170912:
         通过调用字符串的 hasPrefix(_:) / hasSuffix(_:) 方法来检查字符串是否拥有特定前缀/后缀，两个方法均接收一 个 String 类型的参数，并返回一个布尔值。
         下面的例子以一个字符串数组表示莎士比亚话剧《罗密欧与朱丽叶》中前两场的场景位置:
         */
        
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        // 您可以调用 hasPrefix(_:) 方法来计算话剧中第一幕的场景数:
        
        var act1SceneCount = 0
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1 ") {
                act1SceneCount += 1
            } }
        print("There are \(act1SceneCount) scenes in Act 1") // 打印输出 "There are 5 scenes in Act 1"
        
        // 相似地，您可以用 hasSuffix(_:) 方法来计算发生在不同地方的场景数:
        var mansionCount = 0
        var cellCount = 0
        for scene in romeoAndJuliet {
            if scene.hasSuffix("Capulet's mansion") {
                mansionCount += 1
            } else if scene.hasSuffix("Friar Lawrence's cell") {
                cellCount += 1
            }
        }
        print("\(mansionCount) mansion scenes; \(cellCount) cell scenes") // 打印输出 "6 mansion scenes; 2 cell scenes"
        /*lzy170912注:
         注意:
         hasPrefix(_:) 和 hasSuffix(_:) 方法都是在每个字符串中逐字符比较其可扩展的字符群 是否标准相等，详细
         描述在字符串/字符相等 (页 0)。
         */
        
        
        // MARK: 字符串的 Unicode 表示形式
        
        /*lzy170912注:
         UTF-8 表示:您可以通过遍历 String 的 utf8 属性来访问它的 UTF-8 表示.其为 String.UTF8View 类型的属性
         
         UTF-16 表示:您可以通过遍历 String 的 utf16 属性来访问它的 UTF-16 表示.其为 String.UTF16View 类型的属性
         
         Unicode 标量表示:
         */
        
        
        // MARK: - ------- 集合类型 (Collection Types)-------
        
        
        /*lzy170912注:
         Swift 语言提供 Arrays 、 Sets 和 Dictionaries 三种基本的 合类型用来存储 合数据。数组(Arrays)是有序
         数据的 。集合(Sets)是无序无重复数据的 。字典(Dictionaries)是无序的键值对的 。
         
         Swift 语言中的 Arrays 、 Sets 和 Dictionaries 中存储的数据值类型必须明确。这意味着我们不能把不正确的数 据类型插入其中。同时这也说明我们完全可以对取回值的类型非常自信。
         
         Swift 的 Arrays 、 Sets 和 Dictionaries 类型被实现为泛型集合。更多关于泛型类型和 合，参见 泛型章 节。
         */
        
        // MARK: 集合的可变性
        /*lzy170912:
         如果创建一个 Arrays 、 Sets 或 Dictionaries 并且把它分配成一个变量，这个 集合将会是可变的。这意味着我们 可以在创建之后添加更多或移除已存在的数据项，或者改变 合中的数据项。如果我们把 Arrays 、 Sets 或 ionaries 分配成常量，那么它就是不可变的，它的大小和内容都不能被改变。
         
         
         注意:
         在我们不需要改变 集合的时候创建不可变 集合是很好的实践。如此 Swift 编译器可以优化我们创建的集合。
         
         */
        
        // MARK: 数组(Arrays)
        /*lzy170912:
         数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。
         注意: Swift 的 Array 类型被桥接到 Foundation 中的 NSArray 类。 更多关于在 Foundation 和 Cocoa 中使用 array 的信息，参见 Using Swift with Cocoa and Obejective-C(Swift 3.0.1) 中使用 Cocoa 数据类型部分。
         */
        
        // MARK: ====数组的简单语法====
        /*lzy170912:
         
         写 Swift 数组应该遵循像 Array<Element> 这样的形式，其中 Element 是这个数组中唯一允许存在的数据类 型。我们也可以使用像 [Element] 这样的简单语法。尽管两种形式在功能上是一样的，但是推荐较短的那种，而 且在本文中都会使用这种形式来使用数组。
         
         */
        
        // MARK:  ====创建一个空数组====
        // lzy170912注：我们可以使用构造语法来创建一个由特定数据类型构成的空数组:
        
        var someInts = [Int]()
        print("someInts is of type [Int] with \(someInts.count) items.")
        // 打印 "someInts is of type [Int] with 0 items."
        
        /*lzy170912:
         通过构造函数的类型， someInts 的值类型被推断为 [Int]。
         或者，如果代码上下文中已经提供了类型信息，例如一个函数参数或者一个已经定义好类型的常量或者变量，我们可以使用空数组语句创建一个空数组，它的写法很简单: [] (一对空方括号):
         */
        
        someInts.append(3)
        // someInts 现在包含一个Int值
        someInts = []
        // someInts 现在是空数组，但是仍然是[Int]类型的
        
        // MARK:  ====创建一个带有默认值的数组====
        /*lzy170913:
         Swift 中的Array类型还提供一个可以创建特定大小并且所有数据都被默认的构造方法。
         我们可以把准备加入到新数组的数据项(count)和适当类型的初始值（repeating）传入数组构造函数：
         
         */
        var threeDoubles = Array(repeatElement(0.0, count: 3))
        // threeDoubles 是一种[Double]数组，等价于[0.0, 0.0, 0.0]
        print(threeDoubles)
        
        // MARK:  ====通过两个数组相加创建一个数组====
        /*lzy170913:
         可以通过使用加法操作符(+)来组合两种已存在的相同类型数组。新数组的数据类型会被从两个数组的数据类型中推断处来：
         
         */
        var anotherThreeDoubles = Array(repeatElement(2.5, count: 3))
        // anotherThreeDoubles 被推断为[Double] 等价与[2.5, 2.5, 2.5]
        var sixDoubles = threeDoubles + anotherThreeDoubles
        // sixDoubles 被推断为 [Double],等价于[0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
        
        // MARK:  ====用数组字面量构造数组====
        /*lzy170913:
         可以使用数组字面量来进行数组构造，这是一种用一个或者多个数值构造数组的简单方法。数组字面量是一系列由都好分割，并由方括号包好的数值：
         [value1, value 2, value 3]。
         下面这个例子创建了一个叫做 shoppingList 并且存储String的数组：
         */
        var shoppingList: [String] = ["Eggs", "Milk"]
        // 被构造并拥有两个初始项
        
        /*lzy170913注:
         shoppingList 变量被声明为 『字符串值类型的数组』，记作[String]。因为这个数组被规定只有String一种数据结构。
         所以只有String类型可以在其中被存取。
         在这里，shoppingList数组由两个String值（"Eggs", "Milk"）构造，并且由数组字面量定义。
         
         注意：
         shoppingList数组被声明为变量（var 关键字创建）而不是常量（let 创建）是因为以后可能有更多的数据项被传入其中。
         
         在这个例子中，字面量仅仅包含两个String值。匹配了该数组的变量声明（只能包含String的数组），所以这个字面量的分配过程可以作为用两个初始项来构造shoppingList的一种方式。
         由于 Swift 的类型推断机制，当我们用字面量构造只拥有相同类型值数组的时候，我们不必把数组的类型定义清 楚。 shoppingList 的构造也可以这样写:
         */
        var shoppingList2 = ["Eggs", "Milk"]
        //        因为所有数组字面量中的值都是相同的类型。Swift可以推断出[String]是shoppingList中变量的正确类型。
        
        // MARK:  ====访问和修改数组====
        /*lzy170913:
         通过数组的方法和属性来访问和修改数组，或者使用下标语法。
         */
        
        // lzy170913注：使用数组的只读属性 count 来获取数组中的数据项数量：
        print("The shopping list contains \(shoppingList.count) items.")
        // 2 items
        
        // lzy170913注：使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为0：
        if shoppingList.isEmpty {
            print("The shopping list is empty.")
        } else {
            print("The shopping list is not empty.")
        }
        // 打印 not empty
        
        // lzy170913注：使用appendd(_:)方法在数组后面添加新的数据项
        
        shoppingList.append("Flour")
        // shoppingList现在有3个数据项
        
        // lzy170913注：使用加法赋值运算符(+=)，直接在数组后面添加一个或多个拥有相同类型的数据项：
        
        shoppingList += ["Baking Powder"]
        // shopping list现在有 4项了
        
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        // shopping list现在有7项
        
        // lzy170913注：使用 下标语法 来获取数组中的数据项，把我们需要的数据项的索引值，直接放在数组名称的方括号中：
        var firstItem = shoppingList[0]
        // 第一项是 Eggs
        /*lzy170913注:
         注意：数组第一项的索引值是0而不是1，Swift中的数组的索引总是从零开始的。
         */
        
        // lzy170913注：使用 下标 来改变某个已有索引值对应的数据值：
        shoppingList[0] = "Six eggs"
        // 现在数组第一项是 "Six eggs" 而不是 Eggs了。
        
        // lzy170913注：使用 下标 一次改变一系列数据值，即使新数据和原来数据的数量是不一样的。下面的例子把 "Chocolate Spread" ， "Cheese" ，和 "Butter" 替换为 "Bananas" 和 "Apples" :
        shoppingList[4...6] = ["Bananas", "Apples"]
        // shopping list 现在已经有6项了
        
        // 不可以用下标访问的形式，在数组尾部添加新项。
        
        // lzy170913注：调用数组的 insert(_:at:)方法来在某个具体索引值之前添加数据项：
        
        /*这次 insert(_:at:) 方法调用把值为 "Maple Syrup" 的新数据项插入列表的最开始位置，并且使用 0 作为索引 值。
         */
        shoppingList.insert("Maple Syrup", at: 0)
        // shopping list 现在有 7项， 这里insert的是第一项
        
        // lzy170913注：使用 remove(at:) 方法来移除数组中的某一项。这个方法把数组在特定索引值中存储的数据项移 除并且返回这个被移除的数据项(我们不需要的时候就可以无视它):
        
        let mapleSyrup = shoppingList.remove(at: 0)
        // 索引值为0的数据项被移除
        // shoppingList 现在只有6项，而且不包括 Maple Syrup
        // mapleSyrup 常量的值等于被移除数据项的值 "Maple Syrup"
        /*注意: 如果我们试着对索引越界的数据进行检索或者设置新值的操作，会引发一个运行期错误。
         我们可以使用索引值和 数组的 count 属性进行比较来在使用某个索引之前先检验是否有效。
         除了当 count 等于 0 时(说明这是个空数 组)，最大索引值一直是 count - 1 ，因为数组都是零起索引。
         */
        
        //        数据项被移除后数组中的空出项会被自动填补，所以现在索引值为 0 的数据项的值再次等于 "Six eggs" :
        firstItem = shoppingList[0]
        // firstItem 现在等于 "Six eggs"
        
        //        如果我们只想把数组中的最后一项移除，可以使用 removeLast() 方法而不是 remove(at:) 方法来避免我们需要获 取数组的 count 属性。就像后者一样，前者也会返回被移除的数据项:
        let apples = shoppingList.removeLast()
        // 数组的最后一项被移除了
        // shoppingList 现在只有5项，不包括 Apples // apples 常量的值现在等于 "Apples" 字符串
        
        // MARK:  ====数组的遍历====
        /*lzy170913:
         使用for-in循环来遍历所有数组中的数据项:
         */
        
        for item in shoppingList {
            print(item)
        }
        
        /*lzy170913注:
         如果我们同时需要每个数据项的值和索引值，可以使用 enumerated() 方法来进行数组遍历。 enumerated() 返回 一个由每一个数据项索引值和数据值组成的元组。我们可以把这个元组分解成临时常量或者变量来进行遍历:
         更多关于 for-in 循环的介绍请参见for 循环 (页 0)。
         */
        
        for (index, value) in shoppingList.enumerated() {
            print("Item \(String(index + 1)):\(value)")
        }
        
        // MARK: 集合(Sets)
        
        /*lzy170913注:
         集合(Set)用来存储 相同类型 并且 没有确定顺序的值。当 集合元素顺序不重要时或者希望确保每个元素只出现一次 时可以使用 集合而不是数组。
         
         注意:
         Swift的 Set 类型被桥接到 Foundation 中的 NSSet 类。
         关于使用 Foundation 和 Cocoa 中 Set 的知识，参见 Using Swift with Cocoa and Obejective-C(Swift 3.0.1) 中使用 Cocoa 数据类型部分。
         
         集合类型的哈希值 一个类型为了存储在 集合中，该类型必须是可哈希化的————也就是说，该类型必须提供一个方法来计算它的哈希 值。一个哈希值是 Int 类型的，相等的对象哈希值必须相同，比如 a==b ,因此必须 a.hashValue == b.hashValue。
         
         Swift 的所有基本类型(比如 String , Int , Double 和 Bool )默认都是可哈希化的，可以作为 集合的值的类型或者字典的键的类型。没有关联值的枚举成员值(在枚举有讲述)默认也是可哈希化的。
         注意: 你可以使用你自定义的类型作为 集合的值的类型或者是字典的键的类型，但你需要使你的自定义类型符合 Swift 标准库中的 Hashable 协议。符合 Hashable 协议的类型需要提供一个类型为 Int 的可读属性 hashValue 。由类型的 hashValue 属性返回的值不需要在同一程序的不同执行周期或者不同程序之间保持相同。
         
         因为 Hashable 协议符合 Equatable 协议，所以遵循该协议的类型也必须提供一个"是否相等"运算符( == )的实现。这个 Equatable 协议要求任何符合 == 实现的实例间都是一种相等的关系。也就是说，对于 a,b,c 三个值来 说， == 的实现必须满足下面三种情况:
         • a == a (自反性)
         • a == b 意味着 b == a (对称性)
         • a == b && b == c 意味着 a == c (传递性)
         关于遵循协议的更多信息，请看协议
         */
        
        // MARK:  ====集合类型语法====
        /*lzy170913:
         Swift 中的 Set类型被写为 Set<Element>，这里的Element表示Set中允许存储的类型。
         和数组不同，集合没有等价的简化形式。
         */
        
        // MARK:  ====创建和构造一个空的集合====
        /*lzy170913:
         通过构造器语法 创建一个特定类型的空集合：
         */
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.")
        // 0 items
        
        
        /*lzy170913注:
         通过构造器，这里的letters 变量的类型被推断为 Set<Character>。
         如果上下文提供了类型信息，比如作为函数的参数或者已知类型的变量或常量，我们可以通过一个空的数组字面量创建一个空的 Set :
         */
        letters.insert("a")
        // 含有了一个 Character类型的值
        letters = []
        // 现在变为了一个空的Set，但是它仍然是Set<Character>类型
        
        // MARK:  ====用数组字面量创建集合====
        /*lzy170913:
         
         用数组字面量创建集合
         你可以使用数组字面量来构造集合，并且可以使用简化形式写一个或者多个值作为集合元素。
         下面的例子创建一个称之为 favoriteGenres 的 集合来存储 String 类型的值:
         */
        var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"] // favoriteGenres 被构造成含有三个初始值的集合
        /*
         
         这个 favoriteGenres 变量被声明为“一个 String 值的 集合”，写为 Set<String> 。由于这个特定的 集合含有指 定 String 类型的值，所以它只允许存储 String 类型值。这里的 favoriteGenres 变量有三个 String 类型的初始 值( "Rock" ， "Classical" 和 "Hip hop" )，并以数组字面量的方式出现。
         注意:
         favoriteGenres 被声明为一个变量(拥有 var 标示符)而不是一个常量(拥有 let 标示符),因为它里面的元素将
         会在下面的例子中被增加或者移除。
         
         一个 Set 类型不能从数组字面量中被单独推断出来，因此 Set 类型必须显式声明。
         
         然而，由于 Swift 的类型推断功能，如果你想使用一个数组字面量构造一个 Set 并且该数组字面量中的所有元素类型相同，那么你无须写出Set 的具体类型。
         
         favoriteGenres 的构造形式可以采用简化的方式代替:
         由于数组字面量中的所有元素类型相同，Swift 可以推断出 Set<String> 作为 favoriteGenres 变量的正确类型。
         */
        var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]
        
        // MARK:  ====访问和修改一个集合====
        /*lzy170913:
         你可以通过 Set 的属性和方法来访问和修改一个 Set 。
         为了找出一个 Set 中元素的数量，可以使用其只读属性 count :
         
         */
        
        print("I have \(favoriteGenres.count) favorite music genres.") // 打印 "I have 3 favorite music genres."
        
        // 使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为 0 :
        
        if favoriteGenres.isEmpty {
            print("As far as music goes, I'm not picky.")
        } else {
            print("I have particular music preferences.")
        }
        // 打印 "I have particular music preferences."
        
        
        // 你可以通过调用 Set 的 insert(_:) 方法来添加一个新元素:
        
        favoriteGenres.insert("Jazz")         // favoriteGenres 现在包含4个元素
        
        /*
         你可以通过调用 Set 的 remove(_:) 方法去删除一个元素，如果该值是该 Set 的一个元素则删除该元素并且返回 被删除的元素值，否则如果该 Set 不包含该值，则返回 nil 。
         另外， Set 中的所有元素可以通过它的 removeAll() 方法删除。
         */
        if let removedGenre = favoriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it.")
        } else {
            print("I never much cared for that.")
        }
        // 打印 "Rock? I'm over it."
        
        // 使用 contains(_:) 方法去检查 Set 中是否包含一个特定的值:
        if favoriteGenres.contains("Funk") {
            print("I get up on the good foot.")
        } else {
            print("It's too funky in here.")
        }
        // 打印 "It's too funky in here."
        
        // 遍历一个集合 : 你可以在一个 for-in 循环中遍历一个 Set 中的所有值。
        
        for genre in favoriteGenres {
            print("\(genre)")
        }
        // Classical
        // Jazz
        // Hip hop
        /*
         Swift 的 Set 类型没有确定的顺序，为了按照特定顺序来遍历一个 Set 中的值可以使用 sorted() 方法，它将返
         回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定.
         
         */
        for genre in favoriteGenres.sorted() {
            print("(genre)")
        }
        // prints "Classical"
        // prints "Hip hop"
        // prints "Jazz
        
        /*
         集合操作.jpg
         
         你可以高效地完成 Set 的一些基本操作，比如把两个 集合组合到一起，判断两个 集合共有元素，或者判断两个集合是否全包含，部分包含或者不相交。
         基本集合操作
         下面的插图描述了两个 集合- a 和 b -以及通过阴影部分的区域显示 集合各种操作的结果。
         • 使用 intersection(_:) 方法根据两个 集合中都包含的值创建的一个新的 集合。 // lzy170913注：交集
         • 使用 symmetricDifference(_:) 方法根据在一个集合中但不在两个集合中的值创建一个新的 集合。// lzy170913注：差集：相对的补集
         
         • 使用 union(_:) 方法根据两个集合的值创建一个新的集合。// lzy170913注：合集
         • 使用 subtracting(_:) 方法根据不在该集合中的值创建一个新的集合。// 补集
         
         */
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
        oddDigits.union(evenDigits).sorted()
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        oddDigits.intersection(evenDigits).sorted()
        // []
        oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
        // [1, 9]
        oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
        // [1, 2, 9]
        
        /*
         集合成员关系和相等.jpg
         下面的插图描述了三个集合- a , b 和 c ,以及通过重叠区域表述集合间共享的元素。集合 a 是 集合 b 的父集合，因为 a 包含了 b 中所有的元素，相反的，集合 b 是 集合 a 的子集合，因为属于 b 的元素也被 a 包含。
         集合b 和集合 c 彼此不关联，因为它们之间没有共同的元素。
         • 使用“是否相等”运算符( == )来判断两个集合是否包含全部相同的值。
         • 使用 isSubset(of:) 方法来判断一个集合中的值是否也被包含在另外一个集合中。
         • 使用 isSuperset(of:) 方法来判断一个集合中包含另一个集合中所有的值。
         • 使用 isStrictSubset(of:) 或者 isStrictSuperset(of:) 方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
         • 使用 isDisjoint(with:) 方法来判断两个集合是否不含有相同的值(是否没有交集)。
         
         
         */
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]
        houseAnimals.isSubset(of: farmAnimals)
        // true
        farmAnimals.isSuperset(of: houseAnimals)
        // true
        farmAnimals.isDisjoint(with: cityAnimals)
        // true
        
        // MARK: 字典
        
        /*lzy170914注:
         
         字典是一种存储多个相同类型的值的容器。每个值(value)都关联唯一的键(key)，键作为字典中的这个值数据的标识符。和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符(键)访问数据 的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。
         
         注意:
         Swift 的 Dictionary 类型被桥接到 Foundation 的 NSDictionary 类。
         更多关于在 Foundation 和 Cocoa 中使用 Dictionary 类型的信息，参见 Using Swift with Cocoa and Obejecti ve-C(Swift 3.0.1) 中使用 Cocoa 数据类型部分。
         */
        
        // MARK:  ====字典类型简化语法====
        /*lzy170914:
         Swift 字典使用Dictionary<Key, Value>定义，其中 Key是字典中键的数据类型，Value是字典中对应于这些键所存储值的数据类型。
         
         注意:
         一个字典的 Key 类型必须遵循 Hashable 协议，就像 Set 的值类型。
         
         我们也可以用 [Key: Value] 这样简化的形式去创建一个字典类型。虽然这两种形式功能上相同，但是后者是首 选，并且这本指导书涉及到字典类型时通篇采用后者。
         */
        
        //        创建一个空字典我们可以像数组一样使用构造语法创建一个拥有确定类型的空字典:
        
        var namesOfIntegers = [Int : String]()
        // namesOfIntegers 是一个空的 [Int: String] 字典
        
        /*lzy170914注:
         这个例子创建了一个 [Int: String] 类型的空字典来储存整数的英语命名。它的键是 Int 型，值是 String 型。
         如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作 [:] (中括号中放一个冒号):
         */
        
        namesOfIntegers[16] = "sixteen"
        // namesOfIntegers 现在包含一个键值对
        namesOfIntegers = [:]
        // namesOfIntegers 又成为了一个 [Int: String] 类型的空字典
        
        
        // MARK: == 用字典字面量创建字典
        
        /*lzy170914注:
         我们可以使用字典字面量来构造字典，这和我们刚才介绍过的数组字面量拥有相似语法。
         字典字面量是一种将一个或多个键值对写作 Dictionary  集合的快捷途径。
         一个键值对是一个 key 和一个 value 的结合体。在字典字面量中，每一个键值对的键和值都由冒号分割。这些键值对构成一个列表，其中这些键值对由方括号包含、由逗号分割:
         [key 1: value 1, key 2: value 2, key 3: value 3]
         下面的例子创建了一个存储国际机场名称的字典。在这个字典中键是三个字母的国际航空运输相关代码，值是机
         场名称:
         
         */
        var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        //        airports 字典被声明为一种 [String: String] 类型，这意味着这个字典的键和值都是 String 类型。
        
        /*
         
         注意:
         airports 字典被声明为变量(用 var 关键字)而不是常量( let 关键字)因为后来更多的机场信息会被添加到
         这个示例字典中。
         airports 字典使用字典字面量初始化，包含两个键值对。第一对的键是 YYZ ，值是 Toronto Pearson 。第二对的 键是 DUB ，值是 Dublin 。
         这个字典语句包含了两个 String: String 类型的键值对。它们对应 airports 变量声明的类型(一个只有 键和 String 值的字典)所以这个字典字面量的任务是构造拥有两个初始数据项的 airport 字典。
         和数组一样，我们在用字典字面量构造字典时，如果它的键和值都有各自一致的类型，那么就不必写出字典的类型。 airports 字典也可以用这种简短方式定义:
         */
        
        airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        
        
        /*
         因为这个语句中所有的键和值都各自拥有相同的数据类型，Swift 可以推断出 Dictionary<String, String> 是 airports 字典的正确类型。
         */
        // MARK:  ====访问和修改字典====
        /*lzy170914:
         我们可以通过字典的方法和属性来访问和修改字典，或者通过使用下标语法。 和数组一样，我们可以通过字典的只读属性 count 来获取某个字典的数据项数量:
         */
        print("The dictionary of airports contains (airports.count) items.")
        // 打印 "The dictionary of airports contains 2 items."(这个字典有两个数据项)
        
        //          使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为 0 :
        
        if airports.isEmpty {
            print("The airports dictionary is empty.")
        } else {
            print("The airports dictionary is not empty.")
        }
        // 打印 "The airports dictionary is not empty."
        
        //          我们也可以在字典中使用下标语法来添加新的数据项。可以使用一个恰当类型的键作为下标索引，并且分配恰当类型的新值:
        airports["LHR"] = "London"
        // airports 字典现在有三个数据项
        
        // 我们也可以使用下标语法来改变特定键对应的值:
        airports["LHR"] = "London Heathrow"
        // "LHR"对应的值 被改为 "London Heathrow
        
        
        /*
         作为另一种下标方法，字典的 updateValue(_:forKey:) 方法可以设置或者更新特定键对应的值。
         就像上面所示的下标示例， updateValue(_:forKey:) 方法在这个键不存在对应值的时候会设置新值或者在存在时更新已存在的 值。
         
         和上面的下标方法不同的， updateValue(_:forKey:) 这个方法返回更新值之前的原值。
         这样使得我们可以检查更新是否成功。
         updateValue(_:forKey:) 方法会返回对应值的类型的可选值。举例来说:对于存储 String 值的字典，这个函数会 返回一个 String? 或者“可选 String ”类型的值。
         
         如果有值存在于更新前，则这个可选值包含了旧值，否则它将会是 nil 。
         */
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
        }
        // 输出 "The old value for DUB was Dublin."
        
        /*
         我们也可以使用下标语法来在字典中检索特定键对应的值。因为有可能请求的键没有对应的值存在，字典的下标 访问会返回对应值的类型的可选值。如果这个字典包含请求键所对应的值，下标会返回一个包含这个存在值的可选值，否则将返回 nil :
         
         */
        // TODO:        if let airportName = airports["DUB"] {
        
        if airports["DUB"] != nil {
            print("The name of the airport is (airportName).")
        } else {
            print("That airport is not in the airports dictionary.")
        }
        // 打印 "The name of the airport is Dublin Airport."
        
        /*
         我们还可以使用下标语法来通过给某个键的对应值赋值为 nil 来从字典里移除一个键值对:
         */
        airports["APL"] = "Apple Internation"
        // "Apple Internation" 不是真的 APL 机场, 删除它
        airports["APL"] = nil
        // APL 现在被移除了
        
        
        /*
         此外， removeValue(forKey:) 方法也可以用来在字典中移除键值对。这个方法在键值对存在的情况下会移除该键 值对并且返回被移除的值或者在没有值的情况下返回 nil :
         
         */
        // TODO:let removedValue = airports.removeValue(forKey: "DUB")
        if airports.removeValue(forKey: "DUB") != nil {
            print("The removed airport's name is (removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        // prints "The removed airport's name is Dublin Airport."
        
        // MARK:  ====字典遍历====
        /*lzy170914:
         我们可以使用 for-in 循环来遍历某个字典中的键值对。每一个字典中的数据项都以 (key, value) 元组形式返回，并且我们可以使用临时常量或者变量来分解这些元组:
         */
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        
        //        通过访问keys或者 values属性，我们也可以遍历字典的键或者值:
        
        for airportCode in airports.keys {
            print("Airport code: \(airportCode).")
        }
        // Airport code: YYZ
        // Airport code: LHR
        
        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        // Airport name: Toronto Pearson
        // Airport name: London Heathrow
        
        /*
         
         如果我们只是需要使用某个字典的键集合或者值集合来作为某个接受Array实例的 API 的参数，可以直接使用 keys 或者 values  属性构造一个新数组:
         */
        
        let airportCodes = [String](airports.keys)
        // airportCodes 是 ["YYZ", "LHR"]
        let airportNames = [String](airports.values)
        // airportNames 是 ["Toronto Pearson", "London Heathrow"]
    }
    
}

