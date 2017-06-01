//
//  ViewController.m
//  SKStoreReviewController
//
//  Created by alldk on 17/5/31.
//  Copyright © 2017年 alldk. All rights reserved.
//
// 在需要用到这个接口的类里边import一下框架
#import <StoreKit/StoreKit.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)btnClicked:(id)sender {
    
    NSURL *url  = [NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/id1182891201?action=write-review"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
