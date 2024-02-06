#import <UIKit/UIKit.h>
#import "StorageProtocol.h"
#import "UserDefaultsStorage.h"
#import "Robot.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoadRobotViewController : UIViewController

@property (strong, nonatomic) Robot * robot;
@property (strong, nonatomic) UILabel * nameLabel;
@property (strong, nonatomic) UILabel * xLabel;
@property (strong, nonatomic) UILabel * yLabel;
@property (strong, nonatomic) UITextView * nameTextView;
@property (strong, nonatomic) UITextView * xTextView;
@property (strong, nonatomic) UITextView * yTextView;
@property (strong, nonatomic) id<StorageProtocol> storage;

- (instancetype)initWithStorage: (id<StorageProtocol>) storage;

@end

NS_ASSUME_NONNULL_END
