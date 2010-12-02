    //
//  MainView.m
//  ShareTheRoute
//
//  Created by Sergio Botero on 11/15/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame]];
	self.view = contentView;

	
	UISwitch * monkeySwitch = [[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
	[contentView addSubview:monkeySwitch];
	
	UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setFrame:CGRectMake(0, 80, 80, 80)];
	[button setTitle:@"texto" forState:UIControlStateNormal];
	[button sizeToFit];
	[contentView addSubview:button];
	[button addTarget:self action:@selector(mailIt:) forControlEvents:UIControlEventTouchDown];
	[monkeySwitch addTarget:self action:@selector(mailIt:) forControlEvents:UIControlEventValueChanged];
	
	[contentView release];

}

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


#pragma mark -
#pragma mark MessageComposer

-(void) mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self dismissModalViewControllerAnimated:YES];
}

-(void) mailIt :(id)sender{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:NSLocalizedString(@"mail_subject",@"")];
	
	NSString * localizedBody = [NSString stringWithString:NSLocalizedString(@"mail_body", @"")];
	
	NSString *emailBody =[NSString stringWithFormat:@"%@ http://strong-frost-70.heroku.com/%@", localizedBody, theMonkey.uniqueMapID];
	[picker setMessageBody:emailBody isHTML:YES];
	
	[self presentModalViewController:picker animated:YES];
	[picker release];
}




@end
