//
//  ListViewController.m
//  News-a-lot
//
//  Created by Gagan Joshi on 13/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//

#import "ArticleListTVC.h"
#import "Article.h"
#import "AppDelegate.h"
#import "ArticleDetailTVC.h"
#import "Storage.h"

#define KBasicCell @"basicCell"

@interface ArticleListTVC ()

@end

@implementation ArticleListTVC


- (IBAction)sortList:(id)sender
{
    
    
    if ([[PersistentStore getSortBy] isEqualToString:@"ID"])
    {
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Sort airtcle list" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Sort By Name" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                    {
                                      
                                            
                                            [PersistentStore setSortBy:@"Name"];
                                            fetchedResultsController = nil;
                                            [self.tableView reloadData];

                                            
                                        
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
                                        [self.tableView reloadData];

                                     
                                    }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
      

    }

    
 }


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


#pragma mark fetchedResultsController delegates

-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    
    [self.tableView endUpdates];
    
    
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    
    switch (type)
    {
        case NSFetchedResultsChangeInsert:
        {
            
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:NO];
            break;
        }
            
        case NSFetchedResultsChangeDelete:
        {
            
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:NO];
            break;
        }
        case NSFetchedResultsChangeUpdate:
        {
            
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:NO];
            break;
            
        }
            
        case NSFetchedResultsChangeMove:
        {
            
            [self.tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];

            break;
        }
    }
    
    
}






- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    

    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 200;
    
    
    [APICommunicator postRequestToGetAllContacts];
    
    
    
    _searchResultsController = [[ArticleListSearchResultsControllerTVC alloc] init];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_searchResultsController];
    
    
    
    
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.placeholder = @"Search artical";
    
    [self.searchController.searchBar sizeToFit];
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.tableView reloadData];
    
    self.searchResultsController.tableView.delegate = self;
    self.searchResultsController.tableView.backgroundColor = kWhiteColor;
    
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = YES;
    self.searchController.searchBar.delegate = self;
    
    
    self.definesPresentationContext = YES;
    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:@"ReloadTableView" object:nil];

    
    
    
   
}


-(void)reloadTableView
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self fetchedResultsController].fetchedObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KBasicCell forIndexPath:indexPath];
    


   
   
    Article *article=[[self fetchedResultsController] objectAtIndexPath:indexPath];
    
    
    NSMutableAttributedString *attributedString = [Helper attributedStringForTitle:article.articleName andDetailTitle:article.articleSubtitle ];
    

    
    
    
    if ([article.isThumbDownloaded boolValue])
    {
        NSString *imagePath = [Storage imagePathWithImageType:@"thumb" andImageName:article.articleImageName];
        
        
        
        NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
        UIImage *imageCell = [UIImage imageWithData:imageData scale:[[UIScreen mainScreen] scale]];

        cell.imageView.image =  imageCell;
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"placeHolderThumb"];

        
        
        
        [self startMediaDownloadingForRecord:article andSize:CGSizeMake(50, 50)];
        
    }
    
    
    cell.textLabel.attributedText = attributedString;
    
   
   
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    Article *article;
    
    if (tableView == self.searchResultsController.tableView)
    {
        
        NSArray *array= self.searchResultsController.filteredContacts;
        
        article= array[indexPath.row];
        
    }
    else
    {
        article=[[self fetchedResultsController] objectAtIndexPath:indexPath];

    }
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ArticleDetailTVC* detailsVC = (ArticleDetailTVC *) [mainStoryboard instantiateViewControllerWithIdentifier:@"showArticleDetail"];
    detailsVC.articleInfo = [[ArticleInfo alloc] initWithArticleInfo:article];
    
    UINavigationController *navigate = [[UINavigationController alloc] initWithRootViewController:detailsVC];
    
    [self presentViewController:navigate animated:YES completion:nil];
    
        

}


#pragma mark - Table view delegate


#pragma mark - UISearchControllerDelegate

- (void)presentSearchController:(UISearchController *)searchController {
    
}

- (void)willPresentSearchController:(UISearchController *)searchController {
    self.navigationController.navigationBar.translucent = YES;
    
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    
    
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    self.navigationController.navigationBar.translucent = NO;
    
}

- (void)didDismissSearchController:(UISearchController *)searchController
{
    
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
    NSString *searchText = searchController.searchBar.text;
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [fetchedResultsController.sections objectAtIndex:0];
    
    if (searchText == nil) {
        
        self.searchResults = [sectionInfo.objects mutableCopy];
        
    } else {
        
      
        
        
        NSPredicate * predicate = [NSPredicate predicateWithFormat:@"articleName CONTAINS[cd] %@ OR articleSubtitle CONTAINS[cd] %@ ",searchText,searchText];
        NSArray *arrayFetched = [self fetchedResultsController].fetchedObjects;
         NSMutableArray *searchResults = (NSMutableArray *)[arrayFetched filteredArrayUsingPredicate:predicate];
        
        
        
        
        
        self.searchResults = searchResults;
        
    }
    
    ArticleListSearchResultsControllerTVC *tableController = (ArticleListSearchResultsControllerTVC *)self.searchController.searchResultsController;
    tableController.filteredContacts = self.searchResults;
    [tableController.tableView reloadData];
}



-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ReloadTableView" object:nil];
}



#pragma mark - Convenience

-(UINib*) nibWithName:(NSString*) nibName
{
    return [UINib nibWithNibName:nibName bundle:nil];
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
     
        ArticleImageDownloader *imageDownloader = [[ArticleImageDownloader alloc] initWithArticleRecord:articleRecord imageType:@"thumb" andImageSize:imageSize delegate:self];
        
        NSString *stringKey=[articleRecord.articleID stringValue];
        [self.pendingOperations.downloadsInProgress setObject:imageDownloader forKey:stringKey];
        [self.pendingOperations.downloadQueue addOperation:imageDownloader];
    }
    
}


- (void)articleImageDownloaderDidFinish:(ArticleImageDownloader *)downloader
{
    Article *theRecord = downloader.articleRecord;
    
    NSString *stringKey=[theRecord.articleID stringValue];
    
    
    [Article updateArticleThumbDownloadedWithArticleID:theRecord.articleID];
    
    
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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView beginUpdates];
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        Article *article=[[self fetchedResultsController] objectAtIndexPath:indexPath];
        
        [Article deleteArticleWithArticleID:article.articleID];
    }
    
    
    [tableView endUpdates];
    
}





@end
