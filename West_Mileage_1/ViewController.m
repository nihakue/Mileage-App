//
//  ViewController.m
//  West_Mileage_1
//
//  Created by Gabriel West on 1/17/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == odometerTF) {
        [textField resignFirstResponder];
        [fuelAddedTF becomeFirstResponder];
        NSLog(@"next");
    }
    if (textField == fuelAddedTF) {
        [textField resignFirstResponder];
        [self calculateMileage:self];
    }
    return YES;
}

//-(BOOL)becomeFirstResponder:(UITextField *)textField{
//    [textField becomeFirstResponder];
//    NSLog(@"Hello");
//    return YES;
//}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

-(IBAction)calculateMileage:(id)sender{
    NSString *odometer = odometerTF.text;
    NSString *fuelAdded = fuelAddedTF.text;
    float odomValue = [odometerTF.text intValue];
    float fuelValue = [fuelAddedTF.text intValue];
    [self showMileage:(odomValue/fuelValue)];
    NSLog(@"Odometer: %@\nFuel Added: %@", odometer, fuelAdded);
}

-(void)showMileage:(float)mileage{
    mileageResultL.text=[[NSString alloc] initWithFormat:@"%.2f MPG", mileage];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithRed:0 green:0.20 blue:.4 alpha:1.0]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
