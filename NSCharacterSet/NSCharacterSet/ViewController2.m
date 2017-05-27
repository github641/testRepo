//
//  ViewController2.m
//  NSCharacterSet
//
//  Created by alldk on 17/5/27.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    /* lzy注170527：
     http://www.jianshu.com/p/cb119ddb4f4e
     
     通篇都在讲stringByTrimmingCharactersInSet，汗
     
     SString 和NSCharacterset的不同之处
     An NSString object represents a string of ordered characters (text). An NSCharacterSet object represents a set of characters in no particular order. It is often much quicker to determine whether a character is a member of an NSCharacterSet than an NSString. You can’t use an NSCharacterSet object to hold text, at least not in any sensible way, because it does not maintain any order of characters, its use is primarily for determining whether a character exists in a set of characters.
     
     我们在nsstring的分割，查找等操作中，经常会提供两种函数，参数类型分别为NSString 和NSCharacterset，有什么不同呢？
     NSString 是有序字符串
     NSCharacterset是无需字符集合，主要用来判断已知字符串是否包含制定字符集，而不可以用来保存字符串。
     
     转自：http://blog.csdn.net/aiyongyyy/article/details/8269546
     
     
     在ios中 可以使用stringByTrimmingCharactersInSet函数过滤字符串中的特殊符号
     
     首先自己定义一个NSCharacterSet, 包含需要去除的特殊符号
     
     */
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"/@／：；（）¥「」/＂、[]{}#%-*+=_\\|~＜＞$€^•’@#$%^&*()_+’\"^&*;8"];//由于NSString中有全角符号和半角符号, 因此有些符号要包括全角和半角的
    NSString *string = @"a;djf;asdfjadfkaj;\(&&\(*&^*\(&^&*\(^5-2834528)";
    
     /* lzy注170527：stringByTrimmingCharactersInSet 是过滤掉字符串首尾两端的特殊字符*/
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:set];
    
    NSLog(@"%@", trimmedString);
    
    
    NSString *testString = @"  my name is wang tianqiao  ";
    
    NSString *cString = [testString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"|%@|",cString);
}
















































@end
