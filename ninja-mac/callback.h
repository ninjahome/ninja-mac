#ifndef _CALL_BACK_HEADER_
#define _CALL_BACK_HEADER_

    typedef void (*FuncOneStr) (char*);
    typedef int (*PeerIM) (char* from, char* decoded, char* payload, long timeInMilSec);


    typedef struct InterfaceClass{
        PeerIM peerMsg;
        FuncOneStr logFunc;
        FuncOneStr nodeChanged;
    }Interface;


    void ExecuteLog(Interface cb, char*v);
    void ExecuteNodeIPChanged(Interface cb, char*v);
    int ExecutePeerIM(Interface cb, char* from, char* decoded, char* payload, long timeInMilSec);

#endif