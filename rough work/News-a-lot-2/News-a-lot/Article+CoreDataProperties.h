//
//  Article+CoreDataProperties.h
//  News-a-lot
//
//  Created by Gagan Joshi on 13/03/16.
//  Copyright © 2016 Gagan Joshi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Article.h"

NS_ASSUME_NONNULL_BEGIN

@interface Article (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *articleID;
@property (nullable, nonatomic, retain) NSString *articleName;
@property (nullable, nonatomic, retain) NSString *articleSubtitle;
@property (nullable, nonatomic, retain) NSString *articleImageName;
@property (nullable, nonatomic, retain) NSString *articleDescription;
@property (nullable, nonatomic, retain) NSNumber *isThumbDownloaded;
@property (nullable, nonatomic, retain) NSNumber *isImageDownloaded;
@property (nullable, nonatomic, retain) NSNumber *isGridImageDownloaded;

@property (nullable, nonatomic, retain) NSNumber *isArticleDeleted;


@end

NS_ASSUME_NONNULL_END
