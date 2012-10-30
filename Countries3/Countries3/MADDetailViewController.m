//
//  MADDetailViewController.m
//  Countries3
//
//  Created by Aileen Pierce on 10/23/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "MADDetailViewController.h"
#import "MADMasterViewController.h"

@interface MADDetailViewController ()
@end

@implementation MADDetailViewController
@synthesize countryList;

- (void)viewWillAppear:(BOOL)animated {
	[self.tableView reloadData]; //reloads the data in the tableView
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=self.editButtonItem;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    countryList=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(self.editing)
        return [countryList count]+1; //adds a row for insertion if in edit mode
    else return [countryList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    BOOL addCell=(indexPath.row==[countryList count]); //true if adding a row
    if(addCell)
        CellIdentifier = @"AddCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if(addCell) {
        cell.textLabel.text = @"add new country"; //sets test of added cell
    }
    else cell.textLabel.text=[countryList objectAtIndex:indexPath.row]; //sets the text of the cell with the row being requested
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

//sets the editing style
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == [countryList count])
        return UITableViewCellEditingStyleInsert;
    else return UITableViewCellEditingStyleDelete;
}

// called by the table view when the user has made an edit - a deletion or an insertion. 
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) { //deletes the row from the table
        [countryList removeObjectAtIndex:indexPath.row]; //removes the row being deleted from the array
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSString *newItem = @"new country";
        [countryList insertObject:newItem atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:countryList.count inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }   
}


-(void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
    if(editing) {
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:countryList.count inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView endUpdates];
    } else {
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:countryList.count inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView endUpdates];
        // place here anything else to do when the done button is clicked
    }
}


//implement the moving of rows
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSUInteger fromRow=[fromIndexPath row]; //row moving from
    NSUInteger toRow=[toIndexPath row]; //row moving to
    NSString *moveCountry=[countryList objectAtIndex:fromRow]; //the country we are moving
    if(toRow<[countryList count]){
    [countryList removeObjectAtIndex:fromRow]; //remove the country from the row
    [countryList insertObject:moveCountry atIndex:toRow]; //insert the country in the new row
    }
    else{
        [countryList removeObjectAtIndex:fromRow]; //remove the country from the row
        [countryList insertObject:moveCountry atIndex:[countryList count]]; //insert the country in the new row
    }
    [self.tableView reloadData]; //reloads the data in the tableView
}


// allows rows to be moved
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row < [countryList count])
        return YES;
    else return NO; //so new row to add a country can't be moved
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
