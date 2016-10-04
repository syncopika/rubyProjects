rubyKoans log/notes  - for the exercises from http://rubykoans.com/ 

(1.-2.) changed "assert false" to "assert true" for the function "def test_assert_true" in "about_asserts.rb".    
   -a basic error with a wrong assertion.    
        
(3.-5.) changed assert false to return true by correcting the arugements passed. (i.e. 1+1, __), where __ should be changed to 2. Also saw that
       in one case, the test used == to check equality, but then in another there was assert_equal. Both work the same? 

(6.) nil test - nil is an object, just like null in JavaScript. The comment I thought was a little confusing, in that I thought it implied that nil
              was not an object. 

(7.) when you try to call a method that doesn't exist on a nil object, an exception, called NoMethodError, is thrown. The message lets you know that method you tried
   to call is 'undefined'. 

(8.) nil IS nil, so nil.nil? returns true. nil.to_s returns an empty string. nil.inspect returns the string "nil". For the "Think About It" part, I feel like it would
   probably be better to use obj.nil? since it's shorter? I was thinking about how in Java, one should compare objects using an equals method, not ==, since == really only
   looks at if the two things being compared have the same memory address (so it checks aliasing, and not actual object equality). But I read that in Ruby, using == calls
   the equals method, so obj.nil? and obj == nil should give the same result (VERIFY THIS). .nil? being a method also means though that it could be overridden, which might be helpful?

(9.) Everything in Ruby is an OBJECT!

(10.-11.) Objects in Ruby can be converted to strings, and inspected (which returns string representing that object).

(12.) Objects have ID numbers, of the Fixnum class. I think these numbers are supposed to be related to their object's memory address.
