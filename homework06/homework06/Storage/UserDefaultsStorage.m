#import "UserDefaultsStorage.h"

@implementation UserDefaultsStorage

- (instancetype)init
{
    self = [super init];
    if (self) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (Robot *)loadRobot {
    NSData * robotData = [self.userDefaults objectForKey:@"robot"];
    Robot * robot = [NSKeyedUnarchiver unarchiveObjectWithData:robotData];
//                                                              :Robot.class fromData:robotData error:nil];
    NSLog(@"Robot has been loaded from User Defaults");
    return robot;
}

- (void)saveRobot:(Robot *)robot {
    NSData *encodedRobot = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:nil error:nil];
    [self.userDefaults setObject:encodedRobot forKey:@"robot"];
    NSLog(@"Robot has been saved to User Defaults");
}

@end
