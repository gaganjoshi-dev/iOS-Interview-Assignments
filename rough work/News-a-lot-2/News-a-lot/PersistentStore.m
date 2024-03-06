//
//  PersistentStore.m
//  Fieldo
//
//  Created by Gagan Joshi on 10/31/13.
//  Copyright (c) 2013 Gagan Joshi. All rights reserved.
//

#import "PersistentStore.h"

@implementation PersistentStore


+(void)setTitleFontSize:(NSString *)fontSize
{
    [[NSUserDefaults standardUserDefaults] setObject:fontSize forKey:@"titleFontSize"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(NSString *)getTitleFontSize
{
    
    if ( ![[NSUserDefaults standardUserDefaults] objectForKey:@"titleFontSize"] )
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"14" forKey:@"titleFontSize"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        return @"14";
    }
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"titleFontSize"] ;

}



+(void)setSubtitleFontSize:(NSString *)fontSize
{
    [[NSUserDefaults standardUserDefaults] setObject:fontSize forKey:@"subtitleFontSize"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(NSString *)getSubtitleFontSize
{
    
    if ( ![[NSUserDefaults standardUserDefaults] objectForKey:@"subtitleFontSize"] )
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"12" forKey:@"subtitleFontSize"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        return @"12";
    }
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"subtitleFontSize"] ;
    
}







+(void)setSortBy:(NSString *)sortBy
{
    [[NSUserDefaults standardUserDefaults] setObject:sortBy forKey:@"sortBy"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
+(NSString *)getSortBy
{
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"sortBy"] )
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"ID" forKey:@"sortBy"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        return @"ID";
    }
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"sortBy"];
}






@end
