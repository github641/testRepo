//
//  ViewController4.swift
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
//

import Foundation
 /* lzy注170526：
 
 http://www.jianshu.com/p/3030fc787648
 
 http://www.jianshu.com/p/b67badd56334
 由于swift中的extension不可以扩展存储属性。于是看到了这两个方法。
 
 这两个函数都有associate，意思就是关联。
 
 public func objc_setAssociatedObject(object: AnyObject!, _ key: UnsafePointer, _ value: AnyObject!, _ policy: objc_AssociationPolicy)
 public func objc_getAssociatedObject(object: AnyObject!, _ key: UnsafePointer) -> AnyObject!
 
 objc_getAssociatedObject就可以利用key找到关联到object上的那个对象。
 
 这里当把object和value关联起来以后，这个value就相当于object的一个属性一样的存在。
 
 */

//public func objc_setAssociatedObject(object:AnyObject!, _ key:UnsafaPointer, _ value: AnyObject!, _ policy: objc_AssociationPolicy)


//public func objc_getAssociatedObject(object: AnyObject!, _ key: UnsafePointer) -> AnyObject!


//private struct AssociatedKeys {
//    
//    static var itemName = "itemName"
//}
//
//extension MKAnnotation {
//    
//    var itemName: String! {
//        
//        get {
//            
//            guard let str = objc_getAssociatedObject(self, &AssociatedKeys.itemName) as ? String else {
//                return nil
//            }
//            
//            return str
//        }
//        
//        
//        set {
//            
//            objc_setAssociatedObject(self, &AssociatedKeys.itemName, String(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//        
//        
//        
//    }
//    
//}
