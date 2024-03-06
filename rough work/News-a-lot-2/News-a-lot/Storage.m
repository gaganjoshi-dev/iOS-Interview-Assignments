//
//  Storage.m
//  Yaye
//
//  Created by Gagan Joshi on 23/11/14.
//  Copyright (c) 2014 Gagan. All rights reserved.
//

#import "Storage.h"
#import "Helper.h"

@implementation Storage




+(BOOL)isFolderExist:(NSString *)filePath
{
    BOOL isDir;
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDir];
    
    if (fileExists && isDir)
        return YES;
    
    return NO;
    
    
}









+(NSString *)documentsDirectory
{

    NSArray   *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString  *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+(NSString *)pathOfFile:(NSString *)fileName
{
    NSString *filePath= [[NSString alloc] initWithFormat:@"%@/%@", [self documentsDirectory],fileName];
    return filePath;
    
}





+(NSString *)imagePathWithImageType:(NSString *)imageType  andImageName:(NSString *)imageName
{
    NSError *error;
    NSString *path = [Storage pathOfFile:@"images"];

    if (![self isFolderExist:path])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSString *dataPath= [NSString stringWithFormat:@"%@/%@",path,imageType];
    
    if (![self isFolderExist:dataPath])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&error];
        
    }
    
    NSString *imagePath= [NSString stringWithFormat:@"%@/%@",dataPath,imageName];
    return imagePath;
    
    
}




+(void)deleteImagesWithImageName:(NSString *)imageName
{

    NSString *imagePathThumb = [self imagePathWithImageType:@"thumb" andImageName:imageName];
    NSString *imagePathSmall = [self imagePathWithImageType:@"small" andImageName:imageName];
    NSString *imagePathImage = [self imagePathWithImageType:@"image" andImageName:imageName];

    
    if ([[NSFileManager defaultManager] fileExistsAtPath:imagePathThumb])
    {
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:imagePathThumb error:&error];
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:imagePathSmall])
    {
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:imagePathSmall error:&error];
    }

    if ([[NSFileManager defaultManager] fileExistsAtPath:imagePathImage])
    {
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:imagePathImage error:&error];
    }

    
}




@end
