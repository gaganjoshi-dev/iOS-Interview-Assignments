//
//  ArticleDetailTVC.m
//  News-a-lot
//
//  Created by Gagan Joshi on 19/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//

#import "ArticleDetailTVC.h"

#import "Storage.h"


#define kArticleDetailCell @"articleDetailCell"
#define kArticleImageCell @"articleImageCell"


#define KArticleImageTag         101
#define KActivityTag             102


@interface ArticleDetailTVC ()

{
    
   
    UIActivityIndicatorView *activityIndicatorView;
}

@end

@implementation ArticleDetailTVC




-(void)goBack
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)deleteArticle
{
    [Article deleteArticleWithArticleID:self.articleInfo.articleID];
    [self goBack];
}


-(void)navigationControllerNavigationBar
{
    
    self.title=@"Article Details";

    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    self.navigationController.navigationBar.translucent=NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(deleteArticle)];
    

    
    
    
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    hasImage=YES;
    [self navigationControllerNavigationBar];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 150;
    

   [self downloadImageFromServer];

    
    


}





-(void)downloadImageFromServer
{
    
    
    
    NSString *imagePath = [Storage imagePathWithImageType:@"image" andImageName:_articleInfo.articleImageName];
    
    
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:imagePath])
    {
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        dispatch_async(queue, ^
                       {
                  
                           
                          CGSize imageSize=[Helper articleImageSize];
 
                           CGFloat scale =UIScreen.mainScreen.scale;
                           
                           CGFloat widthImage = imageSize.width *scale;
                           CGFloat heightImage = imageSize.height *scale;
                           
                    
                           NSString *urlString =[NSString stringWithFormat:@"%@thumb=false&w=%f&h=%f&image=%@",KImageURL,widthImage,heightImage,self.articleInfo.articleImageName];
                           
                           
                           NSData *imageData=[[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];
                          

                           
                           dispatch_async(dispatch_get_main_queue(), ^
                                          {
                                              
                                              [imageData writeToFile:imagePath atomically:YES];

                                              
                                              
                                              self.articleInfo.isImageDownloaded = [NSNumber numberWithBool:YES];

                                              [Article updateArticleImageDownloadedWithArticleID:self.articleInfo.articleID];
                                              
                                              
                                               [self.tableView reloadData];
                                              
                   
                                          });
                           
                       });
        
        
        
    }
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (hasImage)
    {
        return 2;
    }
    return 1;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    if (hasImage && indexPath.row ==0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kArticleImageCell forIndexPath:indexPath];
        
        UIImageView *imageViewCell = (UIImageView *)[cell.contentView viewWithTag:KArticleImageTag];
        
        
        UIActivityIndicatorView *indicatorView = (UIActivityIndicatorView *)[cell.contentView viewWithTag:KActivityTag];

     
        
        if ([self.articleInfo.isImageDownloaded boolValue])
        {
            
            [indicatorView stopAnimating];
            NSString *imagePath = [Storage imagePathWithImageType:@"image" andImageName:_articleInfo.articleImageName];
            
            NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
            UIImage *imageCell = [UIImage imageWithData:imageData scale:[[UIScreen mainScreen] scale]];
            
            imageViewCell.image=imageCell;
        }
        else if ([self.articleInfo.isGridImageDownloaded boolValue])
        {
            [indicatorView startAnimating];

            NSString *imagePath = [Storage imagePathWithImageType:@"small" andImageName:_articleInfo.articleImageName];
            
            NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
            UIImage *imageCell = [UIImage imageWithData:imageData scale:[[UIScreen mainScreen] scale]];
            
            imageViewCell.image=imageCell;


        }
        else
        {
            [indicatorView startAnimating];

            imageViewCell.image=[UIImage imageNamed:@"placeHolderImage"];

        }
            return cell;

    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kArticleDetailCell forIndexPath:indexPath];
        NSMutableAttributedString *stringArticle = [Helper attributedStringForTitle:self.articleInfo.articleName detailTitle:self.articleInfo.articleSubtitle andDescription:self.articleInfo.articleDescription];
        [[stringArticle mutableString] replaceOccurrencesOfString:@"\\n" withString:@"\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, stringArticle.string.length)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.textLabel.attributedText=stringArticle;
        return cell;


    }
    
    

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (hasImage && indexPath.row ==0)
    {
        hasImage =NO;
        [self.tableView reloadData];
    }

}




@end
