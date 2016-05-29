//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)arrayArgument{
    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                   ascending:YES];
    NSArray *resultArray = [arrayArgument sortedArrayUsingDescriptors:@[sorter]];
    return resultArray;
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)arrayArgument{
    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:nil
                                                             ascending:NO];
    NSArray *resultArray = [arrayArgument sortedArrayUsingDescriptors:@[sorter]];
    return resultArray;
}
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)arrayArgument{
    NSMutableArray *resultArray = [arrayArgument mutableCopy];
    NSUInteger qq = [resultArray count]-1;
    [resultArray exchangeObjectAtIndex:0 withObjectAtIndex:qq];
    return resultArray;
}
-(NSArray *)arrayByReversingArray:(NSArray *)arrayArgument{
    NSMutableArray *resultArray = [arrayArgument mutableCopy];
    NSArray *reversed = [[resultArray reverseObjectEnumerator]allObjects];
    return reversed;
}
-(NSString *)stringInBasicLeetFromString:(NSString *)stringArgument{
    NSDictionary *leet = @{@"a" : @"4",
                           @"s" : @"5",
                           @"i" : @"1",
                           @"l" : @"1",
                           @"e" : @"3",
                           @"t" : @"7"};
    NSArray *keys = [leet allKeys];
    NSArray *values = [leet allValues];
    NSString *resultString = stringArgument;
    for (NSUInteger i = 0; i < [keys count];i ++){
        if ([stringArgument containsString:keys[i]]){
            resultString = [resultString stringByReplacingOccurrencesOfString:keys[i] withString:values[i]];
        }
    }
   return resultString;
}
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arrayArgument{
    NSMutableArray *arrOne = [[NSMutableArray alloc]init];
    NSMutableArray *arrTwo = [[NSMutableArray alloc]init];
    NSMutableArray *resultArray = [[NSMutableArray alloc]initWithObjects:arrOne,arrTwo, nil];
    
    for (NSInteger i = 0; i < [arrayArgument count]; i++){
        if ([arrayArgument[i] integerValue ] < 0){
            [arrOne addObject:arrayArgument[i]];

        }if ([arrayArgument[i]integerValue] >= 0){
            [arrTwo addObject:arrayArgument[i]];
        }
    }
    return resultArray;
}
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionaryArgument{
    NSArray *resultArray = [dictionaryArgument allKeysForObject:@"hobbit"];
    return resultArray;
}
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayArgument{
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[c] 'a'"];
    NSArray *resultArray = [arrayArgument filteredArrayUsingPredicate:filter];
    return resultArray;
}
-(NSInteger)sumOfIntegersInArray:(NSArray *)arrayArgument{
    NSInteger name = [[arrayArgument valueForKeyPath:@"@sum.self"] integerValue];
    return name;
}
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)arrayArgument{
    NSDictionary *exceptions = @{@"foot" :@"feet",
                                @"ox" :@"oxen",
                                @"radius" :@"radii",
                                @"trivium" :@"trivia",
                                 @"box" :@"boxes"};
    NSMutableArray *copy = [arrayArgument mutableCopy];
    NSArray *keys = [exceptions allKeys];
    //NSArray *values = [exceptions allValues];
    for (NSUInteger i = 0; i< [copy count]; i++){
        NSString *word = copy[i];
        if ([keys containsObject:copy[i]]){
            
            [copy replaceObjectAtIndex:i withObject:exceptions[word]];
        }else{
            NSString *string = [word stringByAppendingString:@"s"];
            [copy replaceObjectAtIndex:i withObject:string];
        }
    }
    return copy;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)stringArgument{
    
    NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc]init];
    NSString *stringS = [stringArgument lowercaseString];

    stringS = [stringS stringByReplacingOccurrencesOfString:@"." withString:@""];
    stringS = [stringS stringByReplacingOccurrencesOfString:@"," withString:@""];
    stringS = [stringS stringByReplacingOccurrencesOfString:@"-" withString:@""];
    stringS = [stringS stringByReplacingOccurrencesOfString:@";" withString:@""];
    NSMutableArray *arr = [[stringS componentsSeparatedByString:@" "]mutableCopy];
  
    NSCountedSet *set = [[NSCountedSet alloc] initWithArray:arr];

    for (NSString *word in set){
        NSInteger count = [set countForObject:word];
        NSNumber *countNumber = @(count);
        resultDictionary[word] = countNumber;
    }
    return resultDictionary;
}
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)arrayArgument{

    NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc] init];

    for (NSString *pair in arrayArgument){
         NSArray *pairArray = [pair componentsSeparatedByString:@" - "];
        NSMutableArray *value = [[NSMutableArray alloc]initWithObjects:pairArray[1], nil];
        //NSMutableArray *arr =[value mutableCopy];
        NSString *key = pairArray[0];
        
        if (![[resultDictionary allKeys] containsObject:key]){
            resultDictionary[key] = value;

        }else{
            [resultDictionary[key] addObject:pairArray[1]];
            
            
        }
        
    }

    for (NSString *qq in [resultDictionary allKeys]){
      
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        NSArray *arr = [resultDictionary[qq] sortedArrayUsingDescriptors:@[sort]];
          NSLog(@"\n\n\n\n\n\n\n%@ \n\n\n\n\n\n", arr);
        resultDictionary[qq] = arr;
    }
    return resultDictionary;
    }

/**
 
 * Define your methods here.
 
 
 */
@end
