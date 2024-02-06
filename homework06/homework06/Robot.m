#import "Robot.h"

@implementation Robot

- (instancetype) init {
    self = [super init];
    if (self) {
        self.coordinates = [Coordinates new];
    }
    return self;
}

- (instancetype) initWithName: (NSString *) name andX: (double) x andY: (double) y {
    self = [self init];
    self.name = name;
    [self setCoordinatesWithX:x andY:y];
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)coder {
    NSString * name = [coder decodeObjectForKey:@"name"];
    double x = [coder decodeDoubleForKey:@"x"];
    double y = [coder decodeDoubleForKey:@"y"];
    self = [self initWithName:name andX:x andY:y];
    return self;
}

- (void) printPosition {
    NSLog(@"%@",self.coordinates);
}

- (void) setCoordinatesWithX: (double) x andY: (double) y {
    [self.coordinates setCoordinatesWithX:x andY:y];
}

- (void) encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeDouble:self.coordinates.x forKey:@"x"];
    [coder encodeDouble:self.coordinates.y forKey:@"y"];
}

- (NSString *) description {
    return [NSString stringWithFormat:@"robot %@, is at %@", self.name, self.coordinates];
}

@end
