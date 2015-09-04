/*******************************************************************************
 * Copyright (c) 2015, Jean-David Gadina - www.xs-labs.com / www.digidna.net
 * Distributed under the Boost Software License, Version 1.0.
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/

/*!
 * @file        Test-NSString+ObjectiveCPP.mm
 * @copyright   (c) 2015 - Jean-David Gadina - www.xs-labs.com / www.digidna.net
 * @abstract    Unit tests for NSString( ObjectiveCPP )
 */

#import <ObjectiveCPP.h>
#import <GoogleMock/GoogleMock.h>

using namespace testing;

TEST( Objective_CPP, defaultCPPStringEncoding )
{
    [ NSString setDefaultCPPStringEncoding: NSASCIIStringEncoding ];
    
    ASSERT_EQ( [ NSString defaultCPPStringEncoding ], NSASCIIStringEncoding );
    
    [ NSString setDefaultCPPStringEncoding: NSUTF8StringEncoding ];
    
    ASSERT_EQ( [ NSString defaultCPPStringEncoding ], NSUTF8StringEncoding );
}

TEST( Objective_CPP, stringWithCPPString )
{
    ASSERT_TRUE( [ [ NSString stringWithCPPString: "hello, world" ] isEqualToString: @"hello, world" ] );
}

TEST( Objective_CPP, stringWithCPPString_encoding )
{
    ASSERT_TRUE( [ [ NSString stringWithCPPString: "hello, world" encoding: NSUTF8StringEncoding  ] isEqualToString: @"hello, world" ] );
    ASSERT_TRUE( [ [ NSString stringWithCPPString: "hello, world" encoding: NSASCIIStringEncoding ] isEqualToString: @"hello, world" ] );
}

TEST( Objective_CPP, cppStringWithContentsOfFile_encoding_error )
{}

TEST( Objective_CPP, cppStringWithContentsOfFile_usedEncoding_error )
{}

TEST( Objective_CPP, cppStringWithContentsOfURL_encoding_error )
{}

TEST( Objective_CPP, cppStringWithContentsOfURL_usedEncoding_error )
{}

TEST( Objective_CPP, initWithCPPString )
{}

TEST( Objective_CPP, initWithCPPString_encoding )
{}

TEST( Objective_CPP, cppString )
{}

TEST( Objective_CPP, cppStringUsingEncoding )
{}

TEST( Objective_CPP, cppStringByAppendingString )
{}

TEST( Objective_CPP, stringByAppendingCPPString )
{}

TEST( Objective_CPP, cppStringByPaddingToLength_withString_startingAtIndex )
{}

TEST( Objective_CPP, stringByPaddingToLength_withCPPString_startingAtIndex )
{}

TEST( Objective_CPP, cppStringByTrimmingCharactersInSet )
{}

TEST( Objective_CPP, cppSubstringFromIndex )
{}

TEST( Objective_CPP, cppSubstringWithRange )
{}

TEST( Objective_CPP, cppSubstringToIndex )
{}

TEST( Objective_CPP, rangeOfCPPString )
{}

TEST( Objective_CPP, rangeOfCPPString_options )
{}

TEST( Objective_CPP, rangeOfCPPString_options_range )
{}

TEST( Objective_CPP, rangeOfCPPString_options_range_locale )
{}

TEST( Objective_CPP, cppStringByReplacingOccurrencesOfString_withString )
{}

TEST( Objective_CPP, cppStringByReplacingOccurrencesOfString_withString_options_range )
{}

TEST( Objective_CPP, stringByReplacingOccurrencesOfString_withCPPString )
{}

TEST( Objective_CPP, stringByReplacingOccurrencesOfString_withCPPString_options_range )
{}

TEST( Objective_CPP, stringByReplacingOccurrencesOfCPPString_withString )
{}

TEST( Objective_CPP, stringByReplacingOccurrencesOfCPPString_withString_options_range )
{}

TEST( Objective_CPP, stringByReplacingOccurrencesOfCPPString_withCPPString )
{}

TEST( Objective_CPP, stringByReplacingOccurrencesOfCPPString_withCPPString_options_range )
{}

TEST( Objective_CPP, cppStringByReplacingCharactersInRange_withString )
{}

TEST( Objective_CPP, stringByReplacingCharactersInRange_withCPPString )
{}

TEST( Objective_CPP, caseInsensitiveCompareWithCPPString )
{}

TEST( Objective_CPP, localizedCaseInsensitiveCompareWithCPPString )
{}

TEST( Objective_CPP, compareWithCPPString )
{}

TEST( Objective_CPP, localizedCompareWithCPPString )
{}

TEST( Objective_CPP, compareWithCPPString_options )
{}

TEST( Objective_CPP, compareWithCPPString_options_range )
{}

TEST( Objective_CPP, compareWithCPPString_options_range_locale )
{}

TEST( Objective_CPP, localizedStandardCompareWithCPPString )
{}

TEST( Objective_CPP, hasCPPStringPrefix )
{}

TEST( Objective_CPP, hasCPPStringSuffix )
{}

TEST( Objective_CPP, isEqualToCPPString )
{}

TEST( Objective_CPP, cppStringByFoldingWithOptions_locale )
{}

TEST( Objective_CPP, commonPrefixWithCPPString_options )
{}

TEST( Objective_CPP, commonCPPPrefixWithString_options )
{}

TEST( Objective_CPP, capitalizedCPPString )
{}

TEST( Objective_CPP, lowercaseCPPString )
{}

TEST( Objective_CPP, uppercaseCPPString )
{}

TEST( Objective_CPP, decomposedCPPStringWithCanonicalMapping )
{}

TEST( Objective_CPP, decomposedCPPStringWithCompatibilityMapping )
{}

TEST( Objective_CPP, precomposedCPPStringWithCanonicalMapping )
{}

TEST( Objective_CPP, precomposedCPPStringWithCompatibilityMapping )
{}

TEST( Objective_CPP, lastPathComponentAsCPPString )
{}

TEST( Objective_CPP, pathExtensionAsCPPString )
{}

TEST( Objective_CPP, cppStringByAbbreviatingWithTildeInPath )
{}

TEST( Objective_CPP, cppStringByAppendingPathComponent )
{}

TEST( Objective_CPP, cppStringByAppendingCPPPathComponent )
{}

TEST( Objective_CPP, cppStringByAppendingPathExtension )
{}

TEST( Objective_CPP, stringByAppendingCPPPathExtension )
{}

TEST( Objective_CPP, cppStringByDeletingLastPathComponent )
{}

TEST( Objective_CPP, cppStringByDeletingPathExtension )
{}

TEST( Objective_CPP, cppStringByExpandingTildeInPath )
{}

TEST( Objective_CPP, cppStringByResolvingSymlinksInPath )
{}

TEST( Objective_CPP, cppStringByStandardizingPath )
{}

TEST( Objective_CPP, cppStringByAddingPercentEscapesUsingEncoding )
{}

TEST( Objective_CPP, cppStringByReplacingPercentEscapesUsingEncoding )
{}

