//
//  MileageManager.h
//  West_Mileage_1
//
//  Created by Gabriel West on 2/2/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MileageManager : NSObject{
    
    NSMutableArray * mileages;
}

-(float) calculateAverageMPG;
-(void) addMPG:(NSNumber*) mpg;
-(void) resetData;

@property(nonatomic) int numRecords;
@property(nonatomic) float totalMiles;
@property(nonatomic) float totalFuel;
@property(nonatomic) float avgEconomy;
@property(strong, nonatomic) NSDate * date;

@end
