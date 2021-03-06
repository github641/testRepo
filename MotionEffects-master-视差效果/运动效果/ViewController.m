//
//  ViewController.m
//  运动效果
//
//  Created by 霍文轩 on 16/1/29.
//  Copyright © 2016年 霍文轩. All rights reserved.
//
/* lzy注170815：
 在iOS组件alert上看到了这个api。
 CustomIOSAlertView这个类库。
 
 
 原文：iOS实现墙纸的运动视差效果
 http://www.jianshu.com/p/27d3fa227cfa
 
 其他：UIMotionEffect和Home页背景视差效果
 http://www.cocoachina.com/ios/20150121/10967.html
 
 
 */
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *back;
@property (weak, nonatomic) IBOutlet UIImageView *fairy;

@end

@implementation ViewController
/* lzy注170815：
 UIMotionEffectGroup的使用。
 */
- (void)ABC{
//    UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
//    
//    horizontalEffect.minimumRelativeValue = @(-kDKMotionEffectExtent);
//    horizontalEffect.maximumRelativeValue = @( kDKMotionEffectExtent);
//    
//    UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
//    
//    verticalEffect.minimumRelativeValue = @(-kDKMotionEffectExtent);
//    verticalEffect.maximumRelativeValue = @( kDKMotionEffectExtent);
//    
//    UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
//    
//    motionEffectGroup.motionEffects = @[horizontalEffect, verticalEffect];
//    
//    [dialogView addMotionEffect:motionEffectGroup];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    // 需要在手机的系统设置的辅助功能中关闭减弱动态效果
    
    // 设置仙女的运动效果 ===== BEGIN =====
    // 设置在x轴的偏移范围
    UIInterpolatingMotionEffect * fairyEffX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];// type表示沿水平方向运行效果
    fairyEffX.maximumRelativeValue = @(50);
    fairyEffX.minimumRelativeValue = @(-50);
    // 为view添加运动效果
    [self.fairy addMotionEffect:fairyEffX];
    
    UIInterpolatingMotionEffect * fairyEffY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    fairyEffY.maximumRelativeValue = @(50);
    fairyEffY.minimumRelativeValue = @(-50);
    [self.fairy addMotionEffect:fairyEffY];
    
    // 设置背景的运动效果 ===== BEGIN =====
    UIInterpolatingMotionEffect * backEffX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];// type表示沿水平方向运行效果
    backEffX.maximumRelativeValue = @(-100);
    backEffX.minimumRelativeValue = @(100);
    [self.back addMotionEffect:backEffX];
    
    UIInterpolatingMotionEffect * backEffY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    backEffY.maximumRelativeValue = @(-100);
    backEffY.minimumRelativeValue = @(100);
    [self.back addMotionEffect:backEffY];
}

@end
