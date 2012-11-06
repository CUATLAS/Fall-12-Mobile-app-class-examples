//
//  GamesViewController.m
//  GameScores
//
//  Created by Aileen Pierce on 11/2/12.
//  Copyright (c) 2012 Aileen Pierce. All rights reserved.
//

#import "GamesViewController.h"

@interface GamesViewController ()

@end

@implementation GamesViewController
@synthesize games, scores, editedSelection;

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
    games=[NSMutableArray arrayWithObjects:@"Scrabble", @"Words With Friends", @"Boggle", nil];
    scores=[NSMutableArray arrayWithObjects:@"0", @"0", @"0", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    games=nil;
    scores=nil;
    editedSelection=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [games count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"GameCell"];
    NSString *game=[games objectAtIndex:indexPath.row];
    cell.textLabel.text=game;
    NSString *score=[scores objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=score;
    return cell;
}

//notifies the view controller that a segue is about to be performed
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"EnterScore"])
    { //EnterScore segue
        UIViewController *destination=segue.destinationViewController; //view controller that is about to be displayed
        if ([destination respondsToSelector:@selector(setDelegate:)])
        { //checks if the destination controller has a delegate
            [destination setValue:self forKey:@"delegate"]; //sets the destination's delegate back to this view controller
        }
        if ([destination respondsToSelector:@selector(setSelection:)])
        { //checks if the destination lets us set the selection
            NSIndexPath *indexPath=[self.tableView indexPathForCell:sender]; //gets the indexPath of the selected cell
            id object=[scores objectAtIndex:indexPath.row]; //gets the object at the selected row
            //put the selected row and the index of the selected row into a dictionary to pass along to the detail view controller
            NSDictionary *selection=[NSDictionary dictionaryWithObjectsAndKeys: indexPath, @"indexPath", object, @"object", nil];
            [destination setValue:selection forKey:@"selection"]; //set the destinations selection property
        }
    }
}

//custom setter method for editedSelection
- (void)setEditedSelection:(NSDictionary *)dict {
    if (![dict isEqual:editedSelection]) {
        editedSelection = dict; //gets the dictionary of the edited item
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"]; //gets the indexPath of the edited item
        id newValue = [dict objectForKey:@"object"]; //gets the new value
        [scores replaceObjectAtIndex:indexPath.row withObject:newValue]; //replaces the old object with the new one
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationAutomatic]; //reloads the tableview
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
