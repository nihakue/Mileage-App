//
//  ViewController.m
//  West_Mileage
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
    saveB.enabled = NO;
}

- (void) viewWillAppear:(BOOL)animated{
    if (mileageResultL.text ==@"") {
        saveB.enabled = NO;
    }
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
    [fuelAddedTF resignFirstResponder];
    [odometerTF resignFirstResponder];
    //Calculate MPG
    float odomValue = [odometerTF.text intValue];
    float fuelValue = [fuelAddedTF.text intValue];
    NSDate * now = [NSDate date];

    if (odomValue && fuelValue) {
        thisEntry = [[MileageEntry alloc] initWithMileage:odomValue fuelAdded:fuelValue economy:odomValue/fuelValue dateAdded:[NSDate date]];
        saveB.enabled=YES;
    }
    
    [self showMileage:thisEntry.fuelEconomy];

}
-(IBAction)saveMileage:(id)sender{
    
    [self.myMileage pushEntry:thisEntry];
    
    //Stores the data in the mileage manager
    self.myMileage.numRecords ++;
    
    self.myMileage.totalFuel += thisEntry.fuelAdded;
    self.myMileage.totalMiles += thisEntry.milesDriven;
    saveB.enabled = NO;
    [self clearFields];
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
