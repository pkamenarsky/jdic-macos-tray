all: jar so

jar:
	ant dist

so:
	gcc -std=gnu99 -arch x86_64 -arch i386 -I/System/Library/Frameworks/JavaVM.framework/Headers -I/System/Library/Frameworks/Cocoa.framework/Headers -dynamiclib -o dist/libtray.jnilib native/jni/tray/*.m -framework JavaVM -framework Cocoa

