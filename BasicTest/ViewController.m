//
//  ViewController.m
//  BasicTest
//
//  Created by hpkj on 2020/1/6.
//  Copyright © 2020 hpkj. All rights reserved.
//

#import "ViewController.h"

#import "HPUtils.h"

#import "HPDateConfig.h"

#import "NSDate+Change.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // #import "HPUtils.h"
    
    NSString * value = @"";
    
    if ([HPUtils rq_isNotEmpty:value]) {
        
    }else
    {
        NSLog(@"HPUtils.h 判断字符串为空");
    }
    
//    #import "NSDate+Change.h"

    NSString * time = [NSDate getNowTimestamp];
    
    float timeFlo = [time floatValue];
    
    NSString * string =  [NSDate timestampToPointTimStr:timeFlo];
    
    NSLog(@"#import NSDate+Change.h 获取当前时间%@",string);
    
    
    
//    #import "HPDateConfig.h"

    NSInteger val = [HPDateConfig judgeNowtimeIsInServerTime];

    NSLog(@"HPDateConfig.h 判断当前服务状态 %ld",val);
    
    

    
    
    
}



@end
