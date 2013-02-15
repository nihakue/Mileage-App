//
//  MileageManager.m
//  West_Mileage
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
    self.mileageArray = [[NSMutableArray alloc] init];
    return self;
}

-(float)calculateAverageMPG{
    float bigAverage = 0;
    for (MileageEntry * entry in self.mileageArray) {
        bigAverage += entry.fuelEconomy;
    }
    return bigAverage /= [self.mileageArray count];
}

-(float) getTotalMiles{
    float total = 0;
    for (MileageEntry * entry in self.mileageArray) {
        total += entry.milesDriven;
    }
    return total;
}

-(float) getTotalFuel{
    float total = 0;
    for (MileageEntry * entry in self.mileageArray) {
        total += entry.fuelAdded;
    }
    return total;
}

-(void)resetData{
    [self.mileageArray removeAllObjects];
}

-(void)pushEntry:(MileageEntry *)entry{
    [self.mileageArray addObject:entry];
}

@end

@implementation MileageEntry
@synthesize milesDriven, fuelAdded, fuelEconomy, date;

-(id)initWithMileage:(float)miles fuelAdded:(float)fuel economy:(float)econ dateAdded:(NSDate*)now{
    self = [super init];
    if (self){
        self.milesDriven = miles;
        self.fuelAdded = fuel;
        self.fuelEconomy = econ;
        self.date = now;
        return self;
    }
    return nil;
}
@end
