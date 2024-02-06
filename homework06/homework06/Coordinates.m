#import "Coordinates.h"

@implementation Coordinates

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.x = 0;
        self.y = 0;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Coordinates: x = %.1f, y = %.1f", self.x, self.y];
}

- (void) setCoordinatesWithX: (double) x andY: (double) y {
    self.x = x;
    self.y = y;
}

@end
