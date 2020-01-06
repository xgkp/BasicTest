//
//  HPDateConfig.m
//  HPEnterpriseApp
//
//  Created by hpkj on 2018/8/6.
//  Copyright © 2018年 hpkj. All rights reserved.
//

#import "HPDateConfig.h"

@implementation HPDateConfig
+ (NSString *)rq_weekdayStringFromDateString:(NSString  *)dateString {
    NSTimeInterval time=[dateString doubleValue];
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:time/1000];//毫秒
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *weekdayComponents =
    [gregorian components:NSCalendarUnitWeekday fromDate:date];
    NSInteger _weekday = [weekdayComponents weekday];
    NSString *weekStr;
    if (_weekday == 1) {
        weekStr = @"星期日";
    }else if (_weekday == 2){
        weekStr = @"星期一";
    }else if (_weekday == 3){
        weekStr = @"星期二";
    }else if (_weekday == 4){
        weekStr = @"星期三";
    }else if (_weekday == 5){
        weekStr = @"星期四";
    }else if (_weekday == 6){
        weekStr = @"星期五";
    }else if (_weekday == 7){
        weekStr = @"星期六";
    }
    return weekStr;
}

+ (NSString *)rq_weekdayFromDateString:(NSString  *)dateString {
    NSTimeInterval time=[dateString doubleValue];
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:time/1000];//毫秒
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *weekdayComponents =
    [gregorian components:NSCalendarUnitWeekday fromDate:date];
    NSInteger _weekday = [weekdayComponents weekday];
    NSString *weekStr;
    if (_weekday == 1) {
        weekStr = @"周日";
    }else if (_weekday == 2){
        weekStr = @"周一";
    }else if (_weekday == 3){
        weekStr = @"周二";
    }else if (_weekday == 4){
        weekStr = @"周三";
    }else if (_weekday == 5){
        weekStr = @"周四";
    }else if (_weekday == 6){
        weekStr = @"周五";
    }else if (_weekday == 7){
        weekStr = @"周六";
    }
    return weekStr;
}
+ (NSString *)rq_weekdayStringFromDate:(NSDate *)inputDate {
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"Sunday", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}


+ (NSString *)rq_getCurrentTimeWithType:(NSString *)type{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:type];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}

+ (NSDate *)rq_dateFromString:(NSString *)dateString withFormat:(NSString  *)format{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: format];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}
//时间格式转换
+ (NSString *)updateFromString:(NSString *)dateString withFormat:(NSString  *)format withChangeType:(NSString *)changeType{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [dateFormatter2 setDateFormat:changeType];
    NSString * date=[dateFormatter2 stringFromDate:destDate];
    return date;
}
+ (NSString *)rq_GetTomorrowDay:(NSDate *)aDate {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"MM月dd日"];
    return [dateday stringFromDate:beginningOfWeek];
}

+ (NSString *)rq_getTomorrowDay:(NSDate *)aDate {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-MM-dd"];
    return [dateday stringFromDate:beginningOfWeek];
}

//比较两个日期的大小 
+ (NSInteger)compareDate:(NSString*)aDate withDate:(NSString*)bDate format:(NSString *)format
{
   //yyyy年MM月dd日
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:format];
    NSDate *dta = [[NSDate alloc] init];
    NSDate *dtb = [[NSDate alloc] init];
    
    dta = [dateformater dateFromString:aDate];
    dtb = [dateformater dateFromString:bDate];
    NSComparisonResult result = [dta compare:dtb];
    if (result==NSOrderedAscending)
    {
        //bDate比aDate大
        return -1;
    } else if (result == NSOrderedDescending){
       
        return 1;
    }else{
        return 0;
    }
  
}

/**
 *  时间格式化处理
 *
 *  @param str 字符串
 *
 *  @return 字符串
 */
+ (NSString *) changeTime:(NSString *)str{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:localTimeZone];
    NSDate *dateFormatted = [dateFormatter dateFromString:str];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    return dateString;
   
}
/**
 *  utc时间转换本地时间
 *
 *  @param str 字符串
 *
 *  @return 字符串
 */
+ (NSString *) changeTime:(NSString *)str type:(NSString *)type{
    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    //输入格式
//    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
//    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
//    [dateFormatter setTimeZone:localTimeZone];
//    NSDate *dateFormatted = [dateFormatter dateFromString:str];
//    //输出格式
//    [dateFormatter setDateFormat:type];
//    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:type];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[str doubleValue]/1000];
    NSString *dateString = [formatter stringFromDate:confromTimesp];
    return dateString;
    
}
//当前时间字符串(钟表上显示的时间)转为时间戳
+(NSString *)timeStamapFromLocalString:(NSString *)localString{
    //先将UTC字符串转为UTCDate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSDate *UTCDate = [dateFormatter dateFromString:localString];
    
    NSTimeInterval timeInterval = [UTCDate timeIntervalSince1970];
    // *1000,是精确到毫秒；这里是精确到秒;
    NSString *result = [NSString stringWithFormat:@"%.0f",timeInterval *1000];
    return result;
}
#pragma mark -根据时间戳获取时间
+(NSString *)getTimeFromTimestamp:(NSString *)time timeType:(NSString *)type{
    NSTimeInterval interval    =[time doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:type];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}
+ (NSTimeInterval)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//根据自己的需求定义格式
    NSDate* startDate = [formater dateFromString:starTime];
    NSDate* endDate = [formater dateFromString:endTime];
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}

/**
 *  判断当前时间是否处于某个时间段内
 *
 *  @param startTime        开始时间
 *  @param expireTime       结束时间
 */

+ (BOOL)validateWithStartTime:(NSString *)startTime withExpireTime:(NSString *)expireTime {
    NSDate *today = [NSDate date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // 时间格式,此处遇到过坑,建议时间HH大写,手机24小时进制和12小时禁止都可以完美格式化
    [dateFormat setDateFormat:@"HH:mm"];
    
    NSDate *start = [dateFormat dateFromString:startTime];
    NSDate *expire = [dateFormat dateFromString:expireTime];
    
    if ([today compare:start] == NSOrderedDescending && [today compare:expire] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}
+(NSInteger)judgeNowtimeIsInServerTime
{
//    NSLog(@"successful");
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[dat timeIntervalSince1970];
    
    NSString * timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    
    // NSLog(@"当前时间戳 字符串格式 == %@",timeString);
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    
    
    NSString * hAndmAnds = [dateString substringFromIndex:11];
    //    NSLog(@"时分秒 = %@",hAndmAnds);
    
    NSString * h = [hAndmAnds substringToIndex:2];
    //    NSLog(@"时 = %@",h);
    
    NSString * mAnds = [hAndmAnds substringFromIndex:3];
    //    NSLog(@"分和秒 = %@",mAnds);
    
    NSString * m = [mAnds substringToIndex:2];
    
    //    NSLog(@"分 = %@",m);
    
    
    NSString * s = [mAnds substringFromIndex:3];
    
    //    NSLog(@"秒 = %@",s);
    
    
    double dh = [h doubleValue] * 3600;
    double dm = [m doubleValue] * 60;
    double ds = [s doubleValue];
    
    //    今天零点的时间戳
    double  startTime = [timeString doubleValue] - dh - dm - ds;
    
    //当前时间戳
    
    double nowTime = [timeString doubleValue];
    
    //    今天24点的时间戳
    double  endTime = [timeString doubleValue] - dh - dm - ds + 86400.0;
    
    
    
    if(endTime > startTime)
    {
        //    测试时间戳大小比较（浮点型）
    }
    
    if(nowTime > endTime)
    {
        //    测试时间戳大小比较（浮点型）
    }
    
    //    NSLog(@"\n今天0点的时间戳：%f \n当前时间戳: %f\n今天24点的时间戳：%f",startTime,nowTime,endTime);
    
    double time5Point =  startTime + 18000.0;
    
    double time23Point =  startTime + 82800.0;
    
    //    NSLog(@"\n今天5点的时间戳 %f \n 今天23点时间戳 %f",time5Point,time23Point);
    
    if (nowTime <= time5Point) {
        //        0点到5点
        return 1;
    }else if(nowTime >= time23Point)
    {
        //        23点到24点
        return 2;
    }else
    {
        //        5点到23点
        return 3;
    }
    
    
}
@end
