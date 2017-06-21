//
//  UseExample.m
//  UseAFN
//
//  Created by alldk on 2017/6/21.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "UseExample.h"
#import <AFNetworking/AFNetworking.h>

/* lzy注170621：
 定义了一个block，这个block作为各种数据的回调
 */
typedef void (^MyCallback)(id obj);

@implementation UseExample
#pragma mark - ================== 蓝时期 ==================
    
+ (void)lanyi{
    // 那时候还是基于2.x的，我在这里为了避免报错，改为3.x的了。流程是一样的。请求配置没有做任何修改。
    
    [self requestWeibosWithCallback:^(id obj) {
        
    }];
    
    [self sendWeiboWithText:@"abc" andCallback:^(id obj) {
        
    }];
    
    [self sendWeiboWithText:@"aaa" andImageData:[NSData data] andCallback:^(id obj) {
        
    }];
    
}
    
+ (NSArray *)parseWeiboWithDic:(NSDictionary *)obj{
    
    return @[];
}
   
/**
 get 示例
 
 
 */
+(void)requestWeibosWithCallback:(MyCallback)callback{
    
    //请求地址 字符串
    NSString *path = @"https://api.weibo.com/2/statuses/home_timeline.json";
    
    // 准备请求参数，使用字典来准备
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *token = [ud objectForKey:@"token"];
    [params setObject:token forKey:@"access_token"];
    
    // 调用自己对AFN的封装来请求。传入地址、参数，何一个匿名的block，这个block和requestWeibosWithCallback:方法本身的block是同一个类型，但是不是同一个对象
    [self GET:path andParams:params andCallback:^(id obj) {
        
//        方法内部调用了匿名block后回调处来的数据。
        NSArray *weibos = [self parseWeiboWithDic:obj];
        //把解析出来的装着多个微博对象的数组返回出去 这个回调是requestWeibosWithCallback:方法的回调
        callback(weibos);
    }];
}
    
    // post 示例
+(void)sendWeiboWithText:(NSString *)text andCallback:(MyCallback)callback{
    
    NSString *path = @"https://api.weibo.com/2/statuses/update.json";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *token = [ud objectForKey:@"token"];
    [params setObject:token forKey:@"access_token"];
    [params setObject:text forKey:@"status"];
    [self POST:path andParams:params andCallback:callback];
    
}
    // post 传 图片示例
+(void)sendWeiboWithText:(NSString *)text andImageData:(NSData *)imageData andCallback:(MyCallback)callback{
    
    NSString *path = @"https://upload.api.weibo.com/2/statuses/upload.json";
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *token = [ud objectForKey:@"token"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:token forKey:@"access_token"];
    [params setObject:text forKey:@"status"];
    
    [self POST:path andParams:params andImageData:imageData andCallback:callback];
    
    
}
    
    /* lzy注170621：
     这是对afn的二次封装。
     */
+(void)GET:(NSString *)path andParams:(NSDictionary *)params andCallback:(MyCallback)callback{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 指定了 响应序列化的类型。值得注意到而是，afn自己支持几种数据解析，json、xml、plist、image、compound，可以看下AFURLResponseSerialization这个头文件。默认就是json响应序列化。
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    
    /* lzy注170621：
     afn中，AFHTTPSessionManager有一个baseURL，这里方法的URLString可以是relative的url，这样更加方便合理。
     参考 AFHTTPSessionManager头文件中 ：Below are a few examples of how `baseURL` and relative paths interact
     */
    [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        /* lzy注170621：
         值得注意的是，responseObject是根据用户设置，用户没有设置，默认是json，处理之后的数据对象。
         */
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
 
        callback(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
        
    }];
    
}
    
+(void)POST:(NSString *)path andParams:(NSDictionary *)params andCallback:(MyCallback)callback{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //写解析代码
        callback(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    
    
}
    
    
    
+(void)POST:(NSString *)path andParams:(NSDictionary *)params andImageData:(NSData *)imageData andCallback:(MyCallback)callback{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:imageData name:@"pic" fileName:@"a.jpg" mimeType:@"image/jpg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //写解析代码
        callback(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    
    
}
    
    
    @end
