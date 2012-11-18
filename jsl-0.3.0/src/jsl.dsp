# Microsoft Developer Studio Project File - Name="jsl" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=jsl - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "jsl.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "jsl.mak" CFG="jsl - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "jsl - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "jsl - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "jsl - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\jsl\Release"
# PROP BASE Intermediate_Dir ".\jsl\Release"
# PROP BASE Target_Dir ".\jsl"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\Release"
# PROP Intermediate_Dir ".\Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ".\jsl"
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Od /D "NDEBUG" /D "_CONSOLE" /D "WIN32" /D "XP_WIN" /D "JSFILE" /D "LINK_JS_API" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "jsl - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\jsl\jsl_"
# PROP BASE Intermediate_Dir ".\jsl\jsl_"
# PROP BASE Target_Dir ".\jsl"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\Debug"
# PROP Intermediate_Dir ".\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ".\jsl"
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /D "_CONSOLE" /D "_DEBUG" /D "WIN32" /D "XP_WIN" /D "JSFILE" /D "DEBUG" /D "LINK_JS_API" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ENDIF 

# Begin Target

# Name "jsl - Win32 Release"
# Name "jsl - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\jsl.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\jsapi.h
# End Source File
# Begin Source File

SOURCE=.\jsarena.h
# End Source File
# Begin Source File

SOURCE=.\jsatom.h
# End Source File
# Begin Source File

SOURCE=.\jsclist.h
# End Source File
# Begin Source File

SOURCE=.\jscntxt.h
# End Source File
# Begin Source File

SOURCE=.\jscompat.h
# End Source File
# Begin Source File

SOURCE=.\jsconfig.h
# End Source File
# Begin Source File

SOURCE=.\jscpucfg.h
# End Source File
# Begin Source File

SOURCE=.\jsdbgapi.h
# End Source File
# Begin Source File

SOURCE=.\jsemit.h
# End Source File
# Begin Source File

SOURCE=.\jsfun.h
# End Source File
# Begin Source File

SOURCE=.\jsgc.h
# End Source File
# Begin Source File

SOURCE=.\jshash.h
# End Source File
# Begin Source File

SOURCE=.\jsinterp.h
# End Source File
# Begin Source File

SOURCE=.\jslock.h
# End Source File
# Begin Source File

SOURCE=.\jslong.h
# End Source File
# Begin Source File

SOURCE=.\jsobj.h
# End Source File
# Begin Source File

SOURCE=.\jsopcode.h
# End Source File
# Begin Source File

SOURCE=.\jsosdep.h
# End Source File
# Begin Source File

SOURCE=.\jsotypes.h
# End Source File
# Begin Source File

SOURCE=.\jsparse.h
# End Source File
# Begin Source File

SOURCE=.\jsprf.h
# End Source File
# Begin Source File

SOURCE=.\jsprvtd.h
# End Source File
# Begin Source File

SOURCE=.\jspubtd.h
# End Source File
# Begin Source File

SOURCE=.\jsregexp.h
# End Source File
# Begin Source File

SOURCE=.\jsscan.h
# End Source File
# Begin Source File

SOURCE=.\jsscope.h
# End Source File
# Begin Source File

SOURCE=.\jsscript.h
# End Source File
# Begin Source File

SOURCE=.\jsstddef.h
# End Source File
# Begin Source File

SOURCE=.\jsstr.h
# End Source File
# Begin Source File

SOURCE=.\jstypes.h
# End Source File
# Begin Source File

SOURCE=.\jsutil.h
# End Source File
# Begin Source File

SOURCE=.\resource.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# Begin Source File

SOURCE=.\js.msg
# End Source File
# Begin Source File

SOURCE=.\jsopcode.tbl
# End Source File
# End Target
# End Project
