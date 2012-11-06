//
//  GameScoreDataViewController.m
//  GameScores
//
//  Created by Aileen Pierce on 11/4/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "GameScoreDataViewController.h"

@interface GameScoreDataViewController ()

@end

@implementation GameScoreDataViewController
@synthesize scoreTextField, selection, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    scoreTextField.text=[selection objectForKey:@"object"];
	// Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if ([delegate respondsToSelector:@selector(setEditedSelection:)]) {
        //forces the text field to finish any editing the user may have been doing so that its text value is up to date.
        [scoreTextField endEditing:YES]; 
        NSIndexPath *indexPath = [selection objectForKey:@"indexPath"]; //gets the indexPath
        id object = scoreTextField.text; 
        NSDictionary *editedSelection = [NSDictionary dictionaryWithObjectsAndKeys:
                                         indexPath, @"indexPath",
                                         object, @"object",
                                         nil];
        [delegate setValue:editedSelection forKey:@"editedSelection"]; //sets the delegate's editedSelection propery
    }
}

- (void)viewDidUnload
{
    [self setScoreTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
