#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Coordinates : NSObject

@property (nonatomic) double x;
@property (nonatomic) double y;

- (void) setCoordinatesWithX: (double) x andY: (double) y;

@end

NS_ASSUME_NONNULL_END
