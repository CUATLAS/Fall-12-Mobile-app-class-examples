//
//  MADViewController.h
//  Favorites
//
//  Created by Aileen Pierce on 10/8/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@interface MADViewController : UIViewController{
    Favorite *user; //creates the model object
}
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UITextView *quoteText;
- (IBAction)infoButtonTapped:(UIBarButtonItem *)sender;

@end
