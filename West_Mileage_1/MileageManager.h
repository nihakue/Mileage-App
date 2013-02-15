//
//  MileageManager.h
//  West_Mileage
//
//  Created by Gabriel West on 2/2/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MileageEntry : NSObject

-(id)initWithMileage:(float)miles fuelAdded:(float)fuel economy:(float)econ dateAdded:(NSDate *)now;

@property(nonatomic) float milesDriven;
@property(nonatomic) float fuelAdded;
@property(nonatomic) float fuelEconomy;
@property(strong, nonatomic) NSDate * date;

@end


@interface MileageManager : NSObject {
    
    NSMutableArray * mileages;
}

-(float) calculateAverageMPG;
-(float) getTotalMiles;
-(float) getTotalFuel;
-(void) resetData;
-(void) pushEntry:(MileageEntry *) entry;

@property(nonatomic) int numRecords;
@property(nonatomic) float totalMiles;
@property(nonatomic) float totalFuel;
@property(nonatomic) float avgEconomy;
@property(strong, nonatomic) NSDate *date;
@property(strong, nonatomic) NSMutableArray * mileageArray;

@end

