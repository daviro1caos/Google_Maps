//  ViewController.m
//  Google Maps
//
//  Created by Walter Gonzalez Domenzain on 01/07/16.
//  Copyright © 2016 Smartplace. All rights reserved.
//

#import "Start.h"
#import <Google/Analytics.h>
@import GoogleMaps;

@interface Start ()

@end

@implementation Start {
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMap];
}

-(void)viewWillAppear:(BOOL)animated{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Start"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createMap {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:21.1047                                                            longitude:-104.43
                                                                 zoom:10];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(21.1047, -104.43 );
    marker.title = @"Jala";
    marker.snippet = @"Clase de Maestría";
    marker.map = mapView_;
}

@end
