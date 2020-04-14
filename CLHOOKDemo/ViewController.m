//
//  ViewController.m
//  CLHOOKDemo
//
//  Created by  蔡亮 蔡 on 2020/4/14.
//  Copyright © 2020 Wuhan Radio and Television Station. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlStr = @"http://joyclass.51joyshow.com/Web/CloudCourse/services?scopeOfGrade=1&selectedCourse=国防";
    
    UILabel *urlLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 100)];
    [self.view addSubview:urlLab];
    urlLab.backgroundColor = [UIColor lightGrayColor];
    urlLab.textAlignment = 0;
    urlLab.text = urlStr;
    urlLab.font = [UIFont systemFontOfSize:17.0];
    urlLab.numberOfLines = 0;
    
    
    NSURL *url = [NSURL URLWithString:urlStr]; // method swizzle方法欺骗，运用runtime的方法交换的特性
    
    
    UILabel *urlLab2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, self.view.bounds.size.width, 100)];
    [self.view addSubview:urlLab2];
    urlLab2.backgroundColor = [UIColor lightGrayColor];
    urlLab2.textAlignment = 0;
    urlLab2.text = [NSString stringWithFormat:@"%@",url];
    urlLab2.font = [UIFont systemFontOfSize:17.0];
    urlLab2.numberOfLines = 0;
}


@end
