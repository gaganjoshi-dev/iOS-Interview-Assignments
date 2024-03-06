//
//  DocumentsHelper.m
//  Yaye
//
//  Created by Gagan Joshi on 15/06/15.
//  Copyright (c) 2015 Gagan. All rights reserved.
//

#import "DocumentsHelper.h"

@implementation DocumentsHelper

+(BOOL)writeData:(NSData *)data toFile:(NSString *)filePath
{
    NSError *error;
    if ([data writeToFile:filePath options:NSDataWritingAtomic error:&error])
    {
    [self addSkipBackupAttributeToItemAtPath:filePath];
    return YES;
    }
    else
    {
        return NO;
    }
    
  
}




+(BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)filePathString
{
    NSURL *fileURL = [NSURL fileURLWithPath:filePathString];
    
    assert([[NSFileManager defaultManager] fileExistsAtPath: [fileURL path]]);
    
    NSError *error = nil;
    
    BOOL success = [fileURL setResourceValue:[NSNumber numberWithBool: YES]
                                      forKey: NSURLIsExcludedFromBackupKey
                                       error: &error];
    return success;
}



@end
