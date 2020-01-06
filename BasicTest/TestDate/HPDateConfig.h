//
//  HPDateConfig.h
//  HPEnterpriseApp
//
//  Created by hpkj on 2018/8/6.
//  Copyright © 2018年 hpkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPDateConfig : NSObject
/**
 *  根据时间戳得到星期几
 *
 @param inputDate 日期
 @return 星期
 */
+ (NSString *)rq_weekdayStringFromDateString:(NSString  *)dateString;
//根据日期获取星期几
+ (NSString *)rq_weekdayStringFromDate:(NSDate *)inputDate;
+ (NSString *)rq_weekdayFromDateString:(NSString  *)dateString;
/**
 *  获取当地时间
 *
 @return
 */
+ (NSString *)rq_getCurrentTimeWithType:(NSString *)type;

/**
 *  将字符串转成NSDate类型
 *
 @param dateString 时间
 @return
 */
+ (NSDate *)rq_dateFromString:(NSString *)dateString  withFormat:(NSString  *)format;

/**
 *  传入今天的时间，返回明天的时间
 *
 @param aDate
 @return
 */
+ (NSString *)rq_GetTomorrowDay:(NSDate *)aDate;


/**
 *  传入今天的时间，返回明天的时间(原始)
 *
 @param aDate
 @return
 */
+ (NSString *)rq_getTomorrowDay:(NSDate *)aDate;
+ (NSString *) changeTime:(NSString *)str type:(NSString *)type;
//比较两个日期的大小
+ (NSInteger)compareDate:(NSString*)aDate withDate:(NSString*)bDate format:(NSString *)format;
#pragma mark -根据时间戳获取时间
+(NSString *)getTimeFromTimestamp:(NSString *)time timeType:(NSString *)type;
//时间格式转换
+ (NSString *)updateFromString:(NSString *)dateString withFormat:(NSString  *)format withChangeType:(NSString *)changeType;
//当前时间字符串(钟表上显示的时间)转为时间戳
+(NSString *)timeStamapFromLocalString:(NSString *)localString;
+ (NSTimeInterval)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime;

+ (BOOL)validateWithStartTime:(NSString *)startTime withExpireTime:(NSString *)expireTime;
+(NSInteger)judgeNowtimeIsInServerTime;
@end
