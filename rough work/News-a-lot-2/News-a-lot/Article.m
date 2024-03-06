//
//  Article.m
//  News-a-lot
//
//  Created by Gagan Joshi on 13/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//

#import "Article.h"
#import "AppDelegate.h"
#import "Storage.h"

@implementation Article


+(NSEntityDescription *)getArticleEntity
{
    
    return [NSEntityDescription entityForName:@"Article" inManagedObjectContext:[AppDelegate appDelegate].managedObjectContext];
}



+(void)addArticaleWithArticleDetail:(NSDictionary *)arrayArticle
{
    
    
    for (NSDictionary *articleInfo in arrayArticle)
    {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        request.entity = [self getArticleEntity];
        request.predicate = [NSPredicate predicateWithFormat:@"articleID == %@", [NSNumber numberWithInt:[articleInfo[@"id"] intValue]]];
        NSError *executeFetchError = nil;
        Article *article = [[[AppDelegate appDelegate].managedObjectContext executeFetchRequest:request error:&executeFetchError] lastObject];
        
        
        if (!article)
        {
            article = (Article *)[NSEntityDescription insertNewObjectForEntityForName:@"Article" inManagedObjectContext:[AppDelegate appDelegate].managedObjectContext];
            article.articleID = [NSNumber numberWithInt:[articleInfo[@"id"] intValue]];
            article.articleName = articleInfo[@"name"];
            article.articleSubtitle = articleInfo[@"subtitle"];
            article.articleImageName = articleInfo[@"image"];
            article.articleDescription = articleInfo[@"description"];
            article.isImageDownloaded = [NSNumber numberWithBool:NO];
            article.isGridImageDownloaded = [NSNumber numberWithBool:NO];

            article.isThumbDownloaded = [NSNumber numberWithBool:NO];
            article.isArticleDeleted = [NSNumber numberWithBool:NO];
        }
        else
        {
            article.articleName = articleInfo[@"name"];
            article.articleSubtitle = articleInfo[@"subtitle"];
            article.articleDescription = articleInfo[@"description"];
        }
        
 
    }
    
    NSError *error;
    if (![[AppDelegate appDelegate].managedObjectContext save:&error])
    {
      
    }

}




+(void)updateArticleGridImageDownloadedWithArticleID:(NSNumber *)articleID
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [self getArticleEntity];
    request.predicate = [NSPredicate predicateWithFormat:@"articleID == %@", articleID];
    NSError *executeFetchError = nil;
    Article *article = [[[AppDelegate appDelegate].managedObjectContext executeFetchRequest:request error:&executeFetchError] lastObject];
    
    
    if (article)
    {
        
        article.isGridImageDownloaded = [NSNumber numberWithBool:YES];
        
        NSError *error;
        
        
        if (![[AppDelegate appDelegate].managedObjectContext save:&error])
        {
            
        }
        
        
        
    }

}
+(void)updateArticleImageDownloadedWithArticleID:(NSNumber *)articleID
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [self getArticleEntity];
    request.predicate = [NSPredicate predicateWithFormat:@"articleID == %@", articleID];
    NSError *executeFetchError = nil;
    Article *article = [[[AppDelegate appDelegate].managedObjectContext executeFetchRequest:request error:&executeFetchError] lastObject];
    
    
    if (article)
    {
        
        article.isImageDownloaded = [NSNumber numberWithBool:YES];
        
        NSError *error;
        
        
        if (![[AppDelegate appDelegate].managedObjectContext save:&error])
        {
            
        }
        
        
        
    }

}





+(void)updateArticleThumbDownloadedWithArticleID:(NSNumber *)articleID
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [self getArticleEntity];
    request.predicate = [NSPredicate predicateWithFormat:@"articleID == %@", articleID];
    NSError *executeFetchError = nil;
    Article *article = [[[AppDelegate appDelegate].managedObjectContext executeFetchRequest:request error:&executeFetchError] lastObject];
    
    
    if (article)
    {
        
        article.isThumbDownloaded = [NSNumber numberWithBool:YES];
        
        NSError *error;
        
        
        if (![[AppDelegate appDelegate].managedObjectContext save:&error])
        {
            
        }
        
        
        
    }
}

+(void)deleteArticleWithArticleID:(NSNumber *)articleID
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [self getArticleEntity];
    request.predicate = [NSPredicate predicateWithFormat:@"articleID == %@", articleID];
    NSError *executeFetchError = nil;
    Article *article = [[[AppDelegate appDelegate].managedObjectContext executeFetchRequest:request error:&executeFetchError] lastObject];
    
    
    if (article)
    {
        
        
        [Storage deleteImagesWithImageName:article.articleImageName];

        article.isArticleDeleted = [NSNumber numberWithBool:YES];
        
        NSError *error;
        
        
        if (![[AppDelegate appDelegate].managedObjectContext save:&error])
        {
            
        }
        
   
    }
    
    
}





@end
