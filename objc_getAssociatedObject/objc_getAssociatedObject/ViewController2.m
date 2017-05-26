//
//  ViewController2.m
//  objc_getAssociatedObject
//
//  Created by alldk on 17/5/26.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController2.h"
#import <objc/runtime.h>
@interface ViewController2 ()

@end

@implementation ViewController2

 /* lzy注170526：
  http://blog.csdn.net/onlyou930/article/details/9299169
  关联
  关联是指把两个对象相互关联起来，使得其中的一个对象作为另外一个对象的一部分。
  关联特性只有在Mac OS X V10.6以及以后的版本上才是可用的。
  在类的定义之外为类增加额外的存储空间
  使用关联，我们可以不用修改类的定义而为其对象增加存储空间。这在我们无法访问到类的源码的时候或者是考虑到二进制兼容性的时候是非常有用。
  关联是基于关键字的，因此，我们可以为任何对象增加任意多的关联，每个都使用不同的关键字即可。关联是可以保证被关联的对象在关联对象的整个生命周期都是可用的（在垃圾自动回收环境下也不会导致资源不可回收）。
  创建关联
  创建关联要使用到Objective-C的运行时函数：objc_setAssociatedObject来把一个对象与另外一个对象进行关联。该函数需要四个参数：源对象，关键字，关联的对象和一个关联策略。当然，此处的关键字和关联策略是需要进一步讨论的。
  ■  关键字是一个void类型的指针。每一个关联的关键字必须是唯一的。通常都是会采用静态变量来作为关键字。
  ■  关联策略表明了相关的对象是通过赋值，保留引用还是复制的方式进行关联的；还有这种关联是原子的还是非原子的。这里的关联策略和声明属性时的很类似。这种关联策略是通过使用预先定义好的常量来表示的。
  下面的代码展示了如何把一个字符串关联到一个数组上。
  static char overviewKey;
  NSArray * array =[[NSArray alloc] initWidthObjects:@"One", @"Two", @"Three", nil];
  //为了演示的目的，这里使用initWithFormat:来确保字符串可以被销毁
  NSString * overview = [[NSString alloc] initWithFormat:@"@",@"First three numbers"];
  objc_setAssociatedObject(array, &overviewKey, overview, OBJC_ASSOCIATION_RETAIN);
  
  [overview release];
  //(1) overview仍然是可用的
  
  [array release];
  //(2)overview 不可用
  
  
  在（1）处，字符串overview仍然是可用的，这是因为OBJC_ASSOCIATION_RETAIN策略指明了数组要保有相关的对象。当数组array被销毁的时候，也就是在（2）处overview也就会被释放，因此而被销毁。如果此时还想使用overview，例如想通过log来输出overview的值，则会出现运行时异常。
  
  获取相关联的对象
  获取相关联的对象时使用Objective-C函数objc_getAssociatedObject。接着上面列表7-1的代码，我们可以使用如下代码来获取与array相关联的字符串：
  NSString * associatedObject = (NSString *)objc_getAssociatedObject(array, &oveviewKey);
  
  断开关联
  断开关联是使用objc_setAssociatedObject函数，传入nil值即可。
  接着列表7-1中的程序，我们可以使用如下的代码来断开字符串overview和arry之间的关联：
  
  objc_setAssociatedObject(array, &overviewKey, nil, OBJC_ASSOCIATION_ASSIGN);
  其中，被关联的对象为nil，此时关联策略也就无关紧要了。
  使用函数objc_removeAssociatedObjects可以断开所有关联。通常情况下不建议使用这个函数，因为他会断开所有关联。只有在需要把对象恢复到“原始状态”的时候才会使用这个函数。
  
  一个完整的实例程序
  下面的程序综合了前面的代码.
  int main(int argc, const char* argv[])
  {
  NSAutoreleasePool * pool = [[NSAutoreleasePool] alloc init];
  
  static char overviewKey;
  NSArray *array =[[NSArray alloc] initWidthObjects:@"One", @"Two", @"Three", nil];
  //为了演示的目的，这里使用initWithFormat:来确保字符串可以被销毁
  NSString * overview = [[NSString alloc] initWithFormat:@"@",@"First three numbers"];
  objc_setAssociatedObject(array, &overviewKey, overview, OBJC_ASSOCIATION_RETAIN);
  [overview release];
  
  NSString *associatedObject = (NSString *)objc_getAssociatedObject(arrray, &overviewKey);
  NSLog(@"associatedObject:%@", associatedObject);
  
  objc_setAssociatedObject(array, &overviewKey, nil, OBJC_ASSOCIATION_ASSIGN);
  [array release];
  
  [pool drain];
  return 0;
  }
  
  
  */

- (void)viewDidLoad {
    [super viewDidLoad];
    
     /* lzy注170526：不用原文的 static char overviewKey;
      */
    NSArray *array = [[NSArray alloc] initWithObjects:@"one", @"1", @"s", nil];
    NSString *overview = [[NSString alloc] initWithFormat:@"%@", @"xxxxx"];
    
    
    objc_setAssociatedObject(array, @"ss", overview, OBJC_ASSOCIATION_RETAIN);
    
    NSString *associatedObjct = (NSString *)objc_getAssociatedObject(array, @"ss");
    
    objc_setAssociatedObject(array, @"ss", nil, OBJC_ASSOCIATION_RETAIN);
    
    objc_removeAssociatedObjects(array);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
