//
//  UIButton+Action.m
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "UIButton+Action.h"
#import <objc/runtime.h>
 /* lzy注170526：
  
  objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
  id object                     :表示关联者，是一个对象，变量名理所当然也是object
  const void *key               :获取被关联者的索引key
  id value                      :被关联者，这里是一个block
  objc_AssociationPolicy policy : 关联时采用的协议，有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC
  注意这里面我声明了两个索引KEY；
  */

static NSString *keyOfMethod;
static NSString *keyOfBlock;
@implementation UIButton (Action)
+ (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ActionBlock)actionBlock{
    UIButton *button = [[UIButton alloc]init];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    objc_setAssociatedObject(button, &keyOfBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return button;
}

- (void)buttonClick:(UIButton *)btn{
    
    ActionBlock block1 = (ActionBlock)objc_getAssociatedObject(btn, &keyOfMethod);
    
    if (block1) {
        block1(btn);
    }
    
    
    ActionBlock block2 = (ActionBlock)objc_getAssociatedObject(btn, &keyOfBlock);
    
    if (block2) {
        block2(btn);
    }
}

- (void)setActionBlock:(ActionBlock)actionBlock{
    
    objc_setAssociatedObject(self, &keyOfBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ActionBlock)actionBlock{
    
    return objc_getAssociatedObject(self, &keyOfBlock);
}

@end
