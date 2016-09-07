//
//  main.m
//  BinarySearchTest
//
//  Created by Jesse Sahli on 6/7/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        NSString *textFile = [NSString stringWithContentsOfFile:@"/Users/jessesahli/Downloads/assorted-breakfast-2.txt" encoding:NSUTF8StringEncoding error:nil];
        
        
        
        NSArray *lineArray = [textFile componentsSeparatedByString:@"\n"];
        
        
        NSInteger lower = 0;
        NSInteger upper = lineArray.count;
        NSInteger middle = (lower + upper)/2;
        
        NSString *searchString = @"Whoa! Mr. Trout!\"";
        NSString *testString = lineArray[middle];
        
        
        while(1){
            NSComparisonResult result = [searchString caseInsensitiveCompare:testString];
        
            if (result == NSOrderedAscending){ // search < test
                upper = middle - 1;
                middle = (lower + upper)/2;
                testString = lineArray[middle];
                continue;
            } else if (result == NSOrderedDescending){ // search > test
                lower = middle + 1;
                middle = (lower + upper)/2;
                testString = lineArray[middle];
                continue;
            } else if (result == NSOrderedSame){ // search == test
                //Add one to the index because the lines in the text file begin at one!
                NSLog(@"The search term is found on line %ld", ((long)middle) + 1);
                break;
            }
        }
        
    }
    return 0;
}
