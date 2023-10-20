#!//bin/bash

#FileName:projectcreate.sh
#Function: create Noraml CPP project directory quckily
#Version: V0.1
#Quthor: Yongfeng Qiu
#Data:2022-03-20

CURRPATH=$PWD
cd $CURRPATH
read -p "Project Name:" proj_name
mkdir -p $proj_name/{include,lib,src,external,res/{pic,model,shader}}
echo '[1] The folder is created successfully. Start configuring makefile files...'
cd $CURRPATH/$proj_name 
touch Makefile
echo '[2] Configure the first Makefile file...'
echo '# Script for scheduling and executing makefiles in the source directory' >> Makefile
echo 'install:src' >> Makefile
echo '	make -C ./src' >> Makefile 
echo 'srcclean:' >> Makefile 
echo '	make clean -C ./src' >> Makefile 
cd $CURRPATH/$proj_name/src
touch main.cpp
touch Makefile
echo '[3] Configure the second Makefile file...'
echo '# Compile the script of the project source code' >> Makefile
echo '#编译工程源码的脚本' >> Makefile
echo '#伪目标' >> Makefile
echo '.PHONY:clean install distclean' >> Makefile
echo '' >> Makefile
echo '#变量' >> Makefile
echo 'INCLUDEPATH = ../include #头文件路径' >> Makefile
echo 'LIBRARYPATH = ../lib #动态库路径' >> Makefile
echo 'LIBNAME =  ../lib/libglfw.3.3.dylib ../lib/libGL.dylib ../lib/libGLU.dylib' >> Makefile
echo 'CC = gcc' >> Makefile
echo 'C++ = g++ -std=c++11' >> Makefile
echo '' >> Makefile
echo 'CCFLAGS = -c -I$(INCLUDEPATH) #编译选项' >> Makefile
echo 'C++FLAGS = -c -I$(INCLUDEPATH) #编译选项' >> Makefile
echo '' >> Makefile
echo 'LDFLAGS = -L$(LIBRARYPATH) $(LIBNAME) #库选项' >> Makefile
echo '' >> Makefile
echo 'TARGET = app #目标名/程序名' >> Makefile
echo 'INSTALLPATH = /usr/bin/ #安装目录' >> Makefile
echo 'RM = rm -rf' >> Makefile
echo 'MV = sudo mv $(TARGET) $(INSTALLPATH)' >> Makefile
echo '' >> Makefile
echo 'CCFILES = $(wildcard *.c)' >> Makefile
echo 'C++FILES = $(wildcard *.cpp)' >> Makefile
echo '' >> Makefile
echo 'OBJFILES = $(patsubst %.c,%.o,$(CCFILES)) $(patsubst %.cpp,%.o,$(C++FILES))' >> Makefile
echo '' >> Makefile
echo '' >> Makefile
echo '$(TARGET):$(OBJFILES)' >> Makefile
echo '    $(C++) $^ $(LDFLAGS) -o $@' >> Makefile
echo '' >> Makefile
echo '%.o:%.c' >> Makefile
echo '    $(CC) $(CCFLAGS) $<' >> Makefile
echo '' >> Makefile
echo '%.o:%.cpp' >> Makefile
echo '    $(C++) $(C++FLAGS) $<' >> Makefile
echo '' >> Makefile
echo 'clean:' >> Makefile
echo '    $(RM) $(TARGET)' >> Makefile
echo '    $(RM) $(OBJFILES)' >> Makefile
echo 'install:' >> Makefile
echo '    $(MV)' >> Makefile
echo 'distclean:' >> Makefile
echo '    $(RM) $(INSTALLPATH) $(TARGET)' >> Makefile
echo 'echo:' >> Makefile
echo '    -@echo $(SRCFILE)' >> Makefile
echo '    -@echo $(DESFILE)' >> Makefile
echo 'removfile:' >> Makefile
echo '    -@rm clean' >> Makefile
echo '    -@rm clean_01' >> Makefile
echo '    -@rm clean_02' >> Makefile
echo '' >> Makefile
echo '[4] Configure dubug file...'
touch vimspector
echo '{' >> vimspector
echo '     "configurations": {' >> vimspector
echo '       "myconf - Launch": {' >> vimspector
echo '         "adapter": "CodeLLDB",' >> vimspector
echo '         "breakpoints": {' >> vimspector
echo '           "exception": {' >> vimspector
echo '             "cpp_throw": "Y",' >> vimspector
echo '             "cpp_catch": "N"' >> vimspector
echo '           }' >> vimspector
echo '         },' >> vimspector
echo '         "configuration": {' >> vimspector
echo '           "request": "launch",' >> vimspector
echo '           // ${fileDirName} is the directory of the current file in vim' >> vimspector
echo '           "program": "${fileDirname}/app",' >> vimspector
echo '           "args": [ "3" ],' >> vimspector
echo '           "stopAtEntry": true,' >> vimspector
echo '           // ${cwd} is the working directory of the program, i.e. the dir. where the program will be executed' >> vimspector
echo '           "cwd": "${fileDirname}"' >> vimspector
echo '         }' >> vimspector
echo '       }' >> vimspector
echo '     }' >> vimspector
echo '   }' >> vimspector
mv vimspector .vimspector.json
cp -Rf /Users/yosef/Documents/Project/OpenGL3.3/29_SkyBox/include/* $CURRPATH/$proj_name/include/
cp -Rf /Users/yosef/Documents/Project/OpenGL3.3/29_SkyBox/lib/* $CURRPATH/$proj_name/lib/
cp -Rf /Users/yosef/Documents/Project/OpenGL3.3/29_SkyBox/res/* $CURRPATH/$proj_name/res/
cp -Rf /Users/yosef/Documents/Project/OpenGL3.3/29_SkyBox/src/* $CURRPATH/$proj_name/src/
cd $CURRPATH
tree
echo "my proj name:${proj_name}"
