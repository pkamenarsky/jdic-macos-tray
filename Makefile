all: jar so

jar:
	ant dist

so:
	mkdir -p native
	gcc -std=gnu99 -arch x86_64 -arch i386 -I/System/Library/Frameworks/JavaVM.framework/Headers -I/System/Library/Frameworks/Cocoa.framework/Headers -dynamiclib -o native/libtray.jnilib src-native/jni/tray/*.m -framework JavaVM -framework Cocoa

clojar: jar so
	mkdir -p dist
	jar -cMf dist/jdic-macos-tray-0.0.1.jar native lib
	scp pom.xml dist/jdic-macos-tray-0.0.1.jar clojars@clojars.org:
