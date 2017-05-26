//
//  ViewController3.m
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController3.h"
#import <objc/runtime.h>
@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
     /* lzy注170526：
      http://www.jianshu.com/p/86af4e1d920f
      1.@selector原理介绍
      
      SEL 类成员方法的指针
      
      可以理解 @selector()就是取类方法的编号,他的行为基本可以等同C语言的函数指针,只不过C语言中，可以把函数名直接赋给一个函数指针，而Objective-C的类不能直接应用函数指针，这样只能做一个@selector语法来取.
      
      它的结果是一个SEL类型。这个类型本质是类方法的编号(函数地址)
      
      2.使用@selector方法地址作为分类属性标识符
      */
    
    NSString *s = @"a";
    
    NSLog(@"%@", s.propertyList);
}

@end

 /* lzy注170526：
  _cmd 打印的是当前方法名NSLog(@"%@", NSStringFromSelector(_cmd));
  
  不能“使用方法_cmd作为分类属性标识符”，_cmd是执行环节所在的方法名，setter 和getter是不同的方法名，导致key不同，这样是“关联”的objc_getAssociated 和objc_setAssociated是无法对应的
  */
@implementation NSObject(CategoryWithProperty)
- (NSObject *)property{
    
    return objc_getAssociatedObject(self, @"CategoryWithProperty");
}

- (void)setProperty:(NSObject *)property{
    

    objc_setAssociatedObject(self, @"CategoryWithProperty", property, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
