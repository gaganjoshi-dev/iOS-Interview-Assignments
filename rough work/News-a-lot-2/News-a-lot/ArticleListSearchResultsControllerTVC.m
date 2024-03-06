//
//  ScoopaContactsSearchResultsControllerTVC.m
//  Skoopa
//
//  Created by Gagan Joshi on 03/01/16.
//  Copyright © 2016 Gagan. All rights reserved.
//


#import "ArticleListSearchResultsControllerTVC.h"
#import "Article.h"
#import "Storage.h"

#define KBasicCell @"basicCell"






@implementation ArticleListSearchResultsControllerTVC





- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = kWhiteColor;
    self.tableView.dataSource= self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 200;

    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:KBasicCell];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Table view data source




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.filteredContacts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KBasicCell forIndexPath:indexPath];
    Article *article=self.filteredContacts[indexPath.row];
    
    
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
        
      
    }
    
    
    cell.textLabel.attributedText = attributedString;
    cell.textLabel.numberOfLines=0;
    
    return cell;
     
}

@end
