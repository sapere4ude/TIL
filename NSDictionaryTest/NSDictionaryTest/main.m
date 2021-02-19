//
//  main.m
//  NSDictionaryTest
//
//  Created by Kant on 2021/02/19.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // initWithObjectsAndKeys -> object,key의 반복된 구조로 만들어져있다
        NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"칸트",@"이름",@"모름",@"나이", nil];
        
        NSLog(@"name: %@", [dic objectForKey:@"이름"]);
        NSLog(@"age: %@", [dic objectForKey:@"나이"]);
        
        // Mutable Dictionary(가변 딕셔너리)
        NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithDictionary:dic];
        
        [mdic setObject:@"한국" forKey:@"사는곳"];
        [mdic setObject:@"찜닭" forKey:@"좋아하는 음식"];
        
        NSLog(@"name: %@", [mdic objectForKey:@"이름"]);
        NSLog(@"age: %@", [mdic objectForKey:@"나이"]);
        NSLog(@"location: %@", [mdic objectForKey:@"사는곳"]);
        NSLog(@"favoriteFood: %@", [mdic objectForKey:@"좋아하는 음식"]);
        
    }
    return 0;
}
