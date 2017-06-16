//
//  ConditionJudgementController.h
//  NSScanner
//
//  Created by alldk on 2017/6/16.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ConditionJudgementController : NSObject

/**
 输入框中只能输入数字和小数点，且小数点只能输入一位，参数number可以设置小数的位数。
 -(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string调用;

 */
+ (BOOL)isValidAboutInputText:(UITextField *)textField shouldChangeCharactersInrange:(NSRange)range replacementString:(NSString *)string decimalNumber:(NSInteger)number;
@end
