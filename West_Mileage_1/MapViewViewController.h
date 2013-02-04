//
//  MapViewViewController.h
//  West_Mileage
//
//  Created by Gabriel West on 2/2/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapViewViewController : UIViewController <MKMapViewDelegate>{
    IBOutlet MKMapView *myMap;
}

@end
