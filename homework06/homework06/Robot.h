#import <Foundation/Foundation.h>
#import "Coordinates.h"

NS_ASSUME_NONNULL_BEGIN

@interface Robot : NSObject<NSCoding>

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) Coordinates * coordinates;

- (instancetype) initWithName: (NSString *) name andX: (double) x andY: (double) y;
- (void) printPosition;
- (void) setCoordinatesWithX: (double) x andY: (double) y;

@end

NS_ASSUME_NONNULL_END
