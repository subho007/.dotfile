# Start an HTTP server from a directory, optionally specifying the port
server() {
  local port="${1:-8000}";
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Better way to search for files using grep
function search {
    grep -irl \
        --exclude=\*.{pyc,swp,un~,png,jpg} \
        --exclude-dir=".git" \
        --exclude-dir="node_modules" \
        --exclude-dir="bower_components" \
        --exclude-dir="dist" \
        --exclude-dir="tmp" \
        --exclude-dir=".sass_cache" \
        --exclude-dir="build" \
        --color "$*" .
}

function baseinstall {
    export HOMEBREW_BUNDLE_FILE="${HOME}/.dotfile/Brewfile"
    export HOMEBREW_BUNDLE_NO_LOCK=1
    which -s brew
    if [[ $? != 0 ]] ; then
        # Install Homebrew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        brew update
    fi
    brew bundle --no-lock
}

function androidsdk-install {
    if (( ${+ANDROID_SDK_HOME} )); then
        ln -sf "$ANDROID_SDK_HOME/platform-tools/adb" "$HOME/bin/adb"
        ln -sf "$ANDROID_SDK_HOME/platform-tools/dmtracedump" "$HOME/bin/dmtracedump"
        ln -sf "$ANDROID_SDK_HOME/platform-tools/e2fsdroid" "$HOME/bin/e2fsdroid"
        ln -sf "$ANDROID_SDK_HOME/platform-tools/etc1tool" "$HOME/bin/etc1tool"
        ln -sf "$ANDROID_SDK_HOME/platform-tools/fastboot" "$HOME/bin/fastboot"
        ln -sf "$ANDROID_SDK_HOME/platform-tools/hprof-conv" "$HOME/bin/hprof-conv"
        ln -sf "$ANDROID_SDK_HOME/platform-tools/make_f2fs" "$HOME/bin/make_f2fs"
        ln -sf "$ANDROID_SDK_HOME/platform-tools/make_f2fs_casefold" "$HOME/bin/make_f2fs_casefold"
        ln -sf "$ANDROID_SDK_HOME/platform-tools/mke2fs" "$HOME/bin/mke2fs"
        ln -sf "$ANDROID_SDK_HOME/platform-tools/sload_f2fs" "$HOME/bin/sload_f2fs"
        if [ ! -d $ANDROID_SDK_HOME/build-tools/30.0.3 ]; then
            print "Build tool 30.0.3 is not installed. Installing it now"
            $ANDROID_SDK_HOME/cmdline-tools/latest/bin/sdkmanager "build-tools;30.0.3"
        fi
        ln -sf "$ANDROID_SDK_HOME/build-tools/30.0.3/aapt" "$HOME/bin/aapt"
        ln -sf "$ANDROID_SDK_HOME/build-tools/30.0.3/aapt2" "$HOME/bin/aapt2"
        ln -sf "$ANDROID_SDK_HOME/build-tools/30.0.3/apksigner" "$HOME/bin/apksigner"
        ln -sf "$ANDROID_SDK_HOME/build-tools/30.0.3/d8" "$HOME/bin/d8"
        ln -sf "$ANDROID_SDK_HOME/build-tools/30.0.3/dx" "$HOME/bin/dx"
        ln -sf "$ANDROID_SDK_HOME/build-tools/30.0.3/dexdump" "$HOME/bin/dexdump"
        ln -sf "$ANDROID_SDK_HOME/build-tools/30.0.3/zipalign" "$HOME/bin/zipalign"
    else
        print "Set ANDROID_SDK_HOME envoronment variable first"
    fi
}

function androidndk-install {
    if (( ${+ANDROID_NDK_HOME} )); then
        ln -sf "$ANDROID_NDK_HOME/ndk-build" "$HOME/bin/ndk-build"
        ln -sf "$ANDROID_NDK_HOME/ndk-gdb" "$HOME/bin/ndk-gdb"
        ln -sf "$ANDROID_NDK_HOME/ndk-lldb" "$HOME/bin/ndk-lldb"
        ln -sf "$ANDROID_NDK_HOME/ndk-stack" "$HOME/bin/ndk-stack"
        ln -sf "$ANDROID_NDK_HOME/ndk-which" "$HOME/bin/ndk-which"
    else
        print "Set ANDROID_NDK_HOME envoronment variable first"
    fi
}

jdk() {
      version=$1
      unset JAVA_HOME;
      export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
      export PATH=$JAVA_HOME/bin:$PATH
      java -version
}