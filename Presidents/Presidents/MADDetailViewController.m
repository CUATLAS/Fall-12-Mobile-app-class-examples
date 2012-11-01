//
//  MADDetailViewController.m
//  Presidents
//
//  Created by Aileen Pierce on 10/29/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "MADDetailViewController.h"

@interface MADDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation MADDetailViewController

#pragma mark - Managing the detail item
@synthesize detailItem, detailDescriptionLabel, webView;



- (void)setDetailItem:(id)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}


- (void)configureView
{
    // Update the user interface for the detail item.
    NSURL *url = [NSURL URLWithString:detailItem]; //a NSURL object is initialized using the url in detailItem
	NSURLRequest *request = [NSURLRequest requestWithURL:url]; //constructs a NSURLRequest object from a NSURL object
    [self.webView loadRequest:request]; //loads a NSURLRequest object
	detailDescriptionLabel.text = [detailItem description];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
*/

#pragma mark - Split view

//UISplitViewController delegate methods

//called when the iPad is rotated to portrait orientation
- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Presidents", @"Presidents");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

//called when rotated back to landscape. Removes the toolbar button and shows the split view.
- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
