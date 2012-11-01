//
//  MADMasterViewController.h
//  Presidents
//
//  Created by Aileen Pierce on 10/29/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MADDetailViewController;

@interface MADMasterViewController : UITableViewController

@property (strong, nonatomic) MADDetailViewController *detailViewController;
@property (strong, nonatomic) NSArray *presidents;


@end
