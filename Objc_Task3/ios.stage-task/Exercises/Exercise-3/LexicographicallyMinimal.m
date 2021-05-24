#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableArray<NSString *> *array = @[string1, string2].mutableCopy;
    NSMutableString *rezult = [NSMutableString new];
    
    while (array[0].length + array[1].length != 0) {
        NSString *minChar = nil;
        int minIndex = -1;
        
        for (int i = 0; i < array.count; i++) {
            if (array[i].length > 0) {
                NSString *first = [array[i] substringToIndex:1];
                if (minChar == nil || [first compare:minChar] == NSOrderedAscending) {
                    minChar = first;
                    minIndex = i;
                }
            }
        }
        
        if (minIndex > -1) {
            NSString *firstLetter = [array[minIndex] substringToIndex:1];
            array[minIndex] = [array[minIndex] substringFromIndex:1];
            [rezult appendString:firstLetter];
        }
        
    }
    
    
    return rezult;
}

@end
