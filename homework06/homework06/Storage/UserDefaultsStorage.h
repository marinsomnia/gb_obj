#import <Foundation/Foundation.h>
#import "StorageProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultsStorage : NSObject <StorageProtocol>

@property (nonatomic) NSUserDefaults * userDefaults;

@end

NS_ASSUME_NONNULL_END
