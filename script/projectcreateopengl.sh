#!//bin/bash

#FileName:projectcreate.sh
#Function: create Noraml CPP project directory quckily CMAKE
#Version: V0.1
#Quthor: Yongfeng Qiu
#Data:2022-03-20

CURRPATH=$PWD
cd $CURRPATH
read -p "Project Name:" proj_name
mkdir -p $proj_name/{include,lib,src,build,external,res/{pic,model,shader}}
echo '[1] The folder is created successfully. Start configuring makefile files...'
cd $CURRPATH/$proj_name
cp -Rf /Users/yosef/Documents/opengl/External/* $CURRPATH/$proj_name/external/
touch CMakeLists
echo '[2] Configure the CMakeLists.txt...'
echo 'cmake_minimum_required(VERSION 3.19)' >> CMakeLists
echo 'IF(MSVC)' >> CMakeLists
echo '    SET(CMAKE_GENERATOR_PLATFORM win32)' >> CMakeLists
echo 'ENDIF()' >> CMakeLists
echo '' >> CMakeLists
echo 'PROJECT(Project7)' >> CMakeLists
echo '' >> CMakeLists
echo 'SET(CMAKE_CXX_STANDARD 17)' >> CMakeLists
echo '' >> CMakeLists
echo 'SET(CMAKE_DISABLE_IN_SOURCE_BUILD ON)' >> CMakeLists
echo 'SET(CMAKE_SUPPRESS_REGENERATION ON)' >> CMakeLists
echo 'SET(CMAKE_USE_RELATIVE_PATHS ON)' >> CMakeLists
echo '' >> CMakeLists
echo 'IF(APPLE)' >> CMakeLists
echo '    SET(CMAKE_OSX_ARCHITECTURES "x86_64" CACHE INTERNAL "" FORCE)' >> CMakeLists
echo 'ENDIF(APPLE)' >> CMakeLists
echo '' >> CMakeLists
echo 'OPTION(GLFW_BUILD_DOCS OFF)' >> CMakeLists
echo 'OPTION(GLFW_BUILD_EXAMPLES OFF)' >> CMakeLists
echo 'OPTION(GLFW_BUILD_TESTS OFF)' >> CMakeLists
echo 'OPTION(GLFW_INSTALL OFF)' >> CMakeLists
echo 'ADD_SUBDIRECTORY(External/glfw)' >> CMakeLists
echo '' >> CMakeLists
echo 'option(ASSIMP_BUILD_ASSIMP_TOOLS OFF)' >> CMakeLists
echo 'option(ASSIMP_BUILD_SAMPLES OFF)' >> CMakeLists
echo 'option(ASSIMP_BUILD_TESTS OFF)' >> CMakeLists
echo 'add_subdirectory(External/assimp)' >> CMakeLists
echo '' >> CMakeLists
echo '#config glfw' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/glfw/include/)' >> CMakeLists
echo 'LIST(APPEND LIBS glfw ${GLFW_LIBRARIES})' >> CMakeLists
echo '' >> CMakeLists
echo '#config glad' >> CMakeLists
echo 'SET(GLAD_SRC External/GL/glad/src/glad.c)' >> CMakeLists
echo 'IF(NOT WIN32)' >> CMakeLists
echo '    LIST(APPEND LIBS dl)' >> CMakeLists
echo 'ENDIF()' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/GL/glad/include)' >> CMakeLists
echo '' >> CMakeLists
echo '#config assimp' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/assimp/include/)' >> CMakeLists
echo 'LIST(APPEND LIBS assimp ${ASSIMP_LIBRARIES})' >> CMakeLists
echo 'message(">>>>> APPEND: ASSIMP ${LIBS}")' >> CMakeLists
echo '' >> CMakeLists
echo '#config glm' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/GL/glm/)' >> CMakeLists
echo '' >> CMakeLists
echo '#config include imgui' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/Imgui/include)' >> CMakeLists
echo 'SET(IMGUI_SRC External/Imgui/src)' >> CMakeLists
echo '' >> CMakeLists
echo '#config lodepng' >> CMakeLists
echo 'SET(LODEPNG_SRC External/lodepng/lodepng.cpp)' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/lodepng/)' >> CMakeLists
echo '' >> CMakeLists
echo '#config include files' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(include/)' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/)' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/GL/)' >> CMakeLists
echo '' >> CMakeLists
echo '#config stb_img' >> CMakeLists
echo 'SET(IMG_SRC External/stb_image/stb_image.h)' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/stb_image/)' >> CMakeLists
echo '' >> CMakeLists
echo '#config FileDialog' >> CMakeLists
echo 'SET(DIALOG_SRC External/FileDialog/ImGuiFileDialog.cpp)' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/FileDialog/)' >> CMakeLists
echo 'IF(MSVC)' >> CMakeLists
echo 'INCLUDE_DIRECTORIES(External/FileDialog/dirent)' >> CMakeLists
echo 'ENDIF()' >> CMakeLists
echo '' >> CMakeLists
echo '#config sources files' >> CMakeLists
echo 'FILE(GLOB EXTERNAL_SOURCES ${GLAD_SRC}' >> CMakeLists
echo '${LODEPNG_SRC}' >> CMakeLists
echo '${IMG_SRC}' >> CMakeLists
echo '${DIALOG_SRC})' >> CMakeLists
echo 'FILE(GLOB PROJECT_IMGUI ${IMGUI_SRC}/*.cpp)' >> CMakeLists
echo 'FILE(GLOB PROJECT_HEADERS include/*.h)' >> CMakeLists
echo 'FILE(GLOB PROJECT_SOURCES src/*.cpp)' >> CMakeLists
echo 'FILE(GLOB PROJECT_SHADERS res/shader/*.glsl)' >> CMakeLists
echo '' >> CMakeLists
echo 'SOURCE_GROUP("Headers" FILES ${PROJECT_HEADERS})' >> CMakeLists
echo 'SOURCE_GROUP("Sources" FILES ${PROJECT_SOURCES})' >> CMakeLists
echo 'SOURCE_GROUP("Imgui" FILES ${PROJECT_IMGUI})' >> CMakeLists
echo 'SOURCE_GROUP("Externals" FILES ${EXTERNAL_SOURCES})' >> CMakeLists
echo 'SOURCE_GROUP("Shaders" FILES ${PROJECT_SHADERS})' >> CMakeLists
echo '' >> CMakeLists
echo 'ADD_EXECUTABLE(${PROJECT_NAME} ${PROJECT_SOURCES} ${PROJECT_IMGUI} ${PROJECT_HEADERS}' >> CMakeLists
echo '${EXTERNAL_SOURCES} ${PROJECT_SHADERS})' >> CMakeLists
echo '' >> CMakeLists
echo 'TARGET_LINK_LIBRARIES(${PROJECT_NAME} ${LIBS})' >> CMakeLists
mv CMakeLists CMakeLists.txt
cd $CURRPATH/$proj_name/src
echo '[3] Configure dubug file...'
touch main.cpp
echo '#include "ggl.h" ' >> main.cpp
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
cd $CURRPATH/$proj_name/include
touch ggl.h
echo '[3] Configure include/ggl.h file...'
echo '#pragma once' >> ggl.h
echo '#include <glad/glad.h>' >> ggl.h
echo '#include <GLFW/glfw3.h>' >> ggl.h
echo '' >> ggl.h
echo '#include <iostream>' >> ggl.h
echo '#include <fstream>' >> ggl.h
echo '#include <sstream>' >> ggl.h
echo '#include <vector>' >> ggl.h
echo '#include <list>' >> ggl.h
echo '#include <algorithm>' >> ggl.h
echo '' >> ggl.h
echo '#include <GL/glm/glm/glm.hpp>' >> ggl.h
echo '#include <GL/glm/glm/gtc/matrix_transform.hpp>' >> ggl.h
echo '#include <GL/glm/glm/gtc/type_ptr.hpp>' >> ggl.h
echo '#define GLM_ENABLE_EXPERIMENTAL' >> ggl.h
echo '#include <GL/glm/glm/gtx/rotate_vector.hpp>' >> ggl.h
echo '' >> ggl.h
echo '#include <cyCodeBase/cyVector.h>' >> ggl.h
echo '#include <cyCodeBase/cyMatrix.h>' >> ggl.h
echo '#include <cyCodeBase/cyTriMesh.h>' >> ggl.h
echo '#include <cyCodeBase/cyPoint.h>' >> ggl.h
echo '' >> ggl.h
echo '' >> ggl.h
echo '' >> ggl.h
echo '#include <stdlib.h>' >> ggl.h
echo '#include <math.h>' >> ggl.h
echo '#include <string.h>' >> ggl.h
echo '' >> ggl.h
echo 'typedef cy::Vec2<float> Vec2f;' >> ggl.h
echo 'typedef cy::Vec3<float> Vec3f;' >> ggl.h
echo 'typedef cy::Vec4<float> Vec4f;' >> ggl.h
echo 'typedef cy::Matrix2<float> Mat2f;' >> ggl.h
echo 'typedef cy::Matrix3<float> Mat3f;' >> ggl.h
echo 'typedef cy::Matrix4<float> Mat4f;' >> ggl.h
echo '' >> ggl.h
echo '#define Pi 3.1415926' >> ggl.h
echo '' >> ggl.h
echo 'using namespace std;' >> ggl.h
echo 'using namespace cy;' >> ggl.h
cd $CURRPATH
tree
echo "my proj name:${proj_name}"
