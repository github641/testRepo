//
//  ViewController.m
//  OpenSettingApp
//
//  Created by alldk on 17/6/1.
//  Copyright © 2017年 alldk. All rights reserved.
/*
http://www.cocoachina.com/ios/20170601/19401.html
 NSString * urlString = @"App-Prefs:root=WIFI";
 
 if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {
 
 if ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0) {
 
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
 
 } else {
 
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
 
 }
 
 }
 类似也有跳转到以下：
 
 无线局域网 App-Prefs:root=WIFI
 
 蓝牙 App-Prefs:root=Bluetooth
 
 蜂窝移动网络 App-Prefs:root=MOBILE_DATA_SETTINGS_ID
 
 个人热点 App-Prefs:root=INTERNET_TETHERING// 没有在开启WIFI热点的时候测试，和上面一个是一样的
 
 运营商 App-Prefs:root=Carrier// 还是和上面的反应一样
 
 通知 App-Prefs:root=NOTIFICATIONS_ID
 
 通用 App-Prefs:root=General
 
 通用-关于本机 App-Prefs:root=General&path=About
 
 通用-键盘 App-Prefs:root=General&path=Keyboard
 
 通用-辅助功能 App-Prefs:root=General&path=ACCESSIBILITY
 
 通用-语言与地区 App-Prefs:root=General&path=INTERNATIONAL
 
 通用-还原 App-Prefs:root=Reset
 
 墙纸 App-Prefs:root=Wallpaper
 
 Siri App-Prefs:root=SIRI
 
 隐私 App-Prefs:root=Privacy
 
 Safari App-Prefs:root=SAFARI
 
 音乐 App-Prefs:root=MUSIC
 
 音乐-均衡器 App-Prefs:root=MUSIC&path=com.apple.Music:EQ
 
 照片与相机 App-Prefs:root=Photos
 
 FaceTime App-Prefs:root=FACETIME
 
 只需要把对应的字符串换一下就可以了。
 
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)clicked:(id)sender {
    NSString *str = @"WIFI";
    str = @"Bluetooth";
    
    str = @"General";
    
    str = @"Privacy";

//        str = @"Privacy&path=MICROPHONE";// 隐私->麦克风
    str = @"MOBILE_DATA_SETTINGS_ID";//     str = @"INTERNET_TETHERING"; // str = @"Carrier";
    str = @"NOTIFICATIONS_ID";// 进入的是 设置->通知
    str = @"General&path=About";
    str = @"General&path=Keyboard";
    str = @"General&path=ACCESSIBILITY";
    str = @"General&path=INTERNATIONAL";// 语言与地区
    str = @"Reset";// 只跳设置主页面
    str = @"Wallpaper";
    str = @"SIRI";
    str = @"SAFARI";// safari设置
    str = @"MUSIC";
    str = @"MUSIC&path=com.apple.Music:EQ";
    str = @"Photos";
    str = @"FACETIME";
    str = @"";
    str = @"";
    str = @"";
    str = @"";
    str = @"MOBILE_DATA_SETTINGS_ID";
    
    str = @"INTERNET_TETHERING";// 只跳设置主页面
    
    str = @"Carrier";// 只跳设置主页面
    str = @"Privacy&path=MICROPHONE";// 隐私->麦克风
    
    str = @"Privacy&path=LOCATION";// 隐私->定位
    
    
    
    
    
    
    
    

    
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"App-Prefs:root=%@", str]];
    
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"跳转成功");
        }else{
            NSLog(@"跳转失败");
        }
        
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
