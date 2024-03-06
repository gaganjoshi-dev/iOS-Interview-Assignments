//
//  ContactImageDownloader.m
//  Yaye
//
//  Created by Gagan Joshi on 24/04/15.
//  Copyright (c) 2015 Gagan. All rights reserved.
//




#import "ArticleImageDownloader.h"
#import "Storage.h"
#import "DocumentsHelper.h"
#import "PersistentStore.h"


@interface ArticleImageDownloader ()
@property (nonatomic, readwrite, strong) Article *articleRecord;
@property (nonatomic,readwrite,  strong)  NSString *imageType;
@property (nonatomic,readwrite,  assign) CGSize   imageSize;


@end


@implementation ArticleImageDownloader
@synthesize delegate = _delegate;
@synthesize articleRecord = _articleRecord;



#pragma mark -
#pragma mark - Life Cycle

- (id)initWithArticleRecord:(Article *)record imageType:(NSString *)imageType andImageSize:(CGSize )imageSize delegate:(id<ArticleImageDownloaderDelegate>) theDelegate

{
    if (self = [super init])
    {
        // 2: Set the properties.
        self.delegate = theDelegate;
        self.articleRecord = record;
        self.imageType = imageType;
        self.imageSize = imageSize;
    }
    return self;
}

#pragma mark -
#pragma mark - Downloading image





- (void)main
{
    
    @autoreleasepool
    {
        if (self.isCancelled)
            return;
        
        
        NSString *urlString;
        
      
        
        CGFloat scale =UIScreen.mainScreen.scale;
        
        CGFloat widthImage = _imageSize.width *scale;
        CGFloat heightImage = _imageSize.height *scale;

        
       
        
        if ([_imageType isEqualToString:@"thumb"])
        {
            urlString =[NSString stringWithFormat:@"%@thumb=true&w=%f&h=%f&image=%@",KImageURL,widthImage,heightImage,_articleRecord.articleImageName];
  

        }
        else
        {
            
            urlString =[NSString stringWithFormat:@"%@thumb=false&w=%f&h=%f&image=%@",KImageURL,widthImage,heightImage,_articleRecord.articleImageName];

            
  
        }
              
       
        

        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];
        

        if (self.isCancelled)
        {
            imageData = nil;
            return;
        }
        
        if (imageData)
        {

            NSString *imagePath= [Storage imagePathWithImageType:_imageType andImageName:_articleRecord.articleImageName];
            
            

            
            if(![DocumentsHelper writeData:imageData toFile:imagePath])
            {
                NSLog(@"image Saving Failed");
            }
            
            if (self.delegate && [(NSObject*)self.delegate respondsToSelector:@selector(articleImageDownloaderDidFinish:)])
            {
                 [(NSObject *)self.delegate performSelectorOnMainThread:@selector(articleImageDownloaderDidFinish:) withObject:self waitUntilDone:NO];
            }

        }
        imageData = nil;
        
        if (self.isCancelled)
            return;
        
        
        
    }
}




@end
