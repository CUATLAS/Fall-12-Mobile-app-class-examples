//
//  GameScoreDataViewController.h
//  GameScores
//
//  Created by Aileen Pierce on 11/4/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameScoreDataViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *scoreTextField;
@property (strong, nonatomic) NSDictionary *selection;
@property (weak, nonatomic) id delegate;

@end
