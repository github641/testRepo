//
//  ViewController5.h
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController5 : UIViewController

@end


@interface NSObject(AssociationTest)
@property (nonatomic, copy)NSString *name;
@property (nonatomic, weak)id delegate;
@property (nonatomic, assign)BOOL isOK;
@end
