//
//  SummaryView.h
//  West_Mileage
//
//  Created by Gabriel West on 2/2/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MileageManager.h"

@interface SummaryView : UIViewController{
    
    __weak IBOutlet UILabel *numRecordsL;
    __weak IBOutlet UILabel *totalMilesL;
    __weak IBOutlet UILabel *totalFuelL;
    __weak IBOutlet UILabel *avgMPGL;
}

- (IBAction)resetData:(id)sender;

@property(weak, nonatomic) MileageManager* myMileage;
@end
