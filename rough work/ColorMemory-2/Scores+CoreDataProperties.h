//
//  Scores+CoreDataProperties.h
//  ColorMemory
//
//  Created by Gagan Joshi on 3/5/17.
//  Copyright © 2017 Gagan Joshi. All rights reserved.
//

#import "Scores+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Scores (CoreDataProperties)

+ (NSFetchRequest<Scores *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *userName;
@property (nonatomic) int32_t userScore;

@end

NS_ASSUME_NONNULL_END
