//
//  ViewController3.m
//  NSCharacterSet
//
//  Created by alldk on 17/5/27.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
     /* lzy注170527：
      http://blog.csdn.net/longshihua/article/details/50468910
      
      NSCharacterSet :以及它的可变版本NSMutableCharacterSet，用面向对象的方式来表示一组Unicode字符。它经常与NSString及NSScanner组合起来使用，在不同的字符上做过滤、删除或者分割操作。NSCharacterset是无需字符集合，主要用来判断已知字符串是否包含制定字符集，而不可以用来保存字符串。
      
      
      */
    [self testOne];
    
    [self testThree];
    
    [self testSix];
    
    
}


/**
 *   去掉空格
 */
-(void)testOne{
    
    //挤压空格 假设你去掉字符串两端的多余空格之后，还想去除单词之间的多余空格.
    NSString *string = @" Lorem    ipsum  dolar   sit  amet. ";
    
    //去除头尾包含的set字符串(这里要注意了,是针对首尾哦!).Trimming(修剪,剪裁)
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(@"string:%@",string);
    //string:Lorem    ipsum  dolar   sit  amet.
    
    //根据给定的字符串分隔符separator,对字符串进行分割为子字符串.返回一个数组对象包含被分割的所有子字符串.
    NSArray *components = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    string = [components componentsJoinedByString:@""];
    NSLog(@"string:%@",string);
    
    //string:Loremipsumdolarsitamet.
}

/**
 *   使用stringByTrimmingCharactersInSet函数过滤字符串中的特殊符号。
 */
-(void)testThree{
    
    //1:有字符串“A~B^C_D>E"，拆分出单个字母:
    
    NSString *str =@"      \nA~B^C_D>E       ";
    
    //去掉前边和后边的空格和换行符,中间部分无效.
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSCharacterSet * charSet = [NSCharacterSet characterSetWithCharactersInString:@"^~_>"];
    NSArray *arr = [str componentsSeparatedByCharactersInSet:charSet];
    
    //输出看效果
    [arr enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL *stop) {
        
        NSLog(@"A~B^C_D->[%@]", obj);
        
    }];
    NSLog(@"arr %@",[arr componentsJoinedByString:@""]);//arr ABCDE
    
    
    
    //2:关于invertedSet
    
    NSString *string =@"     123,45_6  7/8>9a     ";
    NSString * kNumber =@"0123456789.";
    //对于自定义字符串是非常重要的,经常使用.
    NSCharacterSet *numberSet = [[NSCharacterSet characterSetWithCharactersInString:kNumber]invertedSet];
    
    //invertedSet方法是去反字符,把所有的除了kNumber里的字符都找出来(包含去空格功能),经常使用与 UITextFiled中对输入进行过滤!
    NSString *fieldString = [[string componentsSeparatedByCharactersInSet:numberSet]componentsJoinedByString:@""];
    
    NSLog(@"number:%@", fieldString);
    
    //3:去掉首尾指定的字符集
    
    NSString *str2=@"天我爱北京天安门天";
    
    id cs= [NSCharacterSet characterSetWithCharactersInString:@"天门"];
    
    NSString *strResult=[str stringByTrimmingCharactersInSet:cs];
    NSLog(@"%@",strResult);//我爱北京天安
    
    
    //2:去除指定的字符集
    
    NSString *strMsg=@"我爱北京天安门";
    
    NSCharacterSet *characterSet= [NSCharacterSet characterSetWithCharactersInString:@"天门"];
    
    NSMutableString *theString=[NSMutableString stringWithString:strMsg];
    
    NSString *result= [self clearnIllegitCharacters:theString andCharacterSet:characterSet];
    
    NSLog(@"%@",result);//我爱北京安
}

// 清除敏感词语
 /* lzy注170527：
  有点儿奇怪，不是之前的，使用敏感set，调用字符串的分割方法，在把不带敏感词的部分拼接起来
  */
- (NSString *)clearnIllegitCharacters:(NSMutableString *)originString andCharacterSet:(NSCharacterSet *)cs{
    
    NSString *strResult=nil;
    
    NSRange range2;
    
    do {
        //NSLiteralSearch表示一个一个字符进行搜索,该方法返回第一个搜索到的范围.
        range2=[originString rangeOfCharacterFromSet:cs options:NSLiteralSearch];
        
        if (range2.location!=NSNotFound) {
            
            [originString replaceCharactersInRange:range2 withString:@""];
            
        }
        
    } while (range2.location!=NSNotFound);
    
    
    
    strResult=[[NSString alloc] initWithString:originString];
    
    return strResult;
}

- (NSString *)zyclearnIllegitCharacters:(NSMutableString *)originString andCharacterSet:(NSCharacterSet *)cs{
    
    NSString *strResult = nil;
    NSRange range2;
    
    do {
        range2 = [originString rangeOfCharacterFromSet:cs options:NSLiteralSearch];
        
        if (range2.location != NSNotFound) {
            [originString replaceCharactersInRange:range2 withString:@""];
        }
    } while (range2.location != NSNotFound);
    
    strResult = [[NSString alloc] initWithString:originString];
    
    return strResult;
}

//typedefNS_OPTIONS(NSUInteger, NSStringCompareOptions) {
//    
//    NSCaseInsensitiveSearch =1,//两个字符串的比较不区分大小写
//    
//    NSLiteralSearch = 2,//两个字符串的比较区分大小写
//    
//    NSBackwardsSearch =4,//从字符串末尾开发查询搜索
//    
//    NSAnchoredSearch =8,//搜索有限制范围的字符串
//    
//    NSNumericSearch = 64,//根据字符串里的数字来计算顺序
//    
//    NSDiacriticInsensitiveSearchNS_ENUM_AVAILABLE(10_5,2_0) =128,
//    
//    NSWidthInsensitiveSearch NS_ENUM_AVAILABLE(10_5,2_0) =256,//可以忽略字符串的宽度（长度）比较结果
//    
//    NSForcedOrderingSearchNS_ENUM_AVAILABLE(10_5,2_0) =512,//忽略不区分大小写比较的选项
//    
//    NSRegularExpressionSearchNS_ENUM_AVAILABLE(10_7,3_2) =1024
//    //  



/**
 *   组合多个CharacterSet
 */
-(void)testSix{
    
    //3:组合多个
    NSString *str = @" Price with tax: $250 ";
    NSLog(@"String: %@", str);
    
    // All the characters to remove
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet symbolCharacterSet];
    
    [characterSet formUnionWithCharacterSet:[NSCharacterSet letterCharacterSet]];
    [characterSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
    [characterSet formUnionWithCharacterSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // Build array of components using specified characters as separtors
    NSArray *arrayOfComponents = [str componentsSeparatedByCharactersInSet:characterSet];
    
    // Create string from the array components
    NSString *strOutput = [arrayOfComponents componentsJoinedByString:@""];
    
    NSLog(@"New string: %@", strOutput);
    //New string: 250
    
    //对于数字化结果的另一种方法.前面例子已经使用过了!就是利用decimalDigitCharacterSet加characterSetInverted操作.
    
    NSMutableCharacterSet *decimalDigit = [NSMutableCharacterSet decimalDigitCharacterSet];
    
    // invertedSet将去除的反过来变成不去除的
    NSCharacterSet *characterSetInverted = [decimalDigit invertedSet];
    NSArray *array =[str componentsSeparatedByCharactersInSet:characterSetInverted];
    
    NSString *strResult = [array componentsJoinedByString:@""];
    
    NSLog(@"New string: %@", strResult);
    //New string: 250
    
}


@end
