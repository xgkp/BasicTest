//
//  NSDate+Change.h
//  E源充
//
//  Created by hpkj on 2019/10/30.
//  Copyright © 2019 Pro. All rights reserved.
//

//#import <AppKit/AppKit.h>
#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Change)
//日期格式化
+(NSDateFormatter *)dateFormatWith:(NSString *)formatStr;

//获取当前时间戳
+(NSString *)getNowTimestamp;

//将时间转换为时间戳
+ (NSString *)dateToTimestamp:(NSDate *)date;

//将时间转换为时间字符串
+ (NSString *)dateToTimeStr:(NSDate *)date;

//将时间戳转换为时间
+ (NSDate *)timestampToDate:(CGFloat)timestamp;

//将时间字符串转换为时间戳
+ (NSString *)timeStrToTimestamp:(NSString *)timeStr;

//将时间字符串转换为时间
+ (NSDate *)timeStrToDate:(NSString *)timeStr;

//将时间戳转换为时间字符串格式是 YYYY-MM-dd HH:mm:ss
+ (NSString *)timestampToTimeStr:(CGFloat)timestamp;
//将时间戳转换为时间字符串格式是 YYYY/MM/dd HH:mm ss
+ (NSString *)timestampToTypeTimStr:(CGFloat)timestamp;
//将时间戳转换为时间字符串格式是 YYYY.MM.dd
+ (NSString *)timestampToPointTimStr:(CGFloat)timestamp;

@end

NS_ASSUME_NONNULL_END
