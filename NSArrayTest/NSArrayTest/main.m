//
//  main.m
//  NSArrayTest
//
//  Created by Kant on 2021/02/19.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *month = [[NSArray alloc]initWithObjects:@"January",@"Febrauary",@"March",@"April",
                          @"May",@"June",@"July",@"August",@"September",nil];
        
        // C언어 스타일의 for문 출력 예시
//        for (int i=0; i<[month count]; i++) {
//            NSLog(@"month: %@", [month objectAtIndex:i]);   // [month objectAtIndet:i] = month[i]
//        }
        
        // Objective-C 스타일의 for-in문 출력 예시
        for (NSString *strTemp in month) {
            NSLog(@"month : %@", strTemp);
        }
        
        // Mutable이기때문에 값을 추가,삭제 해줄 수 있다.
        NSMutableArray *mmonth = [NSMutableArray arrayWithArray:month];
        
        [mmonth addObject:@"October"];
        [mmonth addObject:@"November"];
        [mmonth addObject:@"December"];
        
        for (NSString *strTemp in mmonth) {
            NSLog(@"mmonth : %@", strTemp);
        }
        
        
    }
    return 0;
}
