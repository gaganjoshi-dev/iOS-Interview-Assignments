//
//  Article.h
//  News-a-lot
//
//  Created by Gagan Joshi on 13/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


NS_ASSUME_NONNULL_BEGIN

@interface Article : NSManagedObject

+(NSEntityDescription *)getArticleEntity;
+(void)addArticaleWithArticleDetail:(NSArray *)arrayArticle;


+(void)updateArticleGridImageDownloadedWithArticleID:(NSNumber *)articleID ;
+(void)updateArticleImageDownloadedWithArticleID:(NSNumber *)articleID ;


+(void)updateArticleThumbDownloadedWithArticleID:(NSNumber *)articleID;
+(void)deleteArticleWithArticleID:(NSNumber *)articleID;



@end

NS_ASSUME_NONNULL_END

#import "Article+CoreDataProperties.h"
