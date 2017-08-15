//
//  ViewController.m
//  CAGradientLayer
//
//  Created by alldk on 2017/8/15.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController.h"


#import "YXGCD.h"
// 将常数转换为度数
#define   DEGREES(degrees)  ((M_PI * (degrees))/ 180.f)
@interface ViewController ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) GCDTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // http://www.jianshu.com/p/80c0cc6a2d16
//    [self bottomLayer];
    
    
    /* lzy注170815：
     http://www.cnblogs.com/YouXianMing/p/3793913.html
     */
//    [self propertyOfCAGradientLayer];
    
//    [self propertyOfCAGradientLayerAnimate];
    
    [self pathWithCAGradientLayerAnimate];
    
}
- (CAShapeLayer *)LayerWithCircleCenter:(CGPoint)point
                                 radius:(CGFloat)radius
                             startAngle:(CGFloat)startAngle
                               endAngle:(CGFloat)endAngle
                              clockwise:(BOOL)clockwise
                        lineDashPattern:(NSArray *)lineDashPattern
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    // 贝塞尔曲线(创建一个圆)
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0)
                                                        radius:radius
                                                    startAngle:startAngle
                                                      endAngle:endAngle
                                                     clockwise:clockwise];
    
    // 获取path
    layer.path = path.CGPath;
    layer.position = point;
    
    // 设置填充颜色为透明
    layer.fillColor = [UIColor clearColor].CGColor;
    
    // 获取曲线分段的方式
    if (lineDashPattern)
    {
        layer.lineDashPattern = lineDashPattern;
    }
    
    return layer;
}
- (void)pathWithCAGradientLayerAnimate{
    self.view.backgroundColor = [UIColor blackColor];
    
    CAGradientLayer *colorLayer = [CAGradientLayer layer];
    colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    colorLayer.frame    = (CGRect){CGPointZero, CGSizeMake(200, 200)};
    colorLayer.position = self.view.center;
    [self.view.layer addSublayer:colorLayer];
    
    // 颜色分配
    colorLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                          (__bridge id)[UIColor whiteColor].CGColor,
                          (__bridge id)[UIColor redColor].CGColor];
    colorLayer.locations  = @[@(-0.2), @(-0.1), @(0)];
    
    // 起始点
    colorLayer.startPoint = CGPointMake(0, 0);
    
    // 结束点
    colorLayer.endPoint   = CGPointMake(1, 0);
    
    CAShapeLayer *circle = [self LayerWithCircleCenter:CGPointMake(102, 100)
                                                              radius:80
                                                          startAngle:DEGREES(0)
                                                            endAngle:DEGREES(360)
                                                           clockwise:YES
                                                     lineDashPattern:nil];
    circle.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:circle];
    circle.strokeEnd = 1.f;
    colorLayer.mask = circle;
    
    _timer = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    [_timer event:^{
        
        static int i = 0;
        if (i++ % 2 == 0)
        {
            CABasicAnimation* fadeAnim = [CABasicAnimation animationWithKeyPath:@"locations"];
            fadeAnim.fromValue = @[@(-0.2), @(-0.1), @(0)];
            fadeAnim.toValue   = @[@(1.0), @(1.1), @(1.2)];
            fadeAnim.duration  = 1.5;
            [colorLayer addAnimation:fadeAnim forKey:nil];
        }
        
    } timeInterval:NSEC_PER_SEC];
    [_timer start];
    
}

- (void)propertyOfCAGradientLayerAnimate{
    //    @property (nonatomic, strong) GCDTimer  *timer;
// 工厂方法创建gradientLayer实例
    CAGradientLayer *colorLayer = [self propertyOfCAGradientLayer];
    
//    [self animateOneWith:colorLayer];
    [self animateTwoWith:colorLayer];
    

}

- (void)animateOneWith:(CAGradientLayer *)colorLayer{
    _timer = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    [_timer event:^{
        
        static CGFloat test = - 0.1f;
        
        if (test >= 1.1)
        {
            test = - 0.1f;
            [CATransaction setDisableActions:YES];
            colorLayer.locations  = @[@(test), @(test + 0.05), @(test + 0.1)];
        }
        else
        {
            [CATransaction setDisableActions:NO];
            colorLayer.locations  = @[@(test), @(test + 0.05), @(test + 0.1)];
        }
        
        test += 0.1f;
        
    } timeInterval:NSEC_PER_SEC ];
    
    [_timer start];
}

- (void)animateTwoWith:(CAGradientLayer *)colorLayer{
    _timer = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    [_timer event:^{
        
        static CGFloat test = - 0.1f;
        
        if (test >= 1.1)
        {
            test = - 0.1f;
            [CATransaction setDisableActions:NO];
            colorLayer.locations  = @[@(test), @(test + 0.01), @(test + 0.011)];
        }
        else
        {
            [CATransaction setDisableActions:NO];
            colorLayer.locations  = @[@(test), @(test + 0.01), @(test + 0.011)];
        }
        
        test += 0.1f;
        
    } timeInterval:NSEC_PER_SEC];
    [_timer start];
}

- (CAGradientLayer *)propertyOfCAGradientLayer{
//    http://www.cnblogs.com/YouXianMing/p/3793913.html
    CAGradientLayer *colorLayer = [CAGradientLayer layer];
    colorLayer.frame    = (CGRect){CGPointZero, CGSizeMake(200, 200)};
    colorLayer.position = self.view.center;
    [self.view.layer addSublayer:colorLayer];
    
    // 颜色分配
    colorLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                          (__bridge id)[UIColor greenColor].CGColor,
                          (__bridge id)[UIColor blueColor].CGColor];
    
    // 颜色分割线
    colorLayer.locations  = @[@(0.25), @(0.5), @(0.75)];
    
    // 起始点
    colorLayer.startPoint = CGPointMake(0, 0);
    
    // 结束点
    colorLayer.endPoint   = CGPointMake(1, 0);
    
    return colorLayer;
}

- (void)bottomLayer{
    
//http://www.jianshu.com/p/80c0cc6a2d16
    // 初始化图片
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image.jpg"]];
    
    imageView.frame = CGRectMake(0, 100, self.view.frame.size.width, 200);
    
    [self.view addSubview:imageView];
    
    // 初始化渐变层 ['ɡreidiənt]梯度、坡度、渐变色
    self.gradientLayer = [CAGradientLayer layer];
    
    self.gradientLayer.frame = imageView.bounds;
    
    [imageView.layer addSublayer:self.gradientLayer]; // 要把它加在底部图片的layer上
    
    // 设置颜色组
    /* lzy注170815：
     An array of CGColorRef objects defining the color of each gradient stop. Animatable.
     */
    self.gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
    
    // 设置起点和终点坐标,视情况而定
    /* lzy注170815：
     The start point of the gradient when drawn in the layer’s coordinate space. Animatable.
     The start point corresponds to the first stop of the gradient. The point is defined in the unit coordinate space and is then mapped to the layer’s bounds rectangle when drawn.
     Default value is (0.5,0.0).
     */
    self.gradientLayer.startPoint = CGPointMake(0.2, 0.2);
    /* lzy注170815：
     The end point of the gradient when drawn in the layer’s coordinate space. Animatable.
     The end point corresponds to the last stop of the gradient. The point is defined in the unit coordinate space and is then mapped to the layer’s bounds rectangle when drawn.
     Default value is (0.5,1.0).
     */
    self.gradientLayer.endPoint = CGPointMake(0.2, 2.0);
    
    // 如果阴影要在图片上面到下面, 可以调整它的坐标
    // self.gradientLayer.startPoint = CGPointMake(0, 0);
    // self.gradientLayer.endPoint = CGPointMake(0, 1);
    
    
    [imageView.layer insertSublayer:self.gradientLayer above:0];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 320, 30)];
    label.text = @"这是信永超的测试文字";
    label.textColor = [UIColor whiteColor];
    
    [imageView addSubview:label];
    

}

@end
