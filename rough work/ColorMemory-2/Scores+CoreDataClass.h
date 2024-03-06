//
//  Scores+CoreDataClass.h
//  ColorMemory
//
//  Created by Gagan Joshi on 3/5/17.
//  Copyright © 2017 Gagan Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Scores : NSManagedObject


+(void)addScoreWithUserName:(NSString *)userName andScore:(int)userScore;

@end

NS_ASSUME_NONNULL_END

#import "Scores+CoreDataProperties.h"
