//
//  MADCountryViewController.m
//  Countries3
//
//  Created by Aileen Pierce on 10/24/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "MADCountryViewController.h"
#import "MADDetailViewController.h"

@interface MADCountryViewController ()
@end

@implementation MADCountryViewController
@synthesize countryField;
@synthesize addCountry;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setCountryField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) textFieldShouldReturn:(UITextField *)sender
{
    [sender resignFirstResponder];
}

- (IBAction)addCountry:(UIBarButtonItem *)sender {
    NSLog(@"ready to add a country");
    UITextField *textField = [(countryField *)[MADDetailVeiwController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] countryField];
    
    
    
    SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSString *newItem = textField.text;
    
    if (newItem != nil) {
        
        [controller insertObject:newItem inListAtIndex:[controller countOfList]];
        
    }
    

    [self dismissModalViewControllerAnimated:YES];
    
}
@end
