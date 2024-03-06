//
//  SettingsTVC.m
//  News-a-lot
//
//  Created by Gagan Joshi on 3/19/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//


#import "SettingsTVC.h"

#define kFontPickerTag         99





#define kTitleKey       @"title"
#define kValueKey        @"value"

#define KTitleFontPickerRow       1
#define kSubtitleFontPickerRow    2

static NSString *kFontCellID = @"fontCell";
static NSString *kFontPickerID = @"fontPicker";


#pragma mark -


@interface SettingsTVC ()
{
    NSArray *arrayFontTitle;
    NSArray *arrayFontValues;
}
@property (nonatomic, strong) NSArray *dataArray;



@property (assign) NSInteger pickerCellRowHeight;

@property (nonatomic, strong) NSIndexPath *pickerViewIndexPath;



@end





#pragma mark -

@implementation SettingsTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
   
    
    arrayFontValues = @[@"12", @"14", @"16",@"18",@"20"];

    arrayFontTitle= @[@"Small", @"Medium", @"Regular",@"Large",@"Very Large"];

    
    NSInteger indexTitle = [arrayFontValues indexOfObject:[PersistentStore getTitleFontSize]];
    
    NSInteger indexSubtitle= [arrayFontValues indexOfObject:[PersistentStore getSubtitleFontSize]];

    
    
    
    NSMutableDictionary *itemOne = [@{ kTitleKey : @"Title Font", kValueKey:[NSString stringWithFormat:@"%ld",(long)indexTitle] } mutableCopy];
    NSMutableDictionary *itemTwo = [@{ kTitleKey : @"Subtitle Font", kValueKey:[NSString stringWithFormat:@"%ld",(long)indexSubtitle] } mutableCopy];
    self.dataArray = @[itemOne, itemTwo];
    
   

  
    
    self.pickerCellRowHeight = 216;

  
   }



-(void)reloadTableView
{
    [self.tableView reloadData];
}

-(void)RemovePickerios7
{
    [self.tableView beginUpdates];
    if ([self hasInlinePickerView])
    {
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.pickerViewIndexPath.row inSection:0]]
                              withRowAnimation:UITableViewRowAnimationFade];
        self.pickerViewIndexPath = nil;
    }
    [self.tableView endUpdates];
}











- (void)displayInlinePickerViewForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.tableView beginUpdates];
    
    BOOL before = NO;
    if ([self hasInlinePickerView])
    {
        before = self.pickerViewIndexPath.row < indexPath.row;
    }
    
    BOOL sameCellClicked = (self.pickerViewIndexPath.row - 1 == indexPath.row);
    
    if ([self hasInlinePickerView])
    {
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.pickerViewIndexPath.row inSection:0]]
                              withRowAnimation:UITableViewRowAnimationFade];
        self.pickerViewIndexPath = nil;
    }
    
    if (!sameCellClicked)
    {
        NSInteger rowToReveal = (before ? indexPath.row - 1 : indexPath.row);
        NSIndexPath *indexPathToReveal = [NSIndexPath indexPathForRow:rowToReveal inSection:0];
        
        NSArray *indexPaths = @[[NSIndexPath indexPathForRow:indexPathToReveal.row + 1 inSection:0]];
        
        self.pickerViewIndexPath = [NSIndexPath indexPathForRow:indexPathToReveal.row + 1 inSection:0];
        
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.tableView endUpdates];
    
    [self updatePickerView];
}

- (void)updatePickerView
{
    if (self.pickerViewIndexPath != nil)
    {
        
       
            UITableViewCell *associatedPickerViewCell = [self.tableView cellForRowAtIndexPath:self.pickerViewIndexPath];
            
            
            if(self.pickerViewIndexPath.row==1 )
            {
                UIPickerView *targetedPickerView = (UIPickerView *)[associatedPickerViewCell viewWithTag:kFontPickerTag];
                if (targetedPickerView != nil)
                {
                    NSDictionary *itemData = self.dataArray[self.pickerViewIndexPath.row - 1];
                    [targetedPickerView selectRow:[[itemData valueForKey:kValueKey] intValue] inComponent:0 animated:YES];
                }
                
            }
            else
            {
                UIPickerView *targetedPickerView = (UIPickerView *)[associatedPickerViewCell viewWithTag:kFontPickerTag];
                if (targetedPickerView != nil)
                {
                    NSDictionary *itemData = self.dataArray[self.pickerViewIndexPath.row - 1];
                    [targetedPickerView selectRow:[[itemData valueForKey:kValueKey] intValue] inComponent:0 animated:YES];
                }
                
            }
            
        }
        
        
    
    
    
}





- (BOOL)hasInlinePickerView
{
    return (self.pickerViewIndexPath != nil);
}


- (BOOL)indexPathHasPicker:(NSIndexPath *)indexPath
{
    return ([self hasInlinePickerView] && self.pickerViewIndexPath.row == indexPath.row);
}


- (BOOL)indexPathHasDate:(NSIndexPath *)indexPath
{
    BOOL hasDate = NO;
    
    if ((indexPath.row == KTitleFontPickerRow) ||
        (indexPath.row == kSubtitleFontPickerRow || ([self hasInlinePickerView] && (indexPath.row == kSubtitleFontPickerRow + 1))))
    {
        hasDate = YES;
    }
    
    return hasDate;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Tap to change font";
}
#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ([self indexPathHasPicker:indexPath] ? self.pickerCellRowHeight : self.tableView.rowHeight);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self hasInlinePickerView])
    {
        NSInteger numRows = self.dataArray.count;
        return ++numRows;
    }
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSInteger modelRow = indexPath.row;
    if (self.pickerViewIndexPath != nil && self.pickerViewIndexPath.row <= indexPath.row)
    {
        modelRow--;
    }
    
    if ([self indexPathHasPicker:indexPath])
    {
        
        
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:kFontPickerID forIndexPath:indexPath];



        UIPickerView *pickerView = (UIPickerView *)[cell.contentView viewWithTag:kFontPickerTag];

        [pickerView setDelegate:self];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:kFontCellID forIndexPath:indexPath];
        
        NSDictionary *itemData = self.dataArray[modelRow];
        
        cell.textLabel.text = [itemData valueForKey:kTitleKey];
        cell.detailTextLabel.text = arrayFontTitle[[[itemData valueForKey:kValueKey] intValue]];

        return cell;


    }
    
  
   
    
    
    
}


- (void)togglePickerViewForSelectedIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView beginUpdates];
    
    NSArray *indexPaths = @[[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0]];
    
    if ([self hasPickerForIndexPath:indexPath])
    {
        [self.tableView deleteRowsAtIndexPaths:indexPaths
                              withRowAnimation:UITableViewRowAnimationFade];
    }
    else
    {
        [self.tableView insertRowsAtIndexPaths:indexPaths
                              withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [self.tableView endUpdates];
}



- (BOOL)hasPickerForIndexPath:(NSIndexPath *)indexPath
{
    BOOL hasPickerView = NO;
    
    NSInteger targetedRow = indexPath.row;
    targetedRow++;
    
    UITableViewCell *checkPickerViewCell =[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:targetedRow inSection:0]];
    UIPickerView *checkPickerView = (UIPickerView *)[checkPickerViewCell viewWithTag:kFontPickerTag];
    
    hasPickerView = (checkPickerView != nil);
    return hasPickerView;
}




 

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (cell.reuseIdentifier == kFontCellID)
    {
            [self displayInlinePickerViewForRowAtIndexPath:indexPath];
    }
    else
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}


#pragma mark - Actions


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
     return [arrayFontValues count];
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    
    
    
        return arrayFontTitle[row];
   }


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSIndexPath *targetedCellIndexPath = [NSIndexPath indexPathForRow:self.pickerViewIndexPath.row - 1 inSection:0];
    
    
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:targetedCellIndexPath];
    NSMutableDictionary *itemData = self.dataArray[targetedCellIndexPath.row];
    [itemData setValue:[NSString stringWithFormat:@"%ld",(long)row] forKey:kValueKey];
    
     cell.detailTextLabel.text = arrayFontTitle[row];
        
    
    if (self.pickerViewIndexPath.row ==1)
    {
        
        
        if (![arrayFontValues[row]  isEqualToString:[PersistentStore getTitleFontSize]] )
        {
            [PersistentStore setTitleFontSize:arrayFontValues[row] ];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadTableView" object:nil];
            
            
        }
        
  
    }
    else
    {
        if (![arrayFontValues[row]  isEqualToString:[PersistentStore getSubtitleFontSize]] )
        {
            [PersistentStore setSubtitleFontSize:arrayFontValues[row]];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadTableView" object:nil];
            
            
        }
        
 
    }
    
    
    
    [self RemovePickerios7];
}




@end

