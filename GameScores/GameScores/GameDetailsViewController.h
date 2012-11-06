//
//  GameDetailsViewController.h
//  GameScores
//
//  Created by Aileen Pierce on 11/5/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameDetailsViewController;
@protocol GameDetailsViewControllerDelegate <NSObject> //defining a custom protocol

-(void)gameDetailsViewControllerDidCancel:(GameDetailsViewController *)controller;
-(void)gameDetailsViewController:(GameDetailsViewController *)controller DidSave:(NSString *)newGame;

@end

@interface GameDetailsViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property(weak, nonatomic)id<GameDetailsViewControllerDelegate> delegate;
-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@end
