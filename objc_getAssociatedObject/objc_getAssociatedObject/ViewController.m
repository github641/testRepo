//
//  ViewController.m
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController.h"
#import<objc/runtime.h>
#import "ViewController3.h"
#import "ViewController5.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // http://www.jianshu.com/p/8e267293df1f
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    [btn setFrame:CGRectMake(50, 50, 50, 50)];
    
    btn.backgroundColor = [UIColor redColor];
    
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
//    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSString *s = @"a";
    s.property = @"xxx";
    NSLog(@"%@", s.property);
    
    s.name = @"ys";
    s.delegate = self;
    
    s.isOK = 1;
    
    NSLog(@"%@ %@ %@", s.name, s.delegate, @(s.isOK));
    
    
    
}




-(void)click:(UIButton *)sender

{    NSString *message = @"你是谁";
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"我要传值·" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
    alert.delegate = self;
    
    [alert show];
    
    //#import<objc/runtime.h>头文件
    
    //objc_setAssociatedObject需要四个参数：源对象，关键字，关联的对象和一个关联策略。
    
    //1 源对象alert
    
    //2 关键字 唯一静态变量key associatedkey
    
    //3 关联的对象 sender
    
    //4 关键策略  OBJC_ASSOCIATION_ASSIGN
    
    //    enum {
    
    //        OBJC_ASSOCIATION_ASSIGN = 0,          若引用/**< Specifies a weak reference to the associated object. */
    
    //        OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, /**< Specifies a strong reference to the associated object.
    
    //                                                *  The association is not made atomically. */
    
    //        OBJC_ASSOCIATION_COPY_NONATOMIC = 3,  /**< Specifies that the associated object is copied.
    
    //                                                *  The association is not made atomically. */
    
    //        OBJC_ASSOCIATION_RETAIN = 01401,      /**< Specifies a strong reference to the associated object.
    
    //                                                *  The association is made atomically. */
    
    //        OBJC_ASSOCIATION_COPY = 01403          /**< Specifies that the associated object is copied.
    
    //                                                *  The association is made atomically. */
    
    //    };
    
    objc_setAssociatedObject(alert, @"msgstr", message,OBJC_ASSOCIATION_ASSIGN);
    
    //把alert和message字符串关联起来，作为alertview的一部分，关键词就是msgstr，之后可以使用objc_getAssociatedObject从alertview中获取到所关联的对象，便可以访问message或者btn了
    
    //    即实现了关联传值
    
    objc_setAssociatedObject(alert, @"btn property",sender,OBJC_ASSOCIATION_ASSIGN);
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    
    //通过 objc_getAssociatedObject获取关联对象
    
    NSString  *messageString =objc_getAssociatedObject(alertView, @"msgstr");
    
    UIButton *sender = objc_getAssociatedObject(alertView, @"btn property");
    
    NSLog(@"%ld",buttonIndex);
    
    NSLog(@"%@",messageString);
    
    NSLog(@"%@",[[sender titleLabel] text]);
    
    //使用函数objc_removeAssociatedObjects可以断开所有关联。通常情况下不建议使用这个函数，因为他会断开所有关联。只有在需要把对象恢复到“原始状态”的时候才会使用这个函数。
    
}

@end
