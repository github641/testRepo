//
//  ViewController.swift
//  SwiftProgrammingLanguage
//
//  Created by admin on 2017/10/17.
//  Copyright © 2017年 alldk. All rights reserved.
//
/*lzy171016注:
 这个类，对应的是 The Swift Programming Language第二章（Language Guide）的内容：
 嵌套类型（Nested Types）
 
 1.0 翻译：Lin-H 校对：shinyzhu
 
 2.0 翻译+校对：SergioChan
 
 2.1 校对：shanks，2015-11-01
 
 2.2 翻译+校对：SketchK 2016-05-16
 3.0.1，shanks，2016-11-13
 本页包含内容：
 
 嵌套类型实践
 引用嵌套类型
 
 枚举常被用于为特定类或结构体实现某些功能。类似的，枚举可以方便的定义工具类或结构体，从而为某个复杂的类型所使用。为了实现这种功能，Swift 允许你定义嵌套类型，可以在支持的类型中定义嵌套的枚举、类和结构体。
 
 要在一个类型中嵌套另一个类型，将嵌套类型的定义写在其外部类型的{}内，而且可以根据需要定义多级嵌套。
 */
import UIKit

class NestedTypes: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
// MARK: - 嵌套类型实践
        /*lzy171017注:
         下面这个例子定义了一个结构体BlackjackCard（二十一点），用来模拟BlackjackCard中的扑克牌点数。BlackjackCard结构体包含两个嵌套定义的枚举类型Suit和Rank。
         
         在BlackjackCard中，Ace牌可以表示1或者11，Ace牌的这一特征通过一个嵌套在Rank枚举中的结构体Values来表示：
         */
        struct BlackjackCard {
            // 嵌套的 Suit枚举:花色
            enum Suit: Character {
                case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
            }
            
            // 嵌套的Rank 枚举
            enum Rank: Int {
                case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
                case Jack, Queue, King, Ace
                
                struct Values {
                    let first: Int, second: Int?
                }
                
                var values: Values {
                    switch self {
                    case .Ace:
                        return Values(first:1, second: 11)
                    case .Jack, .Queue, .King:
                        return Values(first:10, second: nil)
                    default:
                        return Values(first: self.rawValue, second: nil)
                    }
                }
            }
            
            
            // BlackjackCard 的属性和方法
            let rank: Rank, suit: Suit
            var description: String {
                var output = "suit is \(suit.rawValue),"
                output += " value is \(rank.values.first)"
                if let second = rank.values.second {
                    output += " or \(second)"
                }
                return output
            }
            
        }
        
        
        /*
         Suit枚举用来描述扑克牌的四种花色，并用一个Character类型的原始值表示花色符号。
         
         Rank枚举用来描述扑克牌从Ace~10，以及J、Q、K，这13种牌，并用一个Int类型的原始值表示牌的面值。（这个Int类型的原始值未用于Ace、J、Q、K这4种牌。）
         
         如上所述，Rank枚举在内部定义了一个嵌套结构体Values。结构体Values中定义了两个属性，用于反映只有Ace有两个数值，其余牌都只有一个数值：
         
         first的类型为Int
         second的类型为Int?，或者说“可选 Int”
         Rank还定义了一个计算型属性values，它将会返回一个Values结构体的实例。这个计算型属性会根据牌的面值，用适当的数值去初始化Values实例。对于J、Q、K、Ace这四种牌，会使用特殊数值。对于数字面值的牌，使用枚举实例的原始值。
         
         BlackjackCard结构体拥有两个属性——rank与suit。它也同样定义了一个计算型属性description，description属性用rank和suit中的内容来构建对扑克牌名字和数值的描述。该属性使用可选绑定来检查可选类型second是否有值，若有值，则在原有的描述中增加对second的描述。
         
         因为BlackjackCard是一个没有自定义构造器的结构体，在结构体的逐一成员构造器中可知，结构体有默认的成员构造器，所以你可以用默认的构造器去初始化新常量theAceOfSpades：
         
         */
        let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
        print("theAceOfSpades: \(theAceOfSpades.description)")
        // 打印 “theAceOfSpades: suit is ♠, value is 1 or 11”
        /*
         尽管Rank和Suit嵌套在BlackjackCard中，但它们的类型仍可从上下文中推断出来，所以在初始化实例时能够单独通过成员名称（.Ace和.Spades）引用枚举实例。在上面的例子中，description属性正确地反映了黑桃A牌具有1和11两个值。
         
         
         */
        // MARK: - 引用嵌套类型
        /*
         在外部引用嵌套类型时，在嵌套类型的类型名前加上其外部类型的类型名作为前缀：
         lzy注：这是在使用Hearts，是在BlackjackCard外边，需要前缀
        */
        let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue
        // 红心符号为 “♡”
        /*
         对于上面这个例子，这样可以使Suit、Rank和Values的名字尽可能的短，因为它们的名字可以由定义它们的上下文来限定。
         

         */
    }

}
