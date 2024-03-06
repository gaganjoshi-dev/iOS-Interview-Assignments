//
//  GridViewController.h
//  News-a-lot
//
//  Created by Gagan Joshi on 13/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PendingOperations.h"
#import "ArticleImageDownloader.h"



@interface ArticleGridCVC : UICollectionViewController<NSFetchedResultsControllerDelegate,ArticleImageDownloaderDelegate>
{
NSFetchedResultsController *fetchedResultsController;

}


@property (nonatomic,strong) PendingOperations *pendingOperations;


@end
