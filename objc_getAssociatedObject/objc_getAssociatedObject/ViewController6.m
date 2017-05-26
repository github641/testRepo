//
//  ViewController6.m
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController6.h"
#import <objc/runtime.h>

@interface ViewController6 ()

@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    
     /* lzy注170526：
      http://www.jianshu.com/p/1655d9eed561
      首先让我们设想一个场景：
      有一个Person类，我们想使用这个类的对象，但是我们想给这个对象添加一个address的属性来添加地址相关的信息，并做相关的处理
      我们有两种解决方法：
      
      定义一个Person的子类，然后在子类中添加address这个属性和对address的操作方法
      定义一个Person的Category，在category中添加address的操作方法，但是遗憾的是，Objective-C中的Category不支持定义属性
      那我们该怎么办，不要着急，且看下面分解
      
      这时候，关联对象就派上用场了
      关联对象可以给对象关联许多其他的对象，通过“键”来区分，并且可以指明存储策略，用来维护相对应的内存管理。比如上面的场景中，我们可以给Person的对象关联一个NSString类型的address对象，用来存储地址信息。
      
      // 关联对象：以给定的 “键” 和 “策略” 为某个对象设置关联对象
      void objc_setAssociatedObject(id object, void *key, id value, objc_AssociationPolicy policy)
      // 获取关联的对象：以给定的 “键” 从某个对象中获取关联的对象
      id objc_getAssociatedObject(id object, void *key)
      // 移除值：移除指定对象的全部关联对象
      void objc_removeAssociatedObjects(id object)
      
      关联对象的操作与操作NSDictionary相似，设置关联对象用到的都是 void * 类型的
      两者之间有个非常重要的差别：在NSDictionary中，如果对两个key执行isEqual方法返回的是YES，则两个key相同
      在关联对象中，两个值的指针必须完全相同才可以，所以通常使用“静态的全局变量”来作为key
      
      将alert的视图和处理操作结果的代码放到一起，增强了可读性。
      */
    
    [self askUserAQuestion];
}

static void *EOCMyAlertViewKey = @"EOCMyAlertViewKey";
- (void)askUserAQuestion{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question" message:@"What do you want to do?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    // 定义一个处理逻辑的block
    void (^block)(NSInteger) = ^(NSInteger index){
        
        if (index == 0) {
            // cancel
            
        }else{
            // continue
        }
        
        NSLog(@"index:%@", @(index));
    };
    
    objc_setAssociatedObject(alert, EOCMyAlertViewKey, block, OBJC_ASSOCIATION_COPY);
    
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    void (^block)(NSInteger) = objc_getAssociatedObject(alertView, EOCMyAlertViewKey);
    
    block(buttonIndex);
    
}



@end
