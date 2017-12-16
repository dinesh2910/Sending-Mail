//
//  ViewController.m
//  SendEmail
//
//  Created by dinesh danda on 8/14/16.
//  Copyright © 2016 dinesh danda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)sendmail:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendmail:(id)sender {
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc]init];
    [composer setMailComposeDelegate:self];
    if ([MFMailComposeViewController canSendMail]) {
        [composer setSubject:@"Greetings"];
        [composer setToRecipients:[NSArray arrayWithObjects:@"dinesh.chows2910", nil]];
        [composer setMessageBody:@"Hi \nThis is Dinesh Danda, Its been a long time" isHTML:NO];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        
        [self presentViewController:composer animated:YES completion:NO];
        
    }
    else{
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"Error" message:@"An Error has Occured" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [view show];
        
        
    }
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (error) {
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"Error" message:@"An Error has Occured" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [view show];
        [self dismissViewControllerAnimated:YES completion:NO];
        
        
        
    }else{
        [self dismissViewControllerAnimated:YES completion:NO];
        
    }
}
@end
