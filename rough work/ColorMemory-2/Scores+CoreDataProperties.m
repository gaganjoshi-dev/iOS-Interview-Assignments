//
//  Scores+CoreDataProperties.m
//  ColorMemory
//
//  Created by Gagan Joshi on 3/5/17.
//  Copyright © 2017 Gagan Joshi. All rights reserved.
//

#import "Scores+CoreDataProperties.h"

@implementation Scores (CoreDataProperties)

+ (NSFetchRequest<Scores *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Scores"];
}

@dynamic userName;
@dynamic userScore;

@end
