//
//  ViewController5.m
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
//
//  YSAssociated.h
//  RuntimeSkill
//
//  Created by ys on 2016/5/11.
//  Copyright © 2016年 ys. All rights reserved.
 /* lzy注170526：
  key作者使用了 setter中使用_cmd、getter中使用"@selector(propertyName)"，两者等价
  */

#import <objc/runtime.h>
// 添加id类型属性
#define ASSOCIATED(propertyName, setter, type, objc_AssociationPolicy)\
- (type)propertyName {\
return objc_getAssociatedObject(self, _cmd);\
}\
\
- (void)setter:(type)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), object, objc_AssociationPolicy);\
}

// 添加BOOL类型属性
#define ASSOCIATED_BOOL(propertyName, setter)\
- (BOOL)propertyName {\
NSNumber *value = objc_getAssociatedObject(self, _cmd); return value.boolValue;\
}\
\
- (void)setter:(BOOL)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

// 添加NSInteger类型属性
#define ASSOCIATED_NSInteger(propertyName, setter)\
- (NSInteger)propertyName {\
NSNumber *value = objc_getAssociatedObject(self, _cmd); return value.integerValue;\
}\
\
- (void)setter:(NSInteger)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

// 添加float类型属性
#define ASSOCIATED_float(propertyName, setter)\
- (float)propertyName {\
NSNumber *value = objc_getAssociatedObject(self, _cmd); return value.floatValue;\
}\
\
- (void)setter:(float)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

// 添加double类型属性
#define ASSOCIATED_double(propertyName, setter)\
- (double)propertyName {\
NSNumber *value = objc_getAssociatedObject(self, _cmd); return value.doubleValue;\
}\
\
- (void)setter:(double)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

// 添加long long类型属性
#define ASSOCIATED_longlong(propertyName, setter)\
- (long long)propertyName {\
NSNumber *value = objc_getAssociatedObject(self, _cmd); return value.longLongValue;\
}\
\
- (void)setter:(long long)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
     /* lzy注170526：
      http://www.jianshu.com/p/48220940118f
      
      我们创建一个分类，并在分类中声明一个实例变量
      
      你会发现报错了，系统告诉你在分类中不能添加实例变量，也就是说，Person类的结构体中的实例变量链表(ivars)不可扩展，Objective-C不支持往已存在的类中添加实例变量，因此不管是系统库提供的提供的类，还是我们自定义的类，都无法动态添加成员变量。有人说我这是扯淡，系统明明有class_addIvar这个方法啊！
      
      class_addIvar这个方法的用处是：我们通过运行时来创建一个类时，我们才可以使用class_addIvar函数添加实例变量。但是这个方法也只能在objc_allocateClassPair函数与objc_registerClassPair之间调用。另外，这个类也不能是元类。
      
      现在我们知道分类中添加实例变量是不可能的了。
      
      实现setter和getter方法，虽然ivars链表不能扩展，但是methodLists可以啊。但是之前正常类的setter和getter都是结合实例变量实现的，现在该怎么办呢？
      
      -(NSString *)name {
      return objc_getAssociatedObject(self, @"name");
      }
      
      -(void)setName:(NSString *)name {
      objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
      }
      
      完美解决，但是这样的属性不会生成实例变量，不要总是妄想用_name取到对应实例变量，它只是有对应的setter和getter方法而已。
      
      根据我上面的使用方法，你应该能够更加快速稳定的为扩展类添加属性了（提供一种思路：很多时候，不要只局限于你理解中的对象，你可以给系统类添加Block类型属性，把代码块作为参数进行操作），但是在有些情况下，我们并不需要如此复杂的添加一个属性，临时链接一下就可以，因为我发现这样的死心眼还挺多。理解原理，理性封装之后你用起来是不是更放得开手脚了.
      
      */
}


@end

@implementation NSObject(AssociationTest)

ASSOCIATED(name, setName, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)
ASSOCIATED(delegate, setDelegate, id, OBJC_ASSOCIATION_ASSIGN)
ASSOCIATED_BOOL(isOK, setIsOK)

@end
