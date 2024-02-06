#import <Foundation/Foundation.h>
#import "StorageProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileStorage : NSObject <StorageProtocol>

@property (nonatomic) NSFileManager * fileManager;
@property (nonatomic) NSURL * robotFolderPath;
@property (nonatomic) NSURL * robotFilePath;

@end

NS_ASSUME_NONNULL_END
