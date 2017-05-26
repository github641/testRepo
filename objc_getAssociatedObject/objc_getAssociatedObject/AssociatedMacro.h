//  YSAssociated.h
//  RuntimeSkill
//
//  Created by ys on 2016/5/11.
//  Copyright © 2016年 ys. All rights reserved.
/* lzy注170526：
 key作者使用了 setter中使用_cmd、getter中使用"@selector(propertyName)"，两者等价。
 使用，创建分类
 在分类.h中正常写属性：@property (nonatomic, copy) NSString *name;
 在.m中使用对应的宏：ASSOCIATED(name, setName, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)
 */

#import <objc/runtime.h>
// 添加id类型属性
#define Associated(propertyName, setter, type, objc_AssociationPolicy)\
- (type)propertyName {\
return objc_getAssociatedObject(self, _cmd);\
}\
\
- (void)setter:(type)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), object, objc_AssociationPolicy);\
}
// 依旧是 添加id类型属性，支持传入自定义的key
#define AssociatedKey(propertyName, setter, key, type, objc_AssociationPolicy)\
- (type)propertyName {\
return objc_getAssociatedObject(self, key);\
}\
\
- (void)setter:(type)object\
{\
objc_setAssociatedObject(self, key, object, objc_AssociationPolicy);\
}

// 添加BOOL类型属性
#define Associated_BOOL(propertyName, setter)\
- (BOOL)propertyName {\
NSNumber *value = objc_getAssociatedObject(self, _cmd); return value.boolValue;\
}\
\
- (void)setter:(BOOL)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

// 添加NSInteger类型属性
#define Associated_NSInteger(propertyName, setter)\
- (NSInteger)propertyName {\
NSNumber *value = objc_getAssociatedObject(self, _cmd); return value.integerValue;\
}\
\
- (void)setter:(NSInteger)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

// 添加float类型属性
#define Associated_float(propertyName, setter)\
- (float)propertyName {\
NSNumber *value = objc_getAssociatedObject(self, _cmd); return value.floatValue;\
}\
\
- (void)setter:(float)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

// 添加double类型属性
#define Associated_double(propertyName, setter)\
- (double)propertyName {\
NSNumber *value = objc_getAssociatedObject(self, _cmd); return value.doubleValue;\
}\
\
- (void)setter:(double)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

// 添加long long类型属性
#define Associated_longlong(propertyName, setter)\
- (long long)propertyName {\
NSNumber *value = objc_getAssociatedObject(self, _cmd); return value.longLongValue;\
}\
\
- (void)setter:(long long)object\
{\
objc_setAssociatedObject(self, @selector(propertyName), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}
