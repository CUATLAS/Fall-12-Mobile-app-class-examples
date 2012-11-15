//
//  MADViewController.m
//  Animation
//
//  Created by Aileen Pierce on 11/12/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController (){
    CGPoint delta; //specifies how many points the image must move every time the timer fires
    NSTimer *timer; //the animation timer
    float ballRadius; //radius of the ball
    CGPoint translation; //specifies how many points the image will move
    float angle; //angle for rotation
}

@end

@implementation MADViewController
@synthesize imageView;
@synthesize slider;
@synthesize sliderLabel;

//updates the timer and label with the current slider value
-(IBAction)changeSliderValue
{
	sliderLabel.text=[NSString stringWithFormat:@"%.2f", slider.value];
	//creates a new timer object with the slider's time interval
	timer = [NSTimer scheduledTimerWithTimeInterval:slider.value //number of seconds between firings of the timer
											 target:self
										   selector:@selector(onTimer) //the message sent when the timer fires
										   userInfo:nil
											repeats:YES]; //whether or not the timer repeatedly reschedules itself.
	//YES will repeatedly reschedule the timer until invalidated
}

//changes the position of the image view
-(void) onTimer
{
    //animation block  
	[UIView beginAnimations:@"my_own_animation" context:nil];
	
	[UIView animateWithDuration:slider.value //animate for the duration of the slider value (time interval)
						  delay:0 //have the animation start right away
						options:UIViewAnimationCurveLinear //set the animation curve type
     //set the animation curve type
					 animations:^{imageView.transform = CGAffineTransformMakeScale(angle,angle);
                         imageView.center = CGPointMake(imageView.center.x + delta.x, imageView.center.y + delta.y);}
					 completion:NULL];
	
	[UIView commitAnimations];
	
	angle += 0.02; //amount by which you increment the angle
	//if it's a full rotation reset the angle
	if (angle>2*M_PI)
		angle=0;
    	
	//if the image touched the sides of the screen it reverses the direction
	if (imageView.center.x > self.view.bounds.size.width - ballRadius || imageView.center.x < ballRadius)
		delta.x = -delta.x;
	//if the image touched the top or bottom of the screen it reverses the direction
	if (imageView.center.y > self.view.bounds.size.height - ballRadius || imageView.center.y < ballRadius)
		delta.y = -delta.y;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //ball radius is half the width of the image
    ballRadius=imageView.frame.size.width/2;
	//initialize the delta. tells it to move 12 pixels horizontally, 4 pixels vertically
    delta=CGPointMake(12.0, 4.0);
    translation=CGPointMake(0.0, 0.0);
    angle=0; //sets angle to 0
	[self changeSliderValue];
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setSlider:nil];
    [self setSliderLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)sliderMoved:(UISlider *)sender {
    [timer invalidate];	//stops the timer
	//must invalidate and create a new object to change its firing interval
	[self changeSliderValue];
}
@end
