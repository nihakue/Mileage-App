//
//  MapViewViewController.m
//  West_Mileage_1
//
//  Created by Gabriel West on 2/2/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "MapViewViewController.h"

@interface MapViewViewController ()

@end

@implementation MapViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}



- (void)mapView:(MKMapView * )mv didUpdateUserLocation:(MKUserLocation *)userLocation{
    NSLog(@"new location");
    CLLocationCoordinate2D loc = userLocation.location.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 300, 300);
    [mv setRegion:region];
}

-(void) mapView:(MKMapView *)mv didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"map error: %@", error);
}

-(void) dealloc
{
    myMap.delegate = nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [myMap setDelegate:self];
    [myMap setShowsUserLocation:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
