//
//  MileageManager.m
//  West_Mileage_1
//
//  Created by Gabriel West on 2/2/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "MileageManager.h"

@implementation MileageManager
@synthesize numRecords, totalMiles, totalFuel, avgEconomy, date;

-(id)init{
    self = [super init];
    self.numRecords = 0;
    self.totalFuel = 0;
    self.totalMiles = 0;
    self.avgEconomy = 0;
    mileages = [[NSMutableArray alloc]initWithCapacity:25];
    date = [NSDate date];
    return self;
}

-(void)addMPG:(NSNumber *)mpg{
    [mileages addObject:mpg];
}
-(float)calculateAverageMPG{
    float bigAverage = 0;
    for (NSNumber * mpg in mileages) {
        bigAverage += [mpg floatValue];
    }
    return bigAverage /= numRecords;
}

-(void)resetData{
    self.numRecords = 0;
    self.totalFuel = 0;
    self.totalMiles = 0;
    self.avgEconomy = 0;
    [mileages removeAllObjects];
}

@end
