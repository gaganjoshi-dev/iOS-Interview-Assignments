//
//  Article+CoreDataProperties.m
//  News-a-lot
//
//  Created by Gagan Joshi on 13/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Article+CoreDataProperties.h"

@implementation Article (CoreDataProperties)

@dynamic articleID;
@dynamic articleName;
@dynamic articleSubtitle;
@dynamic articleImageName;
@dynamic articleDescription;
@dynamic isThumbDownloaded;
@dynamic isArticleDeleted;
@dynamic isGridImageDownloaded;
@dynamic isImageDownloaded;
@end
