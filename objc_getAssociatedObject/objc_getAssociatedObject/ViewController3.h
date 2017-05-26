//
//  ViewController3.h
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController3 : UIViewController

@end
@interface NSObject(CategoryWithProperty)
@property (nonatomic, strong)NSObject *property;
@end
