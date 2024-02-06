#import <UIKit/UIKit.h>
#import "StorageProtocol.h"
#import "UserDefaultsStorage.h"
#import "FileStorage.h"
#import "Robot.h"

NS_ASSUME_NONNULL_BEGIN

@interface SaveRobotViewController : UIViewController

@property (strong, nonatomic) UITextField * nameTextField;
@property (strong, nonatomic) UITextField * xTextField;
@property (strong, nonatomic) UITextField * yTextField;
@property (strong, nonatomic) UIButton * saveToFilesButton;
@property (strong, nonatomic) UIButton * saveToUserDefaultsButton;
@property (strong, nonatomic) id<StorageProtocol> userDefaultsStorage;
@property (strong, nonatomic) id<StorageProtocol> fileStorage;

//- (void) saveToFiles;
//- (void) saveToUserDefaults;
//- (void) setupConstraints;

@end

NS_ASSUME_NONNULL_END
