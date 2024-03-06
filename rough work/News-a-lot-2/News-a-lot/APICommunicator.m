//
//  APICommunicator.m
//  Yaye
//
//  Created by Gagan Joshi on 10/06/15.
//  Copyright (c) 2015 Gagan. All rights reserved.
//

#import "APICommunicator.h"
#import "Article.h"

@implementation APICommunicator





+(void)postRequestToGetAllContacts
{
    
   
    NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:KArticleURL]];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:urlRequest
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error)
    
    {
        
        if (error)
        {
            NSLog(@"Error: %@",[error description]);
        }
        else
        {
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            
            [Article performSelectorOnMainThread:@selector(addArticaleWithArticleDetail:) withObject:object waitUntilDone:YES];
            
        }
    }];
    
    [task resume];
    

  
    
 
}




@end
