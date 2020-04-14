//
//  NSURL+HOOKURL.m
//  CLHOOKDemo
//
//  Created by  蔡亮 蔡 on 2020/4/14.
//  Copyright © 2020 Wuhan Radio and Television Station. All rights reserved.
//

#import "NSURL+HOOKURL.h"
#import <objc/runtime.h>

@implementation NSURL (HOOKURL)

+ (void)load {
    // 以前的方法
    Method urlWithStr = class_getClassMethod(self, @selector(URLWithString:));
    // 新方法
    Method hook_urlWithStr = class_getClassMethod(self, @selector(Hook_URLWithString:));
    // 交换
    method_exchangeImplementations(urlWithStr, hook_urlWithStr);
}

+ (nullable instancetype)Hook_URLWithString:(NSString *)string { // instancetype 可换id，就是使那些非关联返回类型的方法返回所在类的类型
    NSURL *url = [NSURL Hook_URLWithString:string];
    if (url == nil) {
        string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }
    url = [NSURL Hook_URLWithString:string];
    return url;
}

@end
