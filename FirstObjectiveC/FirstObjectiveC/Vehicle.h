//
//  Vehicle.h
//  FirstObjectiveC
//
//  Created by sapere4ude on 2021/02/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/*
 Class Object :
 Instance Object :
 Object : Class Object + Instance Object (두개를 합쳐서 오브젝트라 부른다)
 
 */

// 선언
@interface Vehicle : NSObject {
    // member variable
    int wheels;
    int seats;
}

// member method (프로퍼티 명령어가 getter,setter를 자동으로 만들어주는 역할을 한다! / Objective-C의 관례같은 느낌으로 세터는 setㅁㅁㅁ,  게터는 ㅁㅁㅁ 으로 정의)
@property int wheels;
@property int seats;

// 구현 (제일 앞부분의 - 가 의미하는것은 인스턴스 메서드를 의미한다), @synthesize -> @property로 만들어진 메서드들은 이 명령어를 사용해줘야 오류없이 돌아갈 수 있다.
-(void)setWheels:(int)w Seats:(int)s;   // 메서드안에서 파라미터 두가지를 한번에 받는 것

-(void)drawCircleX:(int)x Y:(int)y R:(int)r; // 파라미터의 수 = 콜론의 수 <- 이걸 반드시 기억해야한다. 새로운 인자 받을땐 반드시 띄어쓰기!




//-(void) setWheels:(int)w;
//-(void) setSeats:(int)s;
//-(int) wheels; // 게터 만들어줄때 getWheels 이런식으로 사용하지않고 wheels 로 작성해준다.
//-(int) seats;
-(void) print;

@end

NS_ASSUME_NONNULL_END
