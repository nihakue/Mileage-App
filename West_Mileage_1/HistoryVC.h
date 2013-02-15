//
//  HistoryVC.h
//  West_Mileage
//
//  Created by Gabriel West on 2/13/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MileageManager.h"

@interface HistoryVC : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    
    __weak IBOutlet UITableView *historyTable;
}
@property(nonatomic,weak) MileageManager * myMileage;
@end
