//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array{
    NSArray *result = @[];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    result = [array sortedArrayUsingDescriptors:@[sort]];
    return result;
}
-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
    NSArray *result = @[];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    result = [array sortedArrayUsingDescriptors:@[sort]];
    return result;
}
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array{
    NSMutableArray *result =[[NSMutableArray alloc]initWithArray:array];
    [result exchangeObjectAtIndex:[array count]-1 withObjectAtIndex:0];

    return result;
}
-(NSArray *)arrayByReversingArray:(NSArray *)array{
    NSArray *result = [[array reverseObjectEnumerator]allObjects];
    return result;
}
-(NSString *)stringInBasicLeetFromString:(NSString *)string{
    NSDictionary *dictionary = @{@"a" : @"4",
                                 @"s" : @"5",
                                 @"i" : @"1",
                                 @"l" : @"1",
                                 @"e" : @"3",
                                 @"t" : @"7"};
    NSString *result = @"";
    for (NSUInteger i = 0; i < [string length]; i++){
        
        NSString *letter = [NSString stringWithFormat:@"%c", [string characterAtIndex:i]];
        if (dictionary[letter] == nil){
            result = [result stringByAppendingString:letter];
        }else{
            result = [result stringByAppendingString:dictionary[letter]];
        }
    }
    return result;
}
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array{
    NSMutableArray *pos = [[NSMutableArray alloc]init];
    NSMutableArray *neg = [[NSMutableArray alloc]init];
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < [array count]; i++){
        NSInteger oneNumber = [array[i]integerValue];
        if (oneNumber >= 0){
            [pos addObject:array[i]];
        }else{
            [neg addObject:array[i]];
        }
    }
    [result addObject:neg];
    [result addObject:pos];
    return result;
}
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary{
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for (NSString *key in dictionary){
        if ([dictionary[key]  isEqual: @"hobbit"]){
            [result addObject:key];
        }
    }
    return result;
}
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array{
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for (NSString *word in array){
        if ([[word lowercaseString] hasPrefix:@"a"]){
            [result addObject:word];
        }
    }
    return result;
}
-(NSInteger)sumOfIntegersInArray:(NSArray *)array{
    
    NSNumber *resultNumber = [array valueForKeyPath:@"@sum.self"];
    NSInteger result = [resultNumber integerValue];
    return result;
}
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array{
    NSMutableArray *result = [[NSMutableArray alloc]init];
    NSDictionary * exeptions = @{@"foot" : @"feet",
                                 @"ox" : @"oxen",
                                 @"radius" : @"radii",
                                 @"trivium" : @"trivia"};
    for (NSString *single in array){
        NSString *string = single;
        if ([[exeptions allKeys]containsObject:single]){
            [result addObject:exeptions[single]];
        }else if([single hasSuffix:@"x"]){
            string = [single stringByAppendingString:@"es"];
            [result addObject:string];
        }else{
            string = [single stringByAppendingString:@"s"];
            [result addObject:string];
        }
    }
    return result;
}
-(NSDictionary *)countsOfWordsInString:(NSString *)string{
    NSArray *punctuation = @[@".", @",", @"-", @";"];
    NSString *noPunctuation = string;
    NSArray *separated;
    NSMutableDictionary *result = [[NSMutableDictionary alloc]init];
    
    for (NSString *character in punctuation){
        noPunctuation = [[noPunctuation stringByReplacingOccurrencesOfString:character withString:@""]lowercaseString];
        separated = [noPunctuation componentsSeparatedByString:@" "];
    }
    for (NSString *word in separated){
        if(result[word]==nil){
            result[word] = @1;

        }else{
            NSInteger qq = [result[word]integerValue]+1;
            result[word] = @(qq);
        }
    }
    return result;
}
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
    NSMutableDictionary *result = [[NSMutableDictionary alloc]init];

    
    for (NSString *initString in array){
        NSArray *separated = [initString componentsSeparatedByString:@" - "];
        NSString *artist = separated[0];
        NSString *song = separated[1];
        NSMutableArray *songsArray = [[NSMutableArray alloc]init];
        
        if (result[artist] == nil){
            [songsArray addObject:song];
            result[artist] = songsArray;
        }else{
            [result[artist] addObject:song];
        }
    }
    for(NSString *key in [result allKeys]){
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil
                                                               ascending:YES];
        NSMutableArray *sortedValues = [[result[key] sortedArrayUsingDescriptors:@[sort]]mutableCopy];
        result[key] = sortedValues;

    }
    return result;
}





















//-(NSArray *)arrayBySortingArrayAscending:(NSArray *)arrayArgument{
//    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:nil
//                                                                   ascending:YES];
//    NSArray *resultArray = [arrayArgument sortedArrayUsingDescriptors:@[sorter]];
//    return resultArray;
//}
//
//-(NSArray *)arrayBySortingArrayDescending:(NSArray *)arrayArgument{
//    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:nil
//                                                             ascending:NO];
//    NSArray *resultArray = [arrayArgument sortedArrayUsingDescriptors:@[sorter]];
//    return resultArray;
//}
//-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)arrayArgument{
//    NSMutableArray *resultArray = [arrayArgument mutableCopy];
//    NSUInteger qq = [resultArray count]-1;
//    [resultArray exchangeObjectAtIndex:0 withObjectAtIndex:qq];
//    return resultArray;
//}
//-(NSArray *)arrayByReversingArray:(NSArray *)arrayArgument{
//    NSMutableArray *resultArray = [arrayArgument mutableCopy];
//    NSArray *reversed = [[resultArray reverseObjectEnumerator]allObjects];
//    return reversed;
//}
//-(NSString *)stringInBasicLeetFromString:(NSString *)stringArgument{
//    NSDictionary *leet = @{@"a" : @"4",
//                           @"s" : @"5",
//                           @"i" : @"1",
//                           @"l" : @"1",
//                           @"e" : @"3",
//                           @"t" : @"7"};
//    NSArray *keys = [leet allKeys];
//    NSArray *values = [leet allValues];
//    NSString *resultString = stringArgument;
//    for (NSUInteger i = 0; i < [keys count];i ++){
//        if ([stringArgument containsString:keys[i]]){
//            resultString = [resultString stringByReplacingOccurrencesOfString:keys[i] withString:values[i]];
//        }
//    }
//   return resultString;
//}
//-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arrayArgument{
//    NSMutableArray *arrOne = [[NSMutableArray alloc]init];
//    NSMutableArray *arrTwo = [[NSMutableArray alloc]init];
//    NSMutableArray *resultArray = [[NSMutableArray alloc]initWithObjects:arrOne,arrTwo, nil];
//    
//    for (NSInteger i = 0; i < [arrayArgument count]; i++){
//        if ([arrayArgument[i] integerValue ] < 0){
//            [arrOne addObject:arrayArgument[i]];
//
//        }if ([arrayArgument[i]integerValue] >= 0){
//            [arrTwo addObject:arrayArgument[i]];
//        }
//    }
//    return resultArray;
//}
//-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionaryArgument{
//    NSArray *resultArray = [dictionaryArgument allKeysForObject:@"hobbit"];
//    return resultArray;
//}
//-(NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayArgument{
//    NSPredicate *filter = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[c] 'a'"];
//    NSArray *resultArray = [arrayArgument filteredArrayUsingPredicate:filter];
//    return resultArray;
//}
//-(NSInteger)sumOfIntegersInArray:(NSArray *)arrayArgument{
//    NSInteger name = [[arrayArgument valueForKeyPath:@"@sum.self"] integerValue];
//    return name;
//}
//-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)arrayArgument{
//    NSDictionary *exceptions = @{@"foot" :@"feet",
//                                @"ox" :@"oxen",
//                                @"radius" :@"radii",
//                                @"trivium" :@"trivia",
//                                 @"box" :@"boxes"};
//    NSMutableArray *copy = [arrayArgument mutableCopy];
//    NSArray *keys = [exceptions allKeys];
//    //NSArray *values = [exceptions allValues];
//    for (NSUInteger i = 0; i< [copy count]; i++){
//        NSString *word = copy[i];
//        if ([keys containsObject:copy[i]]){
//            
//            [copy replaceObjectAtIndex:i withObject:exceptions[word]];
//        }else{
//            NSString *string = [word stringByAppendingString:@"s"];
//            [copy replaceObjectAtIndex:i withObject:string];
//        }
//    }
//    return copy;
//}
//
//-(NSDictionary *)countsOfWordsInString:(NSString *)stringArgument{
//    
//    NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc]init];
//    NSString *stringS = [stringArgument lowercaseString];
//
//    stringS = [stringS stringByReplacingOccurrencesOfString:@"." withString:@""];
//    stringS = [stringS stringByReplacingOccurrencesOfString:@"," withString:@""];
//    stringS = [stringS stringByReplacingOccurrencesOfString:@"-" withString:@""];
//    stringS = [stringS stringByReplacingOccurrencesOfString:@";" withString:@""];
//    NSMutableArray *arr = [[stringS componentsSeparatedByString:@" "]mutableCopy];
//  
//    
//
//    NSCountedSet *set = [[NSCountedSet alloc] initWithArray:arr];
//
//    for (NSString *word in set){
//        NSInteger count = [set countForObject:word];
//        NSNumber *countNumber = @(count);
//        resultDictionary[word] = countNumber;
//    }
//    return resultDictionary;
//}
//-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)arrayArgument{
//
//    NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc] init];
//
//    for (NSString *pair in arrayArgument){
//         NSArray *pairArray = [pair componentsSeparatedByString:@" - "];
//        NSMutableArray *value = [[NSMutableArray alloc]initWithObjects:pairArray[1], nil];
//        //NSMutableArray *arr =[value mutableCopy];
//        NSString *key = pairArray[0];
//        
//        if (![[resultDictionary allKeys] containsObject:key]){
//            resultDictionary[key] = value;
//
//        }else{
//            [resultDictionary[key] addObject:pairArray[1]];
//            
//        }
//        
//    }
//
//    for (NSString *qq in [resultDictionary allKeys]){
//      
//        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
//        NSArray *arr = [resultDictionary[qq] sortedArrayUsingDescriptors:@[sort]];
//          NSLog(@"\n\n\n\n\n\n\n%@ \n\n\n\n\n\n", arr);
//        resultDictionary[qq] = arr;
//    }
//    return resultDictionary;
//    }

/**
 
 * Define your methods here.
 
 
 */
@end
