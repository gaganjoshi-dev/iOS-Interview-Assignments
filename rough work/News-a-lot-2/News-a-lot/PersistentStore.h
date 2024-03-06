//
//  PersistentStore.h
//  Fieldo
//
//  Created by Gagan Joshi on 10/31/13.
//  Copyright (c) 2013 Gagan Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface PersistentStore : NSObject

+(void)setTitleFontSize:(NSString *)fontSize;
+(NSString *)getTitleFontSize;
+(void)setSubtitleFontSize:(NSString *)fontSize;
+(NSString *)getSubtitleFontSize;





+(void)setSortBy:(NSString *)sortBy;
+(NSString *)getSortBy;






@end
