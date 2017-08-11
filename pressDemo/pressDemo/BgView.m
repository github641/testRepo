//
//  BgView.m
//  pressDemo
//
//  Created by alldk on 2017/8/11.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "BgView.h"

@interface BgView()

@property (nonatomic, assign)CGRect ivFrame;

@end

@implementation BgView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSelfView:)];
        [self addGestureRecognizer:tapGes];
        
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        self.ivFrame = CGRectMake(100, 100, 100, 100);
        UIImageView *iv = [[UIImageView alloc] initWithFrame:self.ivFrame];
        [self addSubview:iv];
        
        iv.backgroundColor = [UIColor purpleColor];
        
    }
    return self;
}

- (void)tapSelfView:(UITapGestureRecognizer *)tap{
    CGPoint point = [tap locationInView:self];

    NSLog(@"-------------------------CGRectContainsPoint(self.ivFrame, point):%@", @(CGRectContainsPoint(self.ivFrame, point)));

    
    NSLog(@"%s", __func__);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    CGPoint point = [[touches anyObject] locationInView:self];
//    NSLog(@"-------------------------CGRectContainsPoint(self.ivFrame, point):%@", @(CGRectContainsPoint(self.ivFrame, point)));
//
//}

//- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
//    NSLog(@"A_view--- pointInside withEvent ---");
//    BOOL isInside = [super pointInside:point withEvent:event];
//    NSLog(@"A_view--- pointInside withEvent --- isInside:%d",isInside);
//    NSLog(@"-------------------------CGRectContainsPoint(self.ivFrame, point):%@", @(CGRectContainsPoint(self.ivFrame, point)));
//    
//    
//    return isInside;
//}




@end
