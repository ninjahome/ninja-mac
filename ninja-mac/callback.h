#ifndef _CALL_BACK_HEADER_
#define _CALL_BACK_HEADER_

    typedef void (*FuncOneStr) (char*);
    typedef void (*FuncVoid) ();
    typedef int (*PeerIM) (char* from, char* decoded, long timeInMilSec);
    typedef int (*GroupIM) (char* from, char* gip, char* decoded, long timeInMilSec);

    typedef struct InterfaceClass{
        PeerIM peerMsg;
        GroupIM grpMsg;
        FuncOneStr logFunc;
        FuncOneStr nodeChanged;
        FuncVoid didOnline;
        FuncOneStr accountUpdate;
    }Interface;


    void ExecuteOnline(Interface cb);
    void ExecuteLog(Interface cb, char*v);
    void ExecuteAccUpdate(Interface cb, char*v);
    void ExecuteNodeIPChanged(Interface cb, char*v);
    int ExecutePeerIM(Interface cb, char* from, char* decoded, long timeInMilSec);
    int ExecuteGrpIM(Interface cb, char* from, char* gid, char* decoded, long timeInMilSec);

#endif