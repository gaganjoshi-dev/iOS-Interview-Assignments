//
//  Helper.m
//  Fieldo
//
//  Created by Gagan Joshi on 10/23/13.
//  Copyright (c) 2013 Gagan Joshi. All rights reserved.
//

#import "Helper.h"
#import "PersistentStore.h"

@implementation Helper













+(UIFont *)fontLightWithSize:(CGFloat)fontSize
{
    if (IS_IPHONE6)
    {
        fontSize = fontSize +1;
    }
    else if (IS_IPHONE6Plus)
    {
        fontSize = fontSize +2;
 
    }
    else
    {
        fontSize =fontSize;
    }
    return [UIFont fontWithName:@"Avenir-Book" size:fontSize];
}

+(UIFont *)fontMediumWithSize:(CGFloat)fontSize
{
    if (IS_IPHONE6)
    {
        fontSize = fontSize +1;
    }
    else if (IS_IPHONE6Plus)
    {
        fontSize = fontSize +2;
        
    }
    else
    {
        fontSize =fontSize;
    }

    return [UIFont fontWithName:@"Avenir-Medium" size:fontSize];
}

+(UIFont *)fontBoldWithSize:(CGFloat)fontSize
{
    if (IS_IPHONE6)
    {
        fontSize = fontSize +1;
    }
    else if (IS_IPHONE6Plus)
    {
        fontSize = fontSize +2;
        
    }
    else
    {
        fontSize =fontSize;
    }

    UIFont *font=[UIFont fontWithName:@"Avenir-Heavy" size:fontSize];
    return font;
}



















+(NSMutableAttributedString *)attributedStringForTitle:(NSString *)title andDetailTitle:(NSString *)detailTitle

{
    
    
    UIFont *titleFont = [Helper fontBoldWithSize:[[PersistentStore getTitleFontSize] intValue]];
    
    UIFont *subtitleFont = [Helper fontMediumWithSize:[[PersistentStore getSubtitleFontSize] intValue]];
    
    
    
    
    NSString *totalString = [NSString stringWithFormat:@"%@\n%@",title,detailTitle];
    
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:totalString];
    
    [attributedString addAttributes:@{
                                      NSFontAttributeName: titleFont ,
                                      NSForegroundColorAttributeName: kBlackColor
                                      }range:[totalString rangeOfString:title]];
    
    [attributedString addAttributes:@{
                                      NSFontAttributeName: subtitleFont,
                                      NSForegroundColorAttributeName: kDarkGrayColor
                                      }range:[totalString rangeOfString:detailTitle]];
    
    
    
    
    return attributedString;
    
}







+(NSMutableAttributedString *)attributedStringForTitle:(NSString *)title detailTitle:(NSString *)detailTitle andDescription:(NSString *)description

{
    
    UIFont *fontForSubtitle =[Helper fontLightWithSize:12];
    
    
    UIFont *fontForTitle =[Helper fontBoldWithSize:16];

   
    UIFont *fontForDescriptor =[Helper fontMediumWithSize:14];

    
    
  
    
    
    NSString *totalString = [NSString stringWithFormat:@"%@\n%@\n\n%@",title,detailTitle,description];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:totalString];

    
    [attributedString addAttributes:@{
                         NSFontAttributeName: fontForTitle ,
                         NSForegroundColorAttributeName: kBlackColor
                         }range:[totalString rangeOfString:title]];
    
    [attributedString addAttributes:@{
                         NSFontAttributeName: fontForSubtitle,
                         NSForegroundColorAttributeName: kDarkGrayColor
                         }range:[totalString rangeOfString:detailTitle]];
    

    
    [attributedString addAttributes:@{
                                      NSFontAttributeName: fontForDescriptor ,
                                      NSForegroundColorAttributeName: kBlackColor
                                      }range:[totalString rangeOfString:description]];
    
   
    
     
    return attributedString;
    
}



+(CGSize)articleImageSize
{
    static CGSize imageArticleSize;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        CGFloat width;
        if (IS_IPHONE6Plus)
        {
            width = 414;
        }
        else if (IS_IPHONE6)
        {
            width = 375;
        }
        else
        {
            width = 320;
        }
        
     
        imageArticleSize = CGSizeMake(width-20, (width-20) *.6);
        

    });
    return imageArticleSize;
}


+(CGSize)articleThumbSize
{
    static CGSize imageArticleThumbSize;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        CGFloat width;
        if (IS_IPHONE6Plus)
        {
            width = 414;
        }
        else if (IS_IPHONE6)
        {
            width = 375;
        }
        else
        {
            width = 320;
        }
        
        width = (width-40)/2;
        
        imageArticleThumbSize = CGSizeMake(width, width *.6);
        
        
    });
    return imageArticleThumbSize;
}






@end
