#import <UIKit/UIKit.h>
#import "Robot.h"

@protocol StorageProtocol <NSObject>

- (void)saveRobot:(Robot *)robot;
- (Robot *)loadRobot;

@end
