//
//  ArticleImageDownloader.h
//  Yaye
//
//  Created by Gagan Joshi on 24/04/15.
//  Copyright (c) 2015 Gagan. All rights reserved.
//




#import <Foundation/Foundation.h>


#import "Article.h"

@protocol ArticleImageDownloaderDelegate;

@interface ArticleImageDownloader : NSOperation

@property (nonatomic, weak) id <ArticleImageDownloaderDelegate> delegate;
@property (nonatomic, readonly, strong) Article *articleRecord;
@property (nonatomic,readonly,  strong) NSString *imageType;
@property (nonatomic, readonly, assign) CGSize   imageSize;




- (id)initWithArticleRecord:(Article *)record imageType:(NSString *)imageType andImageSize:(CGSize)imageSize delegate:(id<ArticleImageDownloaderDelegate>) theDelegate;

@end

@protocol ArticleImageDownloaderDelegate <NSObject>

@optional
- (void)articleImageDownloaderDidFinish:(ArticleImageDownloader *)downloader;


@end