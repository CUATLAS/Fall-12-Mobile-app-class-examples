//
//  MADViewController.m
//  Music
//
//  Created by Aileen Pierce on 9/28/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize musicPicker;
@synthesize choiceLabel;
@synthesize genre;
@synthesize decade;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array=[[NSArray alloc] initWithObjects:@"Country", @"Pop", @"Rock", @"Alternative", @"Hip Hop", @"Jazz", @"Classical", nil];
	self.genre=array;
    NSArray *array2=[[NSArray alloc] initWithObjects:@"1950s", @"1960s", @"1970s", @"1980s", @"1990s", @"2000s", @"2010s", nil];
    self.decade=array2;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setMusicPicker:nil];
    [self setChoiceLabel:nil];
    self.genre=nil;
    self.decade=nil;
	// array of data will be recreated everytime the view is loaded
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//Methods to implement the picker
//Required for the UIPickerViewDataSource protocol
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 2; //number of components
}

//Required for the UIPickerViewDataSource protocol

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
	if (component==0) //checks which component was picked and returns that components row count
		return [genre count];
	else return[decade count];
}

//Picker Delegate methods
//returns the title for a given row
- (NSString *)pickerView:(UIPickerView *)pickerView
			titleForRow:(NSInteger) row
		   forComponent:(NSInteger) component{
	if (component==0) //checks which component was picked and returns the value for the requested component.
		return [genre objectAtIndex:row];
	else return [decade objectAtIndex:row];

}

//called when a row is selected
- (void)pickerView:(UIPickerView *)pickerView
     didSelectRow:(NSInteger)row
	  inComponent:(NSInteger)component{
	NSInteger genrerow=[musicPicker selectedRowInComponent:0]; //gets the choosen row for the genre
	NSInteger decaderow=[musicPicker selectedRowInComponent:1]; //gets the choosen row for the decade
	//writes the string with the selected row's content to the label
	choiceLabel.text=[NSString stringWithFormat:@"You like %@ from the %@", [genre objectAtIndex:genrerow], [decade objectAtIndex:decaderow]];
}

@end
