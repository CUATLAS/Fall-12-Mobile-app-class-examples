//
//  BIDViewController.m
//  HelloWorldImage
//
//  Created by Aileen Pierce on 8/17/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController()
@end

@implementation BIDViewController
@synthesize NYImage;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setNYImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


                       
- (IBAction)pickImage:(id)sender {
    NSLog(@"image picker");
    //NYImage.image=[UIImage imageNamed:@"metslogo300.png"];
}

@end
