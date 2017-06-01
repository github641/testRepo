//
//  ViewController.m
//  OpenSettingApp
//
//  Created by alldk on 17/6/1.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)clicked:(id)sender {
    NSString *str = @"WIFI";
    str = @"Bluetooth";
    
    str = @"General";
    
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"App-Prefs:root=%@", str]];
    
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        
    }];
    
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
