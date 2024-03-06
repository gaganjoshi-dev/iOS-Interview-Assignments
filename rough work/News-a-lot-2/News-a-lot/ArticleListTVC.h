
//
//  ListViewController.h
//  News-a-lot
//
//  Created by Gagan Joshi on 13/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleListSearchResultsControllerTVC.h"
#import "PendingOperations.h"
#import "ArticleImageDownloader.h"


@interface ArticleListTVC : UITableViewController<NSFetchedResultsControllerDelegate,UISearchBarDelegate,UISearchResultsUpdating,UISearchControllerDelegate,ArticleImageDownloaderDelegate>
{
    NSFetchedResultsController *fetchedResultsController;

}


@property (nonatomic, strong) ArticleListSearchResultsControllerTVC *searchResultsController;
@property (nonatomic, strong) NSArray *searchResults;

@property (nonatomic, strong) UISearchController *searchController;


@property (nonatomic,strong) PendingOperations *pendingOperations;


@end
