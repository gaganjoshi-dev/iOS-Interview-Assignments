//
//  Helper.h
//  Fieldo
//
//  Created by Gagan Joshi on 10/23/13.
//  Copyright (c) 2013 Gagan Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface Helper : NSObject



+(UIFont *)fontLightWithSize:(CGFloat)fontSize;
+(UIFont *)fontMediumWithSize:(CGFloat)fontSize;
+(UIFont *)fontBoldWithSize:(CGFloat)fontSize;
+(NSMutableAttributedString *)attributedStringForTitle:(NSString *)title andDetailTitle:(NSString *)detailTitle;
+(NSMutableAttributedString *)attributedStringForTitle:(NSString *)title detailTitle:(NSString *)detailTitle andDescription:(NSString *)description;

+(CGSize)articleImageSize;
+(CGSize)articleThumbSize;



@end

