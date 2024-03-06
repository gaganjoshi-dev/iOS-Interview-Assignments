//
//  HighScoreTVC.m
//  ColourMemory
//
//  Created by Gagan Joshi on 3/5/17.
//  Copyright © 2017 Gagan Joshi. All rights reserved.
//

#import "HighScoreTVC.h"
#import "Scores+CoreDataClass.h"
#import "AppDelegate.h"

#define KSectionHeaderCell @"sectionHeaderCell"
#define kCellIndentfier @"cellIndentfier"

#define KRankLabelTag          101
#define KNameLabelTag          102
#define KScoreLabelTag         103

@interface HighScoreTVC ()<NSFetchedResultsControllerDelegate>
{

NSFetchedResultsController *fetchedResultsController;
}

@end

@implementation HighScoreTVC



#pragma mark goBackToGame
- (IBAction)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
 
}


#pragma mark goBackToStartNewGame

- (IBAction)endGame:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];

}



#pragma mark fetchedResultsController
- (NSFetchedResultsController *)fetchedResultsController
{
    if (fetchedResultsController == nil)
    {
        
        NSFetchRequest *request =[Scores fetchRequest];
         NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"userScore" ascending:NO];
         [request setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor1,nil]];
      
        fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[AppDelegate appDelegate].persistentContainer.viewContext sectionNameKeyPath:nil cacheName:nil];
        [fetchedResultsController setDelegate:self];
        
        NSError *error = nil;
        if (![fetchedResultsController performFetch:&error])
        {
            NSLog(@"%@",[error localizedDescription]);
        }
    }
    
    return fetchedResultsController;
}



#pragma mark viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}
#pragma mark didReceiveMemoryWarning

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark tableView Group

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   
    return 50;
}



-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  
    UITableViewCell *sectionHeaderView = [tableView dequeueReusableCellWithIdentifier:KSectionHeaderCell];
    
    return sectionHeaderView.contentView;
    
   
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self fetchedResultsController].fetchedObjects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    Scores *score=[[self fetchedResultsController] objectAtIndexPath:indexPath];

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIndentfier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UILabel *labelRank = (UILabel *)[cell.contentView viewWithTag:KRankLabelTag];
    
    labelRank.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row+1];
    
    
    UILabel *labelName = (UILabel *)[cell.contentView viewWithTag:KNameLabelTag];
    
    labelName.text = score.userName;

    UILabel *labelScore = (UILabel *)[cell.contentView viewWithTag:KScoreLabelTag];

    labelScore.text = [NSString stringWithFormat:@"%d",score.userScore];


  
    
    return cell;
}



@end
