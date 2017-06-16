//
//  ViewController.m
//  NSScanner
//
//  Created by alldk on 2017/6/16.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController.h"
#import "ConditionJudgementController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tf;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    // return NO to disallow editing.
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    // became first responder
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
}
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0){
    // if implemented, called in place of textFieldDidEndEditing:
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // return NO to not change text
    
    return [ConditionJudgementController isValidAboutInputText:textField shouldChangeCharactersInrange:range replacementString:string decimalNumber:1];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    // called when clear button pressed. return NO to ignore (no notifications)
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // called when 'return' key pressed. return NO to ignore.
    return YES;
}

@end
