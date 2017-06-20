//
//  ViewController.m
//  relativeToURL
//
//  Created by alldk on 2017/6/20.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger i = 0;
    NSURL *baseURL = [NSURL URLWithString:@"http://example.com/v1/"];
    
    /* lzy注170620：
     NSURL实例的打印，它的description方法是有点儿特别的
     2017-06-20 16:17:06.790601+0800 relativeToURL[23903:5368166] 1---foo -- http://example.com/v1/
     2017-06-20 16:17:06.790784+0800 relativeToURL[23903:5368166] 2---foo?bar=baz -- http://example.com/v1/
     2017-06-20 16:17:06.790918+0800 relativeToURL[23903:5368166] 3---/foo -- http://example.com/v1/
     2017-06-20 16:17:06.791055+0800 relativeToURL[23903:5368166] 4---foo/ -- http://example.com/v1/
     2017-06-20 16:17:06.791251+0800 relativeToURL[23903:5368166] 5---/foo/ -- http://example.com/v1/
     2017-06-20 16:17:06.791347+0800 relativeToURL[23903:5368166] 6---http://example2.com/
     
     */
    // http://example.com/v1/foo
    NSLog(@"%ld---%@", ++i, [NSURL URLWithString:@"foo" relativeToURL:baseURL]);
    
           // http://example.com/v1/foo?bar=baz
    NSLog(@"%ld---%@", ++i,  [NSURL URLWithString:@"foo?bar=baz" relativeToURL:baseURL]);
    
    // http://example.com/foo
    NSLog(@"%ld---%@", ++i,  [NSURL URLWithString:@"/foo" relativeToURL:baseURL]);
    
         // http://example.com/v1/foo
    NSLog(@"%ld---%@", ++i,  [NSURL URLWithString:@"foo/" relativeToURL:baseURL]);
    
    // http://example.com/foo/
    
    NSLog(@"%ld---%@", ++i,  [NSURL URLWithString:@"/foo/" relativeToURL:baseURL]);
    
    // http://example2.com/
    NSLog(@"%ld---%@", ++i,  [NSURL URLWithString:@"http://example2.com/" relativeToURL:baseURL]);
    
    
    /* lzy注170620：
     打印NSURL实例的absoluteString
     
     2017-06-20 16:17:06.791497+0800 relativeToURL[23903:5368166] 7---http://example.com/v1/foo
     2017-06-20 16:17:06.791590+0800 relativeToURL[23903:5368166] 8---http://example.com/v1/foo?bar=baz
     2017-06-20 16:17:06.791669+0800 relativeToURL[23903:5368166] 9---http://example.com/foo
     2017-06-20 16:17:06.791748+0800 relativeToURL[23903:5368166] 10---http://example.com/v1/foo/
     2017-06-20 16:17:06.791825+0800 relativeToURL[23903:5368166] 11---http://example.com/foo/
     2017-06-20 16:17:06.791894+0800 relativeToURL[23903:5368166] 12---http://example2.com/
     
     
     */
    
    
    // http://example.com/v1/foo
    NSLog(@"%ld---%@", ++i, [NSURL URLWithString:@"foo" relativeToURL:baseURL].absoluteString);
    
    // http://example.com/v1/foo?bar=baz
    NSLog(@"%ld---%@", ++i,  [NSURL URLWithString:@"foo?bar=baz" relativeToURL:baseURL].absoluteString);
    
    // http://example.com/foo
    NSLog(@"%ld---%@", ++i,  [NSURL URLWithString:@"/foo" relativeToURL:baseURL].absoluteString);
    
    // http://example.com/v1/foo
    NSLog(@"%ld---%@", ++i,  [NSURL URLWithString:@"foo/" relativeToURL:baseURL].absoluteString);
    
    // http://example.com/foo/
    
    NSLog(@"%ld---%@", ++i,  [NSURL URLWithString:@"/foo/" relativeToURL:baseURL].absoluteString);
    
    // http://example2.com/
    NSLog(@"%ld---%@", ++i,  [NSURL URLWithString:@"http://example2.com/" relativeToURL:baseURL].absoluteString);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
