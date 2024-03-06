//
//  Scores+CoreDataClass.m
//  ColorMemory
//
//  Created by Gagan Joshi on 3/5/17.
//  Copyright © 2017 Gagan Joshi. All rights reserved.
//

#import "Scores+CoreDataClass.h"
#import "AppDelegate.h"

@implementation Scores




+(void)addScoreWithUserName:(NSString *)userName andScore:(int)userScore
{
    NSFetchRequest *request =  [Scores fetchRequest];
    request.predicate = [NSPredicate predicateWithFormat:@"userName == %@",userName];
    NSError *executeFetchError = nil;
    Scores *scoreObject = [[[AppDelegate appDelegate].persistentContainer.viewContext executeFetchRequest:request error:&executeFetchError] lastObject];
    
    if (!scoreObject)
    {
        scoreObject = (Scores *)[NSEntityDescription insertNewObjectForEntityForName:@"Scores" inManagedObjectContext:[AppDelegate appDelegate].persistentContainer.viewContext];
        scoreObject.userName = userName;
        scoreObject.userScore = userScore;
    }
    else
    {
        if (userScore > scoreObject.userScore)
        {
            scoreObject.userScore = userScore;
        }
    }
    
    NSError *error;
    if (![[AppDelegate appDelegate].persistentContainer.viewContext save:&error])
    {
        
    }
    
}

@end
