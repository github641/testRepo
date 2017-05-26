//
//  UIButton+Action.h
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
/*
 二.objc/runtime.h使用
 在这里我们主要举个简单的栗子��，通过新建一个UIButton的类别。
 1.导入头文件
 #import <objc/runtime.h>
 2.新建一个Action的Category；
 然后在.h中添加一个事件的Block，代码如下：
 */

#import <UIKit/UIKit.h>
typedef void (^ActionBlock)(UIButton *button);
@interface UIButton (Action)
@property (nonatomic, copy) ActionBlock actionBlock;

+ (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ActionBlock)actionBlock;
@end
