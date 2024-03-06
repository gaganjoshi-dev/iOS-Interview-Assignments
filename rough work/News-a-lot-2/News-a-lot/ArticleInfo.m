//
//  ArticleInfo.m
//  News-a-lot
//
//  Created by Gagan Joshi on 20/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//

#import "ArticleInfo.h"

@implementation ArticleInfo


-(nullable id)initWithArticleInfo:(nullable Article *)article;
{
    if (self = [super init])
    {
        
        self.articleID = article.articleID;
        self.articleName = article.articleName;
        self.articleSubtitle = article.articleSubtitle;
        self.articleImageName = article.articleImageName;
        self.articleDescription = article.articleDescription;
        self.isImageDownloaded = article.isImageDownloaded;
        self.isGridImageDownloaded= article.isGridImageDownloaded;
      
    }
    return self;
 
}

@end
