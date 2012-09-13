//
//  MADViewController.m
//  beatlesinclass
//
//  Created by Aileen Pierce on 9/13/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize imageControl;
@synthesize capitalizedSwitch;
@synthesize fontSizeNumberLabel;
@synthesize beatlesImage;
@synthesize titleLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBeatlesImage:nil];
    [self setTitleLabel:nil];
    [self setImageControl:nil];
    [self setCapitalizedSwitch:nil];
    [self setFontSizeNumberLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)changeImage:(UISegmentedControl *)sender {
}
- (IBAction)updateFont:(UISwitch *)sender {
}
- (IBAction)changeFontSize:(UISlider *)sender {
}
@end
