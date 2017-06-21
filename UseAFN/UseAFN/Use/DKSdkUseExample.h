//
//  DKSdkUseExample.h
//  UseAFN
//
//  Created by alldk on 2017/6/21.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import <Foundation/Foundation.h>
/* lzy注170621：
 sdk没有使用afn，只是把系统的方法封装了一下。
 
 block做回调真是非常常规何方便的。
 
 
 */

typedef void(^adrequestSuccessBlock)(id responseObject);
typedef void(^adrequestErrorBlock)(NSError *error);

@interface DKSdkUseExample : NSObject
    /**
     *  初始化时 请求广告
     *  @param asID       adSpaceID
     *  @param adType     广告类型
     *  @param cnt        第几次请求的广告
     *  @param timeOut    请求广告的超时时间 0为默认
     */
- (void)sendAdRequestWithAdType:(NSInteger)adType
                           asID:(NSString *)asID
                            cnt:(NSString *)cnt
                        timeOut:(NSTimeInterval)timeOut
                        success:(adrequestSuccessBlock) succBlock
                          error:(adrequestErrorBlock) errorBlock;
@end
