//
//  ArticleDetailTVC.h
//  News-a-lot
//
// Created by Gagan Joshi on 19/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleInfo.h"


@interface ArticleDetailTVC : UITableViewController

{
    BOOL hasImage;
}
@property (nullable, nonatomic ,retain) ArticleInfo *articleInfo;



@end




