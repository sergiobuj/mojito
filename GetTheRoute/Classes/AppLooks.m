//
//  AppLooks.m
//  GetTheRoute
//
//  Created by Sergio Botero on 11/1/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "AppLooks.h"


@implementation AppLooks

#pragma mark -
#pragma mark Sharing the route

-(void) mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction) mailIt {
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;

	[picker setSubject:@"Follow My Route"];
	
	NSString *emailBody =[NSString stringWithFormat:@"This is a link to where I am. Check it out! http://strong-frost-70.heroku.com/%@", theMonkey.uniqueMapID];
	[picker setMessageBody:emailBody isHTML:YES];
	
	[self presentModalViewController:picker animated:YES];
	[picker release];
}



/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization		
	}
    return self;
}*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
