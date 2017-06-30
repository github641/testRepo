//
//  DzhbUseExample.m
//  UseAFN
//
//  Created by alldk on 2017/6/21.
//  Copyright © 2017年 alldk. All rights reserved.
//



#import "DzhbUseExample.h"

@implementation DzhbUseExample

/* lzy注170621：
 
 /**
 添加自定义的http请求header
 
 1、设备参数
 2、xxtea加密
 3、base64
 4、设置到header中
 
+ (void)addAFNHeaderWith:(AFHTTPSessionManager *)manager{
    
    //    NSDictionary *IPInfo=[[NSUserDefaults standardUserDefaults]objectForKey:@"IPInfo"];
    
    NSString *keystr=[NSString stringWithFormat:@"dn=%@&db=%@&os=%@&ov=%@&cr=%@&lip=%@&mac=%@&ap=%@&pn=%@&ver=%@&is_jb=%@&idfv=%@&idfa=%@&uuid_k=%@&dvc_m=%@&dev_lm=%@&dvc_mc=%@&dvc_in=%@&dvc_tc=%@&dvc_ac=%@&dvc_pm=%@&dvc_bs=%@&dvc_bl=%@&wifi_BSSID=%@&sc_b=%@&sc_bpt=%@&sc_s=%@&ra_net=%@&ui_net=%@&ct_net=%@&ct_ca=%@&ct_cc=%@&ct_iso=%@&ct_voip=%@&lc_l=%@&lc_c=%@&sys_ft=%@&sys_bt=%@&sys_lt=%@&uuid_o=%@&idfa_s=%@", [DzhbDeviceInfo deviceName], db, @"ios",[DzhbDeviceInfo deviceSystemVersion], [DzhbDeviceInfo CTMobileNetworkCode], [DzhbDeviceInfo getIPAddress : YES], [DzhbDeviceInfo mac], [DzhbDeviceInfo wifiBSSID], app_bundle_name, app_short_version, [NSString stringWithFormat:@"%@", @([DzhbDeviceInfo isJailbreak])], [DzhbDeviceInfo idfv], [DzhbDeviceInfo idfa], [DzhbDeviceInfo uuidKeychain], [DzhbDeviceInfo deviceModel], [DzhbDeviceInfo deviceLocalizedModel], [DzhbDeviceInfo deviceMachineCode], [DzhbDeviceInfo deviceInternalName], [DzhbDeviceInfo deviceTotalCapacity], [DzhbDeviceInfo deviceAvailableCapacity],[DzhbDeviceInfo devicePhysicalMemory], [DzhbDeviceInfo deviceBatteryState],[DzhbDeviceInfo deviceBatteryLevel],[DzhbDeviceInfo wifiBSSID],[DzhbDeviceInfo screenBrightness],[DzhbDeviceInfo screenBoundsPoint], [DzhbDeviceInfo screenScale],[DzhbDeviceInfo reachabilityNetworkType],[DzhbDeviceInfo getStatusBarNetworkType], [DzhbDeviceInfo CTTelephonyNetworkType], [DzhbDeviceInfo CTCarrierName], [DzhbDeviceInfo CTMobileCountryCode], [DzhbDeviceInfo CTISOCountryCode], [DzhbDeviceInfo CTAllowsVOIP], [DzhbDeviceInfo localPreferLang], [DzhbDeviceInfo localCountry], [DzhbDeviceInfo systemFileTime], [DzhbDeviceInfo systemBootTime], [DzhbDeviceInfo getLaunchSystemTime], [DzhbDeviceInfo openUUID], [DzhbDeviceInfo simulateIDFA]];
    
    
    //    //XXET加密Header参数
    NSData *encryptData=[XXTEA  encryptString:keystr stringKey:XXTEAKEYString sign:YES];
    NSString *kstr= [Utility base64Encode:encryptData];
    
    NSDictionary *d=[[NSDictionary alloc]initWithObjectsAndKeys:kstr, @"dianzhuan-agent", nil];
    [d enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop)
     {
         [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
     }];
    
    //        ULog(@"idfa：%@ idfa_s:%@ uuid_k:%@ uuid_o:%@ ", [DzhbDeviceInfo idfa], [DzhbDeviceInfo simulateIDFA], [DzhbDeviceInfo uuidKeychain], [DzhbDeviceInfo openUUID]);
    
    
}
 
 + (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(IWHttpSuccess)success failure:(IWHttpFailure)failure
 {
 
 // 采用了baseUrl 加 relativeURL 的形式
 AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[LZYBaseUrl sharedInstance].baseUrl]];
 
 // 返回数据 使用 响应序列化为 二进制数据
 manager.responseSerializer = [AFHTTPResponseSerializer serializer];
 
 //// 2.添加统一header
 [self addAFNHeaderWith:manager];
 
 
 
 //    DLog(@"请求url：%@ 请求参数%@ manager.requestSerializer.HTTPRequestHeaders:%@", url, params, manager.requestSerializer.HTTPRequestHeaders);
 // 设置afn的请求队列的最大并发数
 manager.operationQueue.maxConcurrentOperationCount = 5;
 // 设置 请求序列化的响应超时时间
 [manager.requestSerializer setTimeoutInterval:5.0];
 
 
 [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
 
 //    NSLog(@",,,,,,,,,,,,%@,,,,,,,,,,,,,%@",paramsStrData,[self xxteaToString:paramsStrData]);
 //    DLog(@"POST时间===%d",(int)[[NSDate date] timeIntervalSince1970]);
 
 } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
 
 
 // 通知外面的block，请求成功了
 if (success) {

 NSURLResponse *res=[task response];
 NSURLRequest *req=[task originalRequest];

 // 设置了返回时的数据响应解析格式是二进制数据，这个项目，上行下行都是使用了xxtea加密的。
 NSData *decodeData = [XXTEA decrypt:responseObject  stringKey:XXTEAKEYString sign:YES];
 
 if(decodeData==nil){
 return ;
 }
 
 
 NSString * strdata =   [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
 DLog(@"原始utf8字符串：%@", strdata);
 
 //转码
 NSString *mycontent=[self jsonFromStr:strdata];
 
 // block返回
 success(mycontent,res,req,strdata);

 }
 
 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
 [self stopIndicatorVisible];
 // 显示本地化的错误信息
 //       [self showError:error.localizedDescription];
 DLog(@"========数据请求失败=====%@",error);
 failure(error);
 
 }];
 
 
 }
 
 */

@end
