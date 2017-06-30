//
//  main.m
//  三目运算符使用疑问
//
//  Created by alldk on 2017/6/30.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        // 平常的使用
        NSString *name ;
        
        NSString *newName = name ? : @"vm";
        
        NSLog(@"%@", newName);
        
    }
    return 0;
}
