//
//  DocumentsHelper.h
//  Yaye
//
//  Created by Gagan Joshi on 15/06/15.
//  Copyright (c) 2015 Gagan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DocumentsHelper : NSObject


+(BOOL)writeData:(NSData *)data toFile:(NSString *)filePath;

@end
