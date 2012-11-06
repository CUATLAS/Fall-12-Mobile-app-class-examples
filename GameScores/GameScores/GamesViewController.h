//
//  GamesViewController.h
//  GameScores
//
//  Created by Aileen Pierce on 11/2/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamesViewController : UITableViewController
@property(strong, nonatomic) NSMutableArray *games;
@property(strong, nonatomic)NSMutableArray *scores;
@property(copy, nonatomic)NSDictionary *editedSelection;

@end
