//
//  main.m
//  Jun13
//
//  Created by david morton on 6/7/13.
//  Copyright (c) 2013 David Morton Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Jun13AppDelegate.h"

int main(int argc, char *argv[])
{
	@autoreleasepool {
		
		//Print a Immutable String to the Apple System Log
		NSLog(@"This is a test of the NSLog function");
		
		//Format specifiers supported by the NSString formatting methods and CFString formatting functions
		//http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html#//apple_ref/doc/uid/TP40004265
		
		
		
		
		//QUESTIONS TO RESEARCH FURTHER:
		//1. While int is currently 32 bits in iOS 6, if future iphones come with 64 bit processors this is expected to change or is this really up to apple at the end of the day?
		//2. Are the two size_t definitions below correct?
		//3. How do we concatenate Strings? 
		//4. In the class notes it said "A CGFloat can hold up to 6 significant digits." "A double can hold up to 15 significant digits."  Is this guaranteed forever because it is Core Graphics?  IE are we promised by apple that Core Graphics never going to change storage sizes for these classes regardless of implementation?
		//5. What are there any issues/differences for older versions of iOS or older devices? 32 vs 64 bit issues?
		//6. Why is char type consider an integer type?
		//7. How can I see limits.h?
		
		
		
		//  *** START OF C PRIMITIVES ***
		
		//Integer data types have different sizes and can be either signed or unsigned
		//While the char type is always 8 bits (aka 1 byte), the exact size of the other integer types is implementation-dependent
		// The only guaranty is that short <= int <= long <= long long
		//it is possible to determine their exact sizes at runtime by sizeof(int) or convenient macro constants like UINT_MAX seen below (related to limits.h?)
		
		//int uses the %d format specifier
		int theAnswer = 42;
		NSLog(@"The answer is %d.", theAnswer);
		
		//the %z length modifier specifying that a following d, o, u, x, or X conversion specifier applies to a size_t or the corresponding signed integer type argument.
		//size_t is an unsigned integer whose bit size is large enough to hold a pointer of the native architecture
		//The size_t type is dedicated solely to representing memory-related values, and it is guaranteed to be able to store the maximum size of an array.
		NSLog(@"You can find out the size of int in bytes by sizeof(int)=%zd", sizeof(int));
		
		
		
		//For iPhone 5/ios 6, The maximum value of an unsigned int is 2^32 -1
		//C implementations provide convenient macros for accessing the minimum and maximum values that each type can represent
		unsigned int anUnsignedInt=UINT_MAX;
		NSLog(@"the maximimum value of an unsigned int is found by UINT_MAX=%u.", anUnsignedInt);
		
		//Quick char Test
		char charVar='V';
		NSLog(@"charVar=%c",charVar);
		
		//CGFloat and double use %g
		//CG Float is recomended to hold the location of a pixel on the screen
		CGFloat eulersNumber = 2.71828;
		NSLog(@"The value of Euler's number is %g.", eulersNumber);
		
		//examining a double
		//Question: The printed result below contains 3.141593 - that is 7 digits. How do we store/print above value w/o rounding?
		long double pi=3.14159265358979;
		NSLog(@"The value of pi is %Lf.", pi);
		
		//NSString class manages immutable strings
		NSString *s = @"I am fine";
		NSLog(@"The value of s is %@.", s);
		
		
		//BASIC STRUCTURES
		
		//CGPoint is a structure that contains a point in a two-dimensional coordinate system.
		//The fields of a CGPoint might be negative
		CGPoint p = CGPointMake(14.0, 24.0);
		NSLog(@"The value of p is (%g, %g).", p.x, p.y);
		
		//CGRect is a structure that contains the location and dimensions of a rectangle
		CGRect r = CGRectMake(0.0, 0.0, 360.0, 480.0);
		NSLog(@"The value of r is (%g, %g), %g by %g.",
			  r.origin. x, r.origin.y,
			  r.size.width, r.size.height
			  );
			
		
		//Basic Math
		
		//if x >= 0 and y > 0 If you divide by another int that on a calculator result in a decimal it rounds down
		NSLog(@"19/10 is %d.", (19/10));
		
		//Note how to express modulus operator in NSLog below
		NSLog(@"19 %% 10 is %d.", (19%10));
		//cast some of your numbers to floating-point forms before performing division.  Need to review appropriate casting technique
		NSLog(@"The answer is %g.", ((float)19)/10);
		
		
		//There is only one object of class UIDevice, and it already exists.  Get the address of this object.
		UIDevice *device = [UIDevice currentDevice];
		
		NSString *version = device.systemVersion;
		NSLog(@"The version of iOS is %@.", version);
		
		
		
		//There is only one object of class UIScreen, and it already exists.  Get the address of this object.
		UIScreen *screen = [UIScreen mainScreen];
		
		CGRect bounds = [screen bounds];
		NSLog(@"Origin is (%g, %g), dimensions are %g by %g.",
			  bounds.origin.x, bounds.origin.y,
			  bounds.size.width, bounds.size.height
			  );

		
		

		
		
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([Jun13AppDelegate class]));
	}
}
