//
//  Storage.h
//  Yaye
//
//  Created by Gagan Joshi on 23/11/14.
//  Copyright (c) 2014 Gagan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Storage : NSObject




+(NSString *)documentsDirectory;
+(NSString *)pathOfFile:(NSString *)fileName;





+(NSString *)imagePathWithImageType:(NSString *)imageType  andImageName:(NSString *)imageName;

+(void)deleteImagesWithImageName:(NSString *)imageName;

@end
