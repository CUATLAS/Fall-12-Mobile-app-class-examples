//
//  MADThirdViewController.m
//  Boulder_scratch
//
//  Created by Aileen Pierce on 10/14/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "MADThirdViewController.h"

@interface MADThirdViewController ()

@end

@implementation MADThirdViewController
@synthesize thirdWebView;
@synthesize thirdSpinner;

//load a new web page in the web view
-(void)loadWebPageWithString:(NSString *)urlString {
    //The NSString passed should be a properly formed URL
    NSURL *url = [NSURL URLWithString:urlString]; //a NSURL object is initialized using a NSString that is passed to the method
    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //constructs a NSURLRequest object from a NSURL object
    [thirdWebView loadRequest:request]; //loads a NSURLRequest object
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    thirdWebView.delegate=self;
    [self loadWebPageWithString:@"http://www.colorado.edu/"];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//UIWebViewDelegate method that is called when a web page begins to load
-(void)webViewDidStartLoad:(UIWebView *)webView
{
	[thirdSpinner startAnimating]; //sends the startAnimating message to the spinner
	
}

//UIWebViewDelegate method that is called when a web page loads successfully
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
	[thirdSpinner stopAnimating]; //sends the stopAnimating message to the spinner
	
}

- (void)viewDidUnload
{
    [self setThirdWebView:nil];
    [self setThirdSpinner:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
