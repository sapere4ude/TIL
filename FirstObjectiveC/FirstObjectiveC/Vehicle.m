//
//  Vehicle.m
//  FirstObjectiveC
//
//  Created by sapere4ude on 2021/02/18.
//

#import "Vehicle.h"

@implementation Vehicle
@synthesize wheels;
@synthesize seats;
//-(void) setWheels:(int)w {
//    wheels = w;
//}
//-(void) setSeats:(int)s {
//    seats = s;
//}
//-(int) wheels {
//    return wheels;
//}
//
//-(int) seats {
//    return seats;
//}

-(void)setWheels:(int)w Seats:(int)s {
    wheels = w;
    seats = s;
}

-(void) print {
    NSLog(@"wheels: %i, seats: %i", wheels, seats);
}

@end
