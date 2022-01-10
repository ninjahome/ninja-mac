#ifndef _CALL_BACK_HEADER_
#define _CALL_BACK_HEADER_

        typedef void (*UserInterfaceAPI) (char*);
        void bridge_func(UserInterfaceAPI f, char* v);

#endif