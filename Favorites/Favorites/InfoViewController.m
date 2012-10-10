//
//  InfoViewController.m
//  Favorites
//
//  Created by Aileen Pierce on 10/8/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController
@synthesize userWord;
@synthesize userQuote;
@synthesize userInfo;

//set the username and userquote just before the view appears
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    userWord.text=userInfo.word;
    userQuote.text=userInfo.quote;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    userWord.delegate=self;
    userQuote.delegate=self;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setUserWord:nil];
    [self setUserQuote:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender {
    NSLog(@"done button tapped");
    userInfo.word=userWord.text; //updates the model object with the userword before dismissing the info view
    userInfo.quote=userQuote.text; //updates the model object with the userquote before dismissing the info view
    //dismisses the info view and flips back to the favorites view
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//UITextFieldDelegate method
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

//dismisses keyboard when the user touches outside the textview
// from http://iphonedevelopertips.com/cocoa/how-to-dismiss-the-keyboard-when-using-a-uitextview.html
- (void)touchesEnded:(NSSet *)touches
		   withEvent:(UIEvent *)event
{
	NSLog(@"User touched");
	UITouch *touch = [touches anyObject];
	if ([userQuote isFirstResponder] && [touch view] != userQuote)
    {
		NSLog(@"The textView is currently being edited, and the user touched outside the text view");
		[userQuote resignFirstResponder];
	}
}

@end
