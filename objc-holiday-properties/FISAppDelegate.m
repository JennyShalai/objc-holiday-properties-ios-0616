//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    NSArray *holidaysInSeason = self.database[season];
    return holidaysInSeason;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSArray *suppliesInHoliday = self.database[season][holiday];
    return suppliesInHoliday;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    BOOL isHolidayInSeason = NO;
    NSDictionary *holidaysInSeason = self.database[season];
    NSArray *holidays = [holidaysInSeason allKeys];
    if ([holidays containsObject:holiday]) {
        isHolidayInSeason = YES;
    }
    return isHolidayInSeason;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    BOOL isSupplyInHoliday = NO;
    NSArray * suppliesInHoliday = self.database[season][holiday];
    if ([suppliesInHoliday containsObject:supply]) {
        isSupplyInHoliday = YES;
    }
    return isSupplyInHoliday;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    self.database[season][holiday] = [[NSMutableArray alloc] init];
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    NSMutableArray *allSupplies = self.database[season][holiday];
    [allSupplies addObject:supply];
}

@end
