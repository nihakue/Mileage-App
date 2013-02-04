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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithRed:0 green:0.20 blue:.4 alpha:1.0]];
    
    [[self navigationItem] setTitle:@"Mileage"];
    UIBarButtonItem * summaryBBI = [[UIBarButtonItem alloc] initWithTitle:@"Summary" style:UIBarButtonItemStylePlain target:self action:@selector(toSummaryView:)];
    
     UIBarButtonItem * mapBBI = [[UIBarButtonItem alloc] initWithTitle:@"Map" style:UIBarButtonItemStylePlain target:self action:@selector(toMapView:)];
    
	NSArray *bbiArray = [[NSArray alloc] initWithObjects:summaryBBI, mapBBI, nil];
    [[self navigationItem] setRightBarButtonItems:bbiArray];
    
    //Get the date and set the date label.
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    NSDate * date = [NSDate date];
    [dateFormatter setDateFormat:@"MM/dd, HH:mm:ss zzz"];
    dateL.text = [dateFormatter stringFromDate:date];
}

- (IBAction)toSummaryView:(id)sender{
    SummaryView * summaryView = [[SummaryView alloc]initWithNibName:@"SummaryView" bundle:nil];
    summaryView.myMileage = self.myMileage;
    [[self navigationController] pushViewController:summaryView animated:YES];
    [self clearFields];
    
}

- (void)clearFields{
    odometerTF.text=@"";
    fuelAddedTF.text=@"";
    mileageResultL.text=@"";
}

- (IBAction)toMapView:(id)sender{
    MapViewViewController * mapVC = [[MapViewViewController alloc]initWithNibName:@"MapViewViewController" bundle:nil];
    [self clearFields];
    [[self navigationController] pushViewController:mapVC animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == odometerTF) {
        [textField resignFirstResponder];
        [fuelAddedTF becomeFirstResponder];
    }
    if (textField == fuelAddedTF) {
        [textField resignFirstResponder];
    }
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

-(IBAction)calculateMileage:(id)sender{
    //Calculate MPG
    float odomValue = [odometerTF.text intValue];
    float fuelValue = [fuelAddedTF.text intValue];
    NSNumber * mpg = [[NSNumber alloc]initWithFloat:odomValue/fuelValue];
    
    //Stores the data in the mileage manager
    self.myMileage.numRecords ++;
    NSLog(@"num records = %d", self.myMileage.numRecords);
    self.myMileage.totalFuel += fuelValue;
    self.myMileage.totalMiles += odomValue;
    [self.myMileage addMPG:mpg];
    
    [self showMileage:(odomValue/fuelValue)];

}

-(void)showMileage:(float)mileage{
    mileageResultL.text=[[NSString alloc] initWithFormat:@"%.2f MPG", mileage];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
