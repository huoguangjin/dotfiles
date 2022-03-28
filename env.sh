
export EDITOR=vim

export LD_LIBRARY_PATH=/usr/local/lib

# sublime text
export SUBL="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# pipx
export PATH="$PATH:$HOME/.local/bin"
export PIPX_DEFAULT_PYTHON=$(pyenv which python)

# node
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

# export JAVA6_HOME=$(/usr/libexec/java_home -v1.6 2> /dev/null) # jdk 1.6.0_65
# export JAVA7_HOME=$(/usr/libexec/java_home -v1.7 2> /dev/null) # jdk 1.7.0_80
export JAVA_8=$(/usr/libexec/java_home -v1.8 2> /dev/null) # jdk 1.8.0_181
export JAVA_11=$(/usr/libexec/java_home -v11 2> /dev/null) # jdk 11.0.10

# export JAVA_HOME=$JAVA_11
export JAVA_HOME=$JAVA_8
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$PATH:$JAVA_HOME/bin

# android
export ANDROID_HOME=$HOME/sdk/android
export android_home=$ANDROID_HOME
# https://d.android.com/studio/command-line/variables
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# ndk
export NDK_16=$ANDROID_HOME/ndk/16.1.4479499
export NDK_17=$ANDROID_HOME/ndk/17.2.4988734
export NDK_21=$ANDROID_HOME/ndk/21.3.6528147
export NDK_23=$ANDROID_HOME/ndk/23.1.7779620

export ANDROID_NDK=$NDK_23
export ANDROID_NDK_HOME=$ANDROID_NDK
export PATH=$PATH:$ANDROID_NDK

# android build tool
# ln -s $ANDROID_HOME/build-tools/28.0.3 $ANDROID_HOME/build-tools/current
# cat $ANDROID_BUILD_TOOL/source.properties
export ANDROID_BUILD_TOOL=$ANDROID_HOME/build-tools/current
export PATH=$PATH:$ANDROID_BUILD_TOOL

# android sdk cmake
# export CMAKE_HOME=$ANDROID_HOME/cmake/3.10.2.4988404
# export PATH=$CMAKE_HOME/bin:$PATH

# flutter
export FLUTTER_HOME=$HOME/flutter/flutter/bin
export PATH=$PATH:$FLUTTER_HOME

# emscripten
export LLVM=$BIN_DIR/emscripten/libexec/llvm/bin
export BINARYEN=$BIN_DIR/binaryen
export LLVM_ROOT=$BIN_DIR/emscripten/libexec/llvm/bin
export BINARYEN_ROOT=$BIN_DIR/binaryen

# # sdkman
# export SDKMAN_DIR="$HOME/.sdkman"
# export SDKMAN_CANDIDATES_DIR="$SDKMAN_DIR/candidates"
# export sdkman_debug_mode=true
#
# # kotlin
# export KOTLIN_HOME=$SDKMAN_CANDIDATES_DIR/kotlin/current
# export PATH=$PATH:$KOTLIN_HOME/bin
#
# # groovy
# export GROOVY_HOME=$SDKMAN_CANDIDATES_DIR/groovy/current
# export PATH=$PATH:$GROOVY_HOME/bin

# qt5.8
export QT_HOME=$HOME/tools/Qt5.8.0/5.8/clang_64
export PATH=$PATH:$QT_HOME/bin

# chromium
export PATH=$PATH:$HOME/chromium/depot_tools

