#!//bin/bash

#FileName:projectcreate.sh
#Function: create OpenGL project directory quckily with Makefile
#Version: V0.1
#Quthor: Yongfeng Qiu
#Data:2022-03-20

CURRPATH=$PWD
cd $CURRPATH
read -p "Project Name:" proj_name
mkdir -p $proj_name/{include,lib,src,Res,External}
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
echo 'LIBNAME =  ../lib/libglfw.3.3.dylib ../lib/libGL.dylib ../lib/libGLU.dylib ../lib/libassimp.4.1.0.dylib ../lib/libassimp.4.dylib ../lib/libassimp.dylib' >> Makefile
echo = '' >> Makefile
echo = 'EXTERNALDIR = ../External' >> Makefile
echo = 'ASSIMPDIR = ../External/assimp/include' >> Makefile
echo = 'EASYBMPDIR = ../External/EasyBMP
' >> Makefile
echo = 'EIGENDIR = ../External/Eigen/src' >> Makefile
echo = 'IMGUIDIR = ../External/Imgui/include' >> Makefile
echo = 'FILEDLGDIR = ../External/FileDialog
' >> Makefile
echo = 'GLADDIR = ../External/glad/include' >> Makefile
echo = 'IMGUIZMODIR = ../External/Imguizmo' >> Makefile
echo = 'GLFWDIR = ../External/glfw' >> Makefile
echo = 'GLMDIR = ../External/glm' >> Makefile
echo = '' >> Makefile
echo = 'TINYDIR = ../External/tiny-loader' >> Makefile
echo = 'STBDIR = ../External/stb' >> Makefile
echo = '' >> Makefile
echo = 'GLADSRC = ../External/glad/src' >> Makefile
echo = 'IMGUISRC = ../External/Imgui/src' >> Makefile
echo = 'FILEDLGSRC = ../External/FileDialog' >> Makefile
echo = 'IMGUIZMOSRC = ../External/Imguizmo' >> Makefile

echo 'CC = gcc' >> Makefile
echo 'C++ = g++ -std=c++17' >> Makefile
echo '' >> Makefile
echo 'C++FLAGS = -c -I$(INCLUDEPATH) -I$(EXTERNALDIR) -I$(ASSIMPDIR) -I$(EASYBMPDIR) -I$(EIGENDIR) -I$(IMGUIDIR) -I$(FILEDLGDIR) -I$(GLADDIR) -I$(IMGUIZMODIR) -I$(GLFWDIR) -I$(GLMDIR) -I$(TINYDIR) -I$(STBDIR)#编译选项' >> Makefile
echo 'CCFLAGS = -c -I$(INCLUDEPATH) -I$(GLADDIR)#编译选项' >> Makefile
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
echo 'OBJFILES_GLAD = $(patsubst %.c,%.o,$(wildcard $(GLADSRC)/*.c))' >> Makefile
echo 'OBJFILES_IMGUIZMO = $(patsubst %.cpp,%.o,$(wildcard $(IMGUIZMOSRC)/*.cpp))' >> Makefile
echo 'OBJFILES_FILEDLG = $(patsubst %.cpp,%.o,$(wildcard $(FILEDLGSRC)/*.cpp))' >> Makefile
echo 'OBJFILES_IMGUI = $(patsubst %.cpp,%.o,$(wildcard $(IMGUISRC)/*.cpp))' >> Makefile
echo 'OBJFILES += $(OBJFILES_GLAD) $(OBJFILES_IMGUIZMO) $(OBJFILES_FILEDLG) $(OBJFILES_IMGUI)' >> Makefile
echo '' >> Makefile
echo '' >> Makefile
echo '$(TARGET):$(OBJFILES)' >> Makefile
echo '    $(C++) -o $@ $^ $(LDFLAGS)' >> Makefile
echo '' >> Makefile
echo '%.o:%.c' >> Makefile
echo '    $(CC) $(CCFLAGS) $<' >> Makefile
echo '' >> Makefile
echo '%.o:%.cpp' >> Makefile
echo '    $(C++) $(C++FLAGS) $<' >> Makefile
echo '' >> Makefile
echo '' >> Makefile
echo '$(OBJFILES_GLAD):$(wildcard $(GLADSRC)/*.c)' >> Makefile
echo '    $(CC) $(CCFLAGS) $< -o $@' >> Makefile
echo '' >> Makefile
echo '$(OBJFILES_IMGUIZMO):$(wildcard $(IMGUIZMOSRC)/*.cpp)' >> Makefile
echo '    $(C++) $(C++FLAGS) $< -o $@' >> Makefile
echo '' >> Makefile
echo '$(OBJFILES_FILEDLG):$(wildcard $(FILEDLGSRC)/*.cpp)' >> Makefile
echo '    $(C++) $(C++FLAGS) $< -o $@' >> Makefile
echo '' >> Makefile
echo '$(IMGUISRC)/imgui_demo.o:$(IMGUISRC)/imgui_demo.cpp' >> Makefile
echo '    $(C++) $(C++FLAGS) -c -o $@ $<' >> Makefile
echo '$(IMGUISRC)/imgui_draw.o:$(IMGUISRC)/imgui_draw.cpp' >> Makefile
echo '    $(C++) $(C++FLAGS) -c -o $@ $<' >> Makefile
echo '$(IMGUISRC)/imgui_impl_glfw.o:$(IMGUISRC)/imgui_impl_glfw.cpp' >> Makefile
echo '    $(C++) $(C++FLAGS) -c -o $@ $<' >> Makefile
echo '$(IMGUISRC)/imgui_impl_opengl3.o:$(IMGUISRC)/imgui_impl_opengl3.cpp' >> Makefile
echo '    $(C++) $(C++FLAGS) -c -o $@ $<' >> Makefile
echo '$(IMGUISRC)/imgui_tables.o:$(IMGUISRC)/imgui_tables.cpp' >> Makefile
echo '    $(C++) $(C++FLAGS) -c -o $@ $<' >> Makefile
echo '$(IMGUISRC)/imgui_widgets.o:$(IMGUISRC)/imgui_widgets.cpp' >> Makefile
echo '    $(C++) $(C++FLAGS) -c -o $@ $<' >> Makefile
echo '$(IMGUISRC)/imgui.o:$(IMGUISRC)/imgui.cpp' >> Makefile
echo '    $(C++) $(C++FLAGS) -c -o $@ $<' >> Makefile
echo 'clean:' >> Makefile
echo '    $(RM) $(TARGET)' >> Makefile
echo '    $(RM) ./*.o' >> Makefile
echo '    $(RM) $(OBJFILES_GLAD)' >> Makefile
echo '    $(RM) $(OBJFILES_IMGUIZMO)' >> Makefile
echo '    $(RM) $(OBJFILES_FILEDLG)' >> Makefile
echo '    $(RM) $(OBJFILES_IMGUI)' >> Makefile
echo 'install:' >> Makefile
echo '    $(MV)' >> Makefile
echo 'distclean:' >> Makefile
echo '    $(RM) $(INSTALLPATH) $(TARGET)' >> Makefile
echo 'echo:' >> Makefile
echo '    -@echo "OBJFILES: "$(OBJFILES)' >> Makefile
echo '    -@echo "OBJFILES_GLAD: "$(OBJFILES_GLAD)' >> Makefile
echo '    -@echo "OBJFILES_IMGUI: "$(OBJFILES_IMGUI)' >> Makefile
echo '    -@echo "OBJFILES_IMGUIZMO: "$(OBJFILES_IMGUIZMO)' >> Makefile
echo '    -@echo "OBJFILES_FILEDLG: "$(OBJFILES_FILEDLG)' >> Makefile
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
cp -Rf /Users/yosef/Documents/Project/OpenGL3.3/OpenGL_MAC/include/* $CURRPATH/$proj_name/include/
cp -Rf /Users/yosef/Documents/Project/OpenGL3.3/OpenGL_MAC/lib/* $CURRPATH/$proj_name/lib/
cp -Rf /Users/yosef/Documents/Project/OpenGL3.3/OpenGL_MAC/Res/* $CURRPATH/$proj_name/Res/
cp -Rf /Users/yosef/Documents/Project/OpenGL3.3/OpenGL_MAC/src/* $CURRPATH/$proj_name/src/
cp -Rf /Users/yosef/Documents/Project/OpenGL3.3/OpenGL_MAC/External/* $CURRPATH/$proj_name/External/
cd $CURRPATH
tree $CURRPATH/$proj_name
echo "my proj name:${proj_name}"
