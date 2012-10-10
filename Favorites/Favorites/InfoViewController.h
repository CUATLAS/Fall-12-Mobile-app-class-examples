//
//  InfoViewController.h
//  Favorites
//
//  Created by Aileen Pierce on 10/8/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@interface InfoViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userWord;
@property (weak, nonatomic) IBOutlet UITextView *userQuote;
- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender;
@property(strong, nonatomic)Favorite *userInfo;

@end
