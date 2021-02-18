//
//  main.m
//  FirstObjectiveC
//
//  Created by sapere4ude on 2021/02/18.
//

// 애플에서 기본 제공하는 프레임워크들은 <> 표시로 선언, 내가 만든 파일은 ""로 선언
#import <Foundation/Foundation.h>
#import "Vehicle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Vehicle *hello = [[Vehicle alloc] init]; // create instance object
        
        //[Receiver Message] 공식 문서보면 send 라는 표현을 많이 사용함
        
        // case1
        [hello setWheels:4];
        [hello setSeats:4];
        
        // case2
//        hello.wheels = 4;
//        hello.seats = 2;
  
//        [hello setWheels:4 Seats:2];
//        [hello drawCircleX:3 Y:1 R:5];
        
        
        
        //[hello print];
        NSLog(@"wheels : %i , seats: %i", [hello wheels], [hello seats]);
        
        // if문 연습
        if ([hello wheels] == 4) {
            NSLog(@"wheels: %i", [hello wheels]);
        } else {
            NSLog(@"👻");
        }
        
        // switch 연습
        switch ([hello seats]) {
            case 4:
                NSLog(@"👍🏻");
                break;
            case 3:
                break;
            default:
                break;
        }
        
        
        // for문 연습
        for (int i=0; i<[hello wheels]; i++) {
            NSLog(@"wheels: %i", i);
        }
        
        // while문 연습
        int i = 0;
        while (i < [hello seats]) {
            NSLog(@"seats : %i", i);
            i++;
        }
    }
    return 0;
}
