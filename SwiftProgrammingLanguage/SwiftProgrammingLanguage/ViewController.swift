//
//  ViewController.swift
//  SwiftProgrammingLanguage
//
//  Created by admin on 2017/9/8.
//  Copyright © 2017年 alldk. All rights reserved.
//
/*lzy170908注:
 这个类，对应的是 The Swift Programming Language第三章 字符串和字符(Strings and Characters)的内容
 
 字符串是例如 "hello, world" ， "albatross" 这样的有序的 Character (字符)类型的值的集合。通过 String 类型来表示。 一个 String 的内容可以用许多方式读取，包括作为一个 Character 值的集合。
 Swift 的 String 和 Character 类型提供了快速和兼容 Unicode 的方式供你的代码使用。创建和操作字符串的语法与 C 语言中字符串操作相似，轻量并且易读。 字符串连接操作只需要简单地通过 + 符号将两个字符串相连即可。与 Swift 中其他值一样，能否更改字符串的值，取决于其被定义为常量还是变量。你也可以在字符串内插程中使用字符串插入常量、变量、字面量表达成更长的字符串，这样可以很容易的创建自定义的字符串值，进行展示、存储以及打印。
 尽管语法简易，但 String 类型是一种快速、现代化的字符串实现。 每一个字符串都是由编码无关的 Unicode 字符组成，并支持访问字符的多种 Unicode 表示形式(representations)。
 注意:
 Swift 的 String 类型与 Foundation NSString 类进行了无缝桥接。Foundation 也可以对 String 进行扩展，暴露在 NSString 中定义的方法。 这意味着，如果你在 String 中调用这些 NSString 的方法，将不用进行 转换。
 更多关于在 Foundation 和 Cocoa 中使用 String 的信息请查看 Using Swift with Cocoa and Objective-C (Swift 3.0.1)。

 
 */




import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*lzy170911注:
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
        
        // MARK: - ====字符串是值类型====

        /*lzy170911注:
         
         Swift 的 String 类型 是 值类型。如果您创建了新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。
         
         任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操 作。 值类型在 结构体和枚举是值类型 (页 0) 中进行了详细描述。
         Swift 默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值。 很明显无论该值来自于哪里，都是您 独自拥有的。 您可以确信传递的字符串不会被修改，除非你自己去修改它。
         在实际编译时，Swift 编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您将字 符串作为值类型的同时可以获得极高的性能。
         
         */
        
        // MARK: - ====使用字符====
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
        
        // MARK: - ====连接字符串和字符====
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
        
        // MARK: - ====字符串插值====
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
        
        // MARK: - ====Unicode====
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
        
        // MARK: - ====计算字符数量====
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

        // MARK: - ====访问和修改字符串====
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
        
    }
    
}
