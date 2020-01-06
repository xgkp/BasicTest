//
//  HPUtils.m
//  E源充
//
//  Created by Pro on 2019/9/5.
//  Copyright © 2019 Pro. All rights reserved.
//

#import "HPUtils.h"


@implementation HPUtils

+ (BOOL) rq_isEmpty:(NSString*)str
{
    if (str == nil) {
        return TRUE;
    }
    
    if ([str isEqual:[NSNull null]]) {
        return TRUE;
    }
    
    if ([str isEqual:@"<null>"]) {
        return TRUE;
    }
    
    if ([str isEqual:@"(null)"]) {
        return TRUE;
    }
    
    
    if ([str isKindOfClass:[NSString class]]) {
        
        if (str.length == 0) {
            return TRUE;
        }
        
        NSString *str1 = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([str1 isEqual:@""]) {
            return TRUE;
        }
    }
    return FALSE;
}

+ (BOOL)rq_isNotEmpty:(NSString *)str
{
    return ![HPUtils rq_isEmpty:str];
}


+(void)addShadowWithView:(UIView *)view{
    view.layer.cornerRadius = 2;
//    view.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    view.layer.shadowColor = [UIColor whiteColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowOpacity = 0.3;
    view.clipsToBounds = NO;
    view.layer.shouldRasterize = NO;
    view.layer.shadowRadius = 3;//8;//阴影半径，默认3
}

+(void)phoneWithTel:(NSString *)phone{
    NSString * tel = [NSString stringWithFormat:@"tel:0898-88812345"];
    NSURL *url = [NSURL URLWithString:tel];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}
@end
