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
        
        // MARK: - 比较字符串
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
        
        
        // MARK: - 字符串的 Unicode 表示形式
        
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
        
        // MARK: 集合的可变性====
        /*lzy170912:
         如果创建一个 Arrays 、 Sets 或 Dictionaries 并且把它分配成一个变量，这个 集合将会是可变的。这意味着我们 可以在创建之后添加更多或移除已存在的数据项，或者改变 合中的数据项。如果我们把 Arrays 、 Sets 或 ionaries 分配成常量，那么它就是不可变的，它的大小和内容都不能被改变。
         
         
         注意:
         在我们不需要改变 集合的时候创建不可变 集合是很好的实践。如此 Swift 编译器可以优化我们创建的集合。

         */
        
        // MARK: 数组(Arrays)====
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
         通过构造函数的类型， someInts 的值类型被推断为 [Int]
         */
    }
    
}
