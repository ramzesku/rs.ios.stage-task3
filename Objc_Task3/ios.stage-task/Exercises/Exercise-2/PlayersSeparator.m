#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    int count = 0;
    long countArray = (long) ratingArray.count;
    for (int i = 0; i < countArray - 2; i++) {
        for (int j = i + 1; j < countArray - 1; j++) {
            for (int k = j + 1; k < countArray; k++) {
                NSComparisonResult com1 = [ratingArray[i] compare:ratingArray[j]];
                NSComparisonResult com2 = [ratingArray[j] compare:ratingArray[k]];
                if (com1 == com2 && com1 != NSOrderedSame) {
                    count++;
                }
            }
        }
    }
    
    return count;
}

@end
