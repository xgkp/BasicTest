//
//  HPUtils.h
//  E源充
//
//  Created by Pro on 2019/9/5.
//  Copyright © 2019 Pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HPUtils : NSObject

+ (BOOL) rq_isEmpty:(NSString*)str;

+ (BOOL) rq_isNotEmpty:(NSString*)str;

+(void)addShadowWithView:(UIView *)view;

+(void)phoneWithTel:(NSString *)phone;

@end

NS_ASSUME_NONNULL_END
