## Minimal AVD guide
With this simple guide you'll be able to
* Create an AVD (Android Virtual Device) that doesn't need virtualization (see `#troubleshooting/virtualization`)

## notes
###### 1. Do this after installing the android sdk, download at: [developer.android.com/studio](https://developer.android.com/studio)
###### 　　...because of this, interpret `/` as your AndroidSDK directory (e.g. `/emulator/` = `$AndroidSDK_Installation_Dir/emulator/`)
###### 2. I only tried it on windows but I suppose it won't be that different on linux too
###### 3. BTW, I typed `/` for the dirs instead `\` because I primarily use ps7 and yeah, I'm used to `/`

## installation
First of all, to create an AVD you'll need to decide on,
* The Android version (In the following examples I'm gonna be using Android 15 x86_64),
* The device/skin (In the following examples I'm gonna be using `pixel_2_xl`)

First of all, go to `/cmdline-tools/latest/bin/` \
Then you gotta download the actual image, to do that run: \
`./sdkmanager "system-images;<android-API-level>;default;<android-architecture>"`
###### Replace <android-API-level> and <android-architecture>, for example if you want to install Android 15 x86_64, use `"system-images;android-35;default;x86_64"`
Next you'll actually create the AVD, to do that run: \
`./avdmanager create avd -n Android15_Pixel2 -k "system-images;android-35;default;x86_64" --device "pixel_2_xl"`
\
**Done!**
\
\
Then to actually boot the AVD, you'll go to `/emulator/` \
and run: `./emulator -avd Android15_Pixel2` _# replace <name> with the name you gave, for me it was 'Android15_Pixel2-XL'_

## \#troubleshooting
## Force enable/disable CPU virtualization
When booting the AVD, add the either of the following parameters `-accel off` (to disable) or `-accel on` (to enable) virtualization.
## Force GPU/CPU rendering
When booting the AVD, add the either of the following parameters `-gpu swiftshader_indirect` (for CPU render) or `-gpu host` (for GPU render), \
Note: I highly recommend using `-gpu auto` (or not parsing `-gpu` at all to do the same) so that it just does its thing :3
