//
//  ArticleInfo.h
//  News-a-lot
//
//  Created by Gagan Joshi on 20/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Article.h"

@interface ArticleInfo : NSObject


@property (nullable, nonatomic, retain) NSNumber *articleID;
@property (nullable, nonatomic, retain) NSString *articleName;
@property (nullable, nonatomic, retain) NSString *articleSubtitle;
@property (nullable, nonatomic, retain) NSString *articleImageName;
@property (nullable, nonatomic, retain) NSString *articleDescription;
@property (nullable, nonatomic, retain) NSNumber *isImageDownloaded;
@property (nullable, nonatomic, retain) NSNumber *isGridImageDownloaded;


-(nullable id)initWithArticleInfo:(nullable Article *)article;



@end

