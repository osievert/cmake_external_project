
.PHONY: default
default:
	rm -rf build
	cmake -B build -S $(shell pwd) -DCMAKE_INSTALL_PREFIX=install
	cmake --build build

.PHONY: android
android:
	rm -rf build-android
	cmake -B build-android -S $(shell pwd) -DCMAKE_INSTALL_PREFIX=install-android -DCMAKE_TOOLCHAIN_FILE=${HOME}/Library/Android/sdk/ndk/23.1.7779620/build/cmake/android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-28
	cmake --build build-android

.PHONY: clean
clean:
	rm -rf build build-android

