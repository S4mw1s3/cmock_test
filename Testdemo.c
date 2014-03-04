#include "unity.h"
#include "dothing.h"
#include "Mockdothing.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void foo()
{
    DoThing(1,2);
    DoThing(2,4);
    DoThing(10,2);
    DoThingAndReturnInt(1,2);
    DoThingAndReturnInt(4,5);
    DoThingAndReturnInt(2,5);
}

void test_demo(void)
{
    /* If you use ExpectAnyArgs ( or ExpectAnyArgsAndReturn ), then you have to expect every call to the function! */
    DoThing_ExpectAnyArgs();
    DoThing_ExpectAnyArgs();
    DoThing_ExpectAnyArgs();
    
    /* If you use Ignore ( or IgnoreAndReturn ), then every call to this function will be ignored! */
    DoThingAndReturnInt_IgnoreAndReturn(0);

    foo();
}
