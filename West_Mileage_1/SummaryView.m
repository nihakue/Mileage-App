//
//  SummaryView.m
//  West_Mileage_1
//
//  Created by Gabriel West on 2/2/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "SummaryView.h"

@interface SummaryView ()

@end

@implementation SummaryView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[self view] setBackgroundColor:[UIColor colorWithRed:0 green:0.20 blue:.4 alpha:1.0]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void) viewWillAppear:(BOOL)animated{
    [self setLabels];
    NSLog(@"View Appeared");
}

- (void)setLabels{
    numRecordsL.text = [[NSString alloc] initWithFormat:@"%d", self.myMileage.numRecords];
    totalFuelL.text = [[NSString alloc] initWithFormat:@"%.1f", self.myMileage.totalFuel];
    totalMilesL.text = [[NSString alloc] initWithFormat:@"%.1f", self.myMileage.totalMiles];
    avgMPGL.text = [[NSString alloc] initWithFormat:@"%.1f", [self.myMileage calculateAverageMPG]];
    
}

-(IBAction)resetData:(id)sender{
    [self.myMileage resetData];
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
