//
//  ColorMemoryVC.m
//  ColourMemory
//
//  Created by Gagan Joshi on 3/5/17.
//  Copyright © 2017 Gagan Joshi. All rights reserved.
//

#import "ColorMemoryVC.h"
#import "MBProgressHUD.h"
#import "Scores+CoreDataClass.h"



#define KImageViewTag         101
#define kItemIndentfier @"itemIndentfier"


#define cellWidth  ([UIScreen mainScreen].bounds.size.width-30)/4
#define cellHight  ([UIScreen mainScreen].bounds.size.width-30) *1.25/4


@interface ColorMemoryVC ()
{
    NSMutableArray *arrayCards;
    NSMutableSet *setFadedCards;
    
    NSString *stringCurrentCard;
    
    
    NSInteger selectedItem;

    int currentScore;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;



@end

@implementation ColorMemoryVC



#pragma mark goBack
- (IBAction)goBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}




#pragma mark ForShufflingArray

- (NSMutableArray *)shuffleArray:(NSMutableArray *)array
{
    NSUInteger count = [array count];
    if (count <= 1)
        return array;
    for (NSUInteger i = 0; i < count - 1; ++i)
    {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [array exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    
    return array;
}

#pragma mark IntialSetup

-(void)intialSetup
{
    
    
    UIButton *buttonBack =[UIButton buttonWithType:UIButtonTypeCustom];
    buttonBack.frame=CGRectMake(0, 0, 100, 40);
    buttonBack.imageView.contentMode= UIViewContentModeScaleAspectFit;
    [buttonBack setImage:[UIImage imageNamed:@"logoSmall"] forState:UIControlStateNormal];
    [buttonBack addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonBack];
    
    currentScore = 0;
    selectedItem = -1;
    
    setFadedCards = [NSMutableSet new];
    
    NSMutableArray *arrayTemp = [NSMutableArray array];
    
    
    for (int i = 1; i <= 8; i++)
    {
        
        NSString *stringImageName =[NSString stringWithFormat:@"colour%d",i];
        [arrayTemp addObject:stringImageName];
        [arrayTemp addObject:stringImageName];
        
    }
    
    arrayCards = [self shuffleArray:arrayTemp];
    
}



#pragma mark viewDidLoad

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self intialSetup];
    
    
}

#pragma mark didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark UICollectionView group
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [arrayCards count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kItemIndentfier forIndexPath:indexPath];
    
  
    UIImageView *imageViewCell = (UIImageView *)[cell.contentView viewWithTag:KImageViewTag];
    
    
    NSString *stringImageName = arrayCards[indexPath.row];
    imageViewCell.hidden =NO;

    if ([setFadedCards containsObject:stringImageName])
    {
        imageViewCell.hidden =YES;
    }
    else if([stringCurrentCard isEqualToString:stringImageName])
    {
        imageViewCell.image = [UIImage imageNamed:stringImageName];

    }
    else
    {

        imageViewCell.image = [UIImage imageNamed:@"card_bg"];
 
    }
    
    

    
    return cell;

}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
     return CGSizeMake(cellWidth,cellHight);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    
    NSString *stringImageName = arrayCards[indexPath.row];
    
    if ([setFadedCards containsObject:stringImageName] )
    {
        return;
    }
    else
    {
     
        
        if (selectedItem == indexPath.item)
        {
            return;
        }
        
        
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
        
        UIImageView *imageViewCell = (UIImageView *)[cell.contentView viewWithTag:KImageViewTag];
        
        imageViewCell.image = [UIImage imageNamed:stringImageName];

        
        
        
        if (stringCurrentCard)
        {
            [self showLoadingViewWithTitle:@"updating score"];
            
            if([stringCurrentCard isEqualToString:stringImageName])
            {
                
                currentScore +=2;
                [setFadedCards addObject:stringImageName];
            }
            else
            {
                currentScore -=1;
            }
            
            
            stringCurrentCard = nil;
            selectedItem = -1;
            
            
            
            [self performSelector:@selector(reloadCollectionView) withObject:nil afterDelay:1.0];
 
        }
        else
        {
            stringCurrentCard = stringImageName;
            
            selectedItem = indexPath.item;

        }
        
        
        
        
        
   }
    

    
}


#pragma mark functionEnterName alert

-(void)functionEnterName
{
 
    
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Congrats"
                                                                                  message: [NSString stringWithFormat:@"Your Score = %d",currentScore]
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"Enter your Name";
            textField.textColor = [UIColor blueColor];
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            textField.borderStyle = UITextBorderStyleRoundedRect;
        }];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSArray * textfields = alertController.textFields;
            UITextField * namefield = textfields[0];
            
            NSString *stringName = [namefield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            if ([stringName length])
            {
                NSLog(@"Correct Name entered");
                
                [Scores addScoreWithUserName:stringName andScore:currentScore];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self functionEnterCorrectName];
                NSLog(@"Please Enter Correct Name");
            }
            
            NSLog(@"%@:",namefield.text);
            
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    

}



#pragma mark functionEnterCorrectName alert

-(void)functionEnterCorrectName
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Wrong Input"
                                                                              message: @"Please Enter correct Name"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
      [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
          [self functionEnterName];
          
    }]];
    [self presentViewController:alertController animated:YES completion:nil];


}




#pragma mark reloadCollectionView

-(void)reloadCollectionView
{
    
    [self.collectionView reloadData];
    [self updateCurrentScore];
    
    [self hideLoadingView];
    
    if ([setFadedCards count] >=8)
    {
        [self functionEnterName];
    }
    
    }


#pragma mark updateCurrentScore
-(void)updateCurrentScore
{
    self.title = [NSString stringWithFormat:@"Score = %d",currentScore];
}


#pragma mark showLoadingViewWithTitle
-(void)showLoadingViewWithTitle:(NSString *)title
{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    
    MBProgressHUD *hud =  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = title;
    hud.detailsLabelText = @"Please Wait";
    hud.dimBackground = NO;
    
    
    
}

#pragma mark hideLoadingView
-(void)hideLoadingView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}





@end
