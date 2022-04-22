# export LD_LIBRARY_PATH=/usr/local/lib

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:${PATH}"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

# pipx
export PATH="$PATH:$HOME/.local/bin"

# node
export PATH=$PATH:$HOME/.yarn/bin

export JAVA_8=$(/usr/libexec/java_home -v1.8 2> /dev/null)
export JAVA_11=$(/usr/libexec/java_home -v11 2> /dev/null)

# export JAVA_HOME=$JAVA_8
export JAVA_HOME=$JAVA_11
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

# flutter
export FLUTTER_HOME=$HOME/flutter/flutter/bin
export PATH=$PATH:$FLUTTER_HOME

# emscripten
export LLVM=$BIN_DIR/emscripten/libexec/llvm/bin
export BINARYEN=$BIN_DIR/binaryen
export LLVM_ROOT=$BIN_DIR/emscripten/libexec/llvm/bin
export BINARYEN_ROOT=$BIN_DIR/binaryen

# chromium
export PATH=$PATH:$HOME/chromium/depot_tools
