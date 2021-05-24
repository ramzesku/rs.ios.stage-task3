#import "LevelOrderTraversal.h"




NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    int count = 0;
    int level = 0;
    
    NSMutableArray<NSNumber*> *levels = [NSMutableArray new];
    NSMutableArray<NSNumber*> *rotation = [NSMutableArray new];

    for (NSObject *obj in tree) {
        if (rotation.count == 0 || rotation.lastObject.boolValue) {
            if ([obj isKindOfClass: [NSNull class]]) {
                [rotation removeLastObject];
                [rotation addObject: @NO];
            } else {
                [levels addObject: [NSNumber numberWithInt: level]];
                [rotation addObject: @YES];
                level++;
            }
        } else {
            if ([obj isKindOfClass: [NSNull class]]) {
                while (rotation.lastObject.boolValue == false) {
                    [rotation removeLastObject];
                    level--;
                }
                
                [rotation removeLastObject];
                [rotation addObject:@NO];
            } else {
                [levels addObject: [NSNumber numberWithInt: level]];
                [rotation addObject: @YES];
                level++;
            }
        }
    }

    if (levels.count == 0) {
        return  @[];
    }

    int max = [[levels valueForKeyPath: @"@max.intValue"] intValue];
    NSMutableArray<NSMutableArray*> *graf = [NSMutableArray new];
    for (int i = 0; i <= max; i++){
        [graf addObject: [NSMutableArray new]];
    }
    
    for (int i = 0; i < tree.count; i++){
        if ([tree[i] isKindOfClass: [NSNumber class]]){
            [graf[levels[count].intValue] addObject: tree[i]];
            count++;
        }
    }
    return graf;
}
