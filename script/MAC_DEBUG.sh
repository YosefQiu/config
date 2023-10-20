#!//bin/bash

#FileName:MAC_DEBUG.sh
#Function: create debug for CPP quckily
#Version: V0.1
#Quthor: Yongfeng Qiu
#Data:2022-10-24

CURRPATH=$PWD
cd $CURRPATH
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
cd $CURRPATH
echo 'Successfully created debug file'
