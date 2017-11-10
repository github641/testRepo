//
//  ViewController.m
//  IDFAGet
//
//  Created by admin on 2017/10/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import <AdSupport/AdSupport.h>
#import "MBProgressHUD.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArr;
@property (nonatomic, copy) NSString *currentIDFA;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"历史记录";
    
    self.dataArr = [NSMutableArray array];
    
//    [self idfa];
    
//    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
//    [self.view addSubview:self.tableView];
//
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(idfa)];
    self.navigationItem.rightBarButtonItem = item;
    
}
#pragma mark - idfa
/**
 判断某字符串是否为nil\NSNull\@""\@" " 等等
 是的话返回空字符串
 
 */
- (NSString *)verifyBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return @"";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([string isKindOfClass:[NSString class]] && [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return @"";
    }
    return string;
}
- (void)idfa{
    
    if (![ASIdentifierManager sharedManager].isAdvertisingTrackingEnabled) {
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"idfa被限制追踪，请前往 设置->隐私->广告" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertVC addAction:[UIAlertAction actionWithTitle:@"取消"                                                        style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [alertVC addAction:[UIAlertAction actionWithTitle:@"好的"                                                        style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self openIt:@"App-Prefs:root=Privacy"];// advertisement App-Prefs:root=Privacy&Paht=ADVERTISEMENT
            
        }]];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }else {
    
    
    self.currentIDFA = [self verifyBlankString:[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]];
    
    [UIPasteboard generalPasteboard].string = self.currentIDFA;
    
    [self.dataArr addObject:self.currentIDFA];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = @"复制到粘贴板";
    hud.detailsLabel.text = self.currentIDFA;
    [hud hideAnimated:YES afterDelay:1.2];
    }
}


- (void)openIt:(NSString *)urlString{

if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {
    
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
        
    } else {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        
    }
    
}
}

#pragma mark - ================== table view ==================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"Unknown.jpg"];
    
    return cell;
}

@end
