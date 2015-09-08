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
 * @header      List.hpp
 * @copyright   (c) 2015 - Jean-David Gadina - www.xs-labs.com / www.digidna.net
 */

#include <list>

#ifndef NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_END
#endif

NS_ASSUME_NONNULL_BEGIN

namespace ObjectiveCPP
{
    NSArray * ArrayFromList( const std::list< std::string > & vector );
    NSArray * ArrayFromList( const std::list< bool > & vector );
    NSArray * ArrayFromList( const std::list< signed char > & vector );
    NSArray * ArrayFromList( const std::list< unsigned char > & vector );
    NSArray * ArrayFromList( const std::list< signed short > & vector );
    NSArray * ArrayFromList( const std::list< unsigned short > & vector );
    NSArray * ArrayFromList( const std::list< signed int > & vector );
    NSArray * ArrayFromList( const std::list< unsigned int > & vector );
    NSArray * ArrayFromList( const std::list< signed long > & vector );
    NSArray * ArrayFromList( const std::list< unsigned long > & vector );
    NSArray * ArrayFromList( const std::list< signed long long > & vector );
    NSArray * ArrayFromList( const std::list< unsigned long long > & vector );
    NSArray * ArrayFromList( const std::list< float > & vector );
    NSArray * ArrayFromList( const std::list< double > & vector );
    
    template < typename T, typename ObjCClass >
    NSArray * ArrayFromList( const std::list< T > & vector, SEL initMethod )
    {
        NSMutableArray * a;
        id ( * i )( id, SEL, T );
        
        a = [ NSMutableArray arrayWithCapacity: vector.size() ];
        
        if( [ ObjCClass instancesRespondToSelector: initMethod ] )
        {
            for( auto v: vector )
            {
                {
                    id o;
                    
                    o = [ ObjCClass alloc ];
                    i = reinterpret_cast< id ( * )( id, SEL, T ) >( [ o methodForSelector: initMethod ] );
                    
                    if( i != NULL )
                    {
                        o = i( o, initMethod, v );
                        
                        if( o != nil )
                        {
                            [ a addObject: o ];
                        }
                    }
                    
                    #if !defined( __clang__ ) || !defined( __has_feature ) || !__has_feature( objc_arc )
                    [ o release ];
                    #endif
                }
            }
        }
        
        return [ NSArray arrayWithArray: a ];
    }
    
    template < typename T, typename ObjCClass >
    std::list< T > ListFromArray( NSArray * array, SEL getter )
    {
        std::list< T > l;
        id             o;
        T ( * i )( id, SEL );
        
        if( [ ObjCClass instancesRespondToSelector: getter ] )
        {
            for( o in array )
            {
                if( [ o isKindOfClass: [ ObjCClass class ] ] )
                {
                    i = reinterpret_cast< T ( * )( id, SEL ) >( [ o methodForSelector: getter ] );
                    
                    if( i != NULL )
                    {
                        l.push_back( i( o, getter ) );
                    }
                }
            }
        }
        
        return l;
    }
}

NS_ASSUME_NONNULL_END
