//
//  ViewController7.m
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController7.h"
#import "UIButton+Action.h"

@interface ViewController7 ()

@end

@implementation ViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
     /* lzy注170526：
      
      http://blog.csdn.net/u014220518/article/details/52873164
      
      一.objc/runtime.h相关
      Objecitve-C的重要特性是Runtime（运行时），在Interacting with the Runtime（交互运行）中，运行时函数部分，苹果给出了/usr/lib/libobjc.A.dylib库，这个共享库提供支持动态属性的objective - c语言，通过其接口，可以用于开发将其他语言运行于Objective-C上的中间层（桥接层），库里的函数定义为纯C语言。

      */
    
    [self uiConfig];
}

- (void)uiConfig{
    
    UIButton *button1 = [UIButton createBtnWithFrame:CGRectMake(100, 100, 100, 100) title:@"嘻嘻嘻嘻" actionBlock:^(UIButton *button) {
        
        float r = random()%255 / 255.0;
        float g = random()%255 / 255.0;
        float b = random()%255 / 255.0;
        self.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    }];
    
    button1.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:button1];
    
    //第二个按钮
    UIButton *button2 = [UIButton createBtnWithFrame:CGRectMake(100, 200, 100, 50) title:@"按钮2" actionBlock:nil];
    button2.actionBlock = ^(UIButton *button){
        NSLog(@"---%@---",button.currentTitle);
    };
    button2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button2];
    
}
@end
