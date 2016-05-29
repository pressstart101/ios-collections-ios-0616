//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)arrayArgument;
-(NSArray *)arrayBySortingArrayDescending:(NSArray *)arrayArgument;
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)arrayArgument;
-(NSArray *)arrayByReversingArray:(NSArray *)arrayArgument;
-(NSString *)stringInBasicLeetFromString:(NSString *)stringArgument;
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)arrayArgument;
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionaryArgument;
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)arrayArgument;
-(NSInteger)sumOfIntegersInArray:(NSArray *)arrayArgument;
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)arrayArgument;
-(NSDictionary *)countsOfWordsInString:(NSString *)stringArgument;
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)arrayArgument;



//@property(readonly) BOOL ascending

@end
