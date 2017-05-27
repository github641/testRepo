//
//  ViewController.m
//  NSCharacterSet
//
//  Created by alldk on 17/5/27.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     /* lzy注170527：
      https://www.zybuluo.com/chinese-ppmt/note/609656
      需求： 有一个字符串:@"今天我们来学习NSCharacterSet我们快乐"，去除字符串中所有的@"今"、@"我"、@"s"。
      【注意】s是小写
      
      思考：如果是你怎么解决？
      1. 自己写。
      
      */
    
    NSString *str = @"今天我们来学习NSCharacterSet我们快乐";
    
    NSString *str1 = @"我s今";
    
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    
    for (NSInteger i = 0; i < str.length; i++) {
        NSString *indexStr = [str substringWithRange:NSMakeRange(i, 1)];
        if (![str1 containsString:indexStr]) {
            [resultStr appendString:indexStr];
        }
    }
    
    NSLog(@"www:%@", resultStr);
    
     /* lzy注170527：
      2. 用 NSCharacterSet。
      
      
      NSCharacterSet的常用API学习
      
       001 根据一个给定的字符串获取一个NSCharacterSet对象
    + (NSCharacterSet *)characterSetWithCharactersInString:(NSString *)aString;
    // 使用实例，如上例！！
    002 相反字符串限制 【具体见接下的例子】
    @property (readonly, copy) NSCharacterSet *invertedSet;
     003 常用快捷方法集合 （常用的，已满足大多数需求）
    + controlCharacterSet
    + whitespaceCharacterSet              //空格
    + whitespaceAndNewlineCharacterSet    //空格和换行符
    + decimalDigitCharacterSet            //0-9的数字
    + letterCharacterSet                  //所有字母
    + lowercaseLetterCharacterSet         //小写字母
    + uppercaseLetterCharacterSet         //大写字母
    + alphanumericCharacterSet            //所有数字和字母（大小写不分）
    + punctuationCharacterSet             //标点符号
    + newlineCharacterSet                 //换行
    002 的 例子
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSString *str = @"7sjf78sf990s";
    NSLog(@"set----%@",[str componentsSeparatedByCharactersInSet:set]);
    NSCharacterSet *invertedSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSLog(@"invertedSet----%@",[str componentsSeparatedByCharactersInSet:invertedSet]);
      
      */
    
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:str1] invertedSet];
    
    NSArray *setArr = [str componentsSeparatedByCharactersInSet:characterSet];
    NSString *resultStr1 = [setArr componentsJoinedByString:@""];
    
    NSLog(@"拆分的字符串数组：%@  无缝拼接的字符串：%@", setArr, resultStr1);
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string{
    
    NSCharacterSet *charSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSCharacterSet *charSetTwo = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    
    NSString *filteredStr = [[string componentsSeparatedByCharactersInSet:charSet] componentsJoinedByString:@""];
    
    if ([string isEqualToString:filteredStr]) {
        return YES;
    }
    
    
    return NO;
}




































@end
