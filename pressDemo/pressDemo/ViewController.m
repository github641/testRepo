//
//  ViewController.m
//  pressDemo
//
//  Created by alldk on 2017/8/11.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController.h"
#import "BgView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BgView *bgView = [[BgView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:bgView];


}



@end
