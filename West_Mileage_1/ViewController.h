//
//  ViewController.h
//  West_Mileage
//
//  Created by Gabriel West on 1/17/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MileageManager.h"
#import "SummaryView.h"
#import "MapViewViewController.h"


//This is a test.
@interface ViewController : UIViewController{
    
    __weak IBOutlet UILabel *dateL;
    __weak IBOutlet UITextField *odometerTF;
    __weak IBOutlet UITextField *fuelAddedTF;
    __weak IBOutlet UILabel *mileageResultL;
    __weak IBOutlet UIButton *saveB;
    MileageEntry * thisEntry;
    
}

- (IBAction)calculateMileage:(id)sender;
- (IBAction)saveMileage:(MileageEntry *)entry;
- (void)showMileage:(float)mileage;

@property(weak, nonatomic) MileageManager* myMileage;

@end
