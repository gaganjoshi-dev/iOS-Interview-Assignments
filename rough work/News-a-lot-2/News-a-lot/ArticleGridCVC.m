//
//  GridViewController.m
//  News-a-lot
//
//  Created by Gagan Joshi on 13/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//

#import "ArticleGridCVC.h"
#import "Article.h"
#import "AppDelegate.h"
#import "Storage.h"
#import "ArticleDetailTVC.h"

#define kGridItemIndentfier @"gridItemIndentfier"

#define KArticleImageTag         101
#define KArticleDetailTag         102


@interface ArticleGridCVC ()

@end

@implementation ArticleGridCVC




#pragma mark fetchedResultsController

- (NSFetchedResultsController *)fetchedResultsController
{
    if (fetchedResultsController == nil)
    {
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        request.entity = [Article getArticleEntity];
        
        request.predicate = [NSPredicate predicateWithFormat:@"isArticleDeleted = NO"];
        
        
        
        if ([[PersistentStore getSortBy] isEqualToString:@"ID"])
        {
            
            NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"articleID" ascending:YES];
            [request setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor1,nil]];
            
        }
        else
        {
            
            
            NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"articleName" ascending:YES];
            [request setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor1,nil]];
            
            
        }
        
        
        
        
        
        
        
        fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[AppDelegate appDelegate].managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        [fetchedResultsController setDelegate:self];
        
        NSError *error = nil;
        if (![fetchedResultsController performFetch:&error])
        {
            NSLog(@"%@",[error localizedDescription]);
        }
    }
    
    return fetchedResultsController;
}




-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    
    switch (type)
    {
        case NSFetchedResultsChangeInsert:
        {
            
            
            [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]];
            
            break;
        }
            
        case NSFetchedResultsChangeDelete:
        {
            
            
            [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];

            break;
        }
        case NSFetchedResultsChangeUpdate:
        {
            

            [self.collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:indexPath] ];
            break;
            
        }
            
        case NSFetchedResultsChangeMove:
            
            break;
            
    }
    
    
}






- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:@"ReloadTableView" object:nil];
}

-(void)reloadTableView
{
    [self.collectionView reloadData];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self fetchedResultsController].fetchedObjects count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kGridItemIndentfier forIndexPath:indexPath];

    Article *article=[[self fetchedResultsController] objectAtIndexPath:indexPath];
    
    NSMutableAttributedString *attributedString = [Helper attributedStringForTitle:article.articleName andDetailTitle:article.articleSubtitle];

    
    
    UIImageView *imageViewCell = (UIImageView *)[cell.contentView viewWithTag:KArticleImageTag];
    UILabel *labelArticleDetail = (UILabel *)[cell.contentView viewWithTag:KArticleDetailTag];

    
    
  
    if ([article.isGridImageDownloaded boolValue])
    {
        NSString *imagePath = [Storage imagePathWithImageType:@"small" andImageName:article.articleImageName];
        
        NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
        UIImage *imageCell = [UIImage imageWithData:imageData scale:[[UIScreen mainScreen] scale]];
        

        imageViewCell.image = imageCell;
    }
    else
    {
        imageViewCell.image = [UIImage imageNamed:@"placeHolderSmall"];
        
        
        CGSize articleThumbImage = [Helper articleThumbSize];
        

        
        [self startMediaDownloadingForRecord:article andSize:articleThumbImage];
        
    }
    
    labelArticleDetail.attributedText = attributedString;

    cell.backgroundColor = kWhiteColor;
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
    Article *article  =[[self fetchedResultsController] objectAtIndexPath:indexPath];

    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ArticleDetailTVC* detailsVC = (ArticleDetailTVC *) [mainStoryboard instantiateViewControllerWithIdentifier:@"showArticleDetail"];
    detailsVC.articleInfo = [[ArticleInfo alloc] initWithArticleInfo:article];
    
    UINavigationController *navigate = [[UINavigationController alloc] initWithRootViewController:detailsVC];
    
    [self presentViewController:navigate animated:YES completion:nil];
    

    
}



#pragma mark NsOperation Queue group
- (PendingOperations *)pendingOperations
{
    if (!_pendingOperations)
    {
        _pendingOperations = [[PendingOperations alloc] init];
    }
    return _pendingOperations;
}

- (void)startMediaDownloadingForRecord:(Article *)articleRecord andSize:(CGSize)imageSize
{
    if (![self.pendingOperations.downloadsInProgress.allKeys containsObject:articleRecord.articleID])
    {
        
        ArticleImageDownloader *imageDownloader = [[ArticleImageDownloader alloc] initWithArticleRecord:articleRecord imageType:@"small" andImageSize:imageSize delegate:self];
        
        NSString *stringKey=[articleRecord.articleID stringValue];
        [self.pendingOperations.downloadsInProgress setObject:imageDownloader forKey:stringKey];
        [self.pendingOperations.downloadQueue addOperation:imageDownloader];
    }
    
}


- (void)articleImageDownloaderDidFinish:(ArticleImageDownloader *)downloader
{
    Article *theRecord = downloader.articleRecord;
    
    NSString *stringKey=[theRecord.articleID stringValue];
    
    
    [Article updateArticleGridImageDownloadedWithArticleID:theRecord.articleID];
    
    
    
    [self.pendingOperations.downloadsInProgress removeObjectForKey:stringKey];
    
    
    
}








#pragma mark - Cancelling, suspending, resuming queues / operations
- (void)suspendAllOperations
{
    [self.pendingOperations.downloadQueue setSuspended:YES];
    
}

- (void)resumeAllOperations {
    [self.pendingOperations.downloadQueue setSuspended:NO];
    
}

- (void)cancelAllOperations {
    [self.pendingOperations.downloadQueue cancelAllOperations];
    
}







- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

 
    CGSize articleThumbSize = [Helper articleThumbSize];
    return CGSizeMake(articleThumbSize.width, articleThumbSize.height+100);

    
}


#pragma mark <UICollectionViewDelegate>


#pragma mark - Convenience

-(UINib*) nibWithName:(NSString*) nibName
{
    return [UINib nibWithNibName:nibName bundle:nil];
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ReloadTableView" object:nil];
    
}


- (IBAction)sortGrid:(id)sender {
    
    
    if ([[PersistentStore getSortBy] isEqualToString:@"ID"])
    {
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Sort airtcle list" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Sort By Name" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                    {
                                        
                                        
                                        [PersistentStore setSortBy:@"Name"];
                                        fetchedResultsController = nil;
                                        [self.collectionView reloadData];
                                        
                                        
                                        
                                    }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
        
    }
    else
    {
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Sort airtcle list" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Sort By ID" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                    {
                                        
                                        [PersistentStore setSortBy:@"ID"];
                                        fetchedResultsController = nil;
                                        [self.collectionView reloadData];
                                        
                                        
                                    }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
        
        
    }

}


@end
