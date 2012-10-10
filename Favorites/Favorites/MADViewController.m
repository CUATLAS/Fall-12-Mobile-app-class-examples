//
//  MADViewController.m
//  Favorites
//
//  Created by Aileen Pierce on 10/8/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "MADViewController.h"
#import "InfoViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize wordLabel;
@synthesize quoteText;

//set the username and userquote just before the view appears
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    wordLabel.text=user.word;
    quoteText.text=user.quote;
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    user=[[Favorite alloc]init]; //initializes the user object
}

- (void)viewDidUnload
{
    [self setWordLabel:nil];
    [self setQuoteText:nil];
    user=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)infoButtonTapped:(UIBarButtonItem *)sender {
    NSLog(@"info button tapped");
    //initialize view controller
    InfoViewController *infoViewController=[[InfoViewController alloc]init];
    //set transition style to flip horizontal transition
    infoViewController.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    infoViewController.userInfo=user; //updates the userInfo property on the infoViewController so it points to the user model
    //present the infoViewController
    [self presentViewController:infoViewController animated:YES completion:NULL];
}
@end
