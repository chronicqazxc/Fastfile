fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
### create_and_upload_file_test
```
fastlane create_and_upload_file_test
```
Create folder on GoogleDrive and upload files test.
### desney_hockey_test
```
fastlane desney_hockey_test
```
HockeyApp upload test.
### update_plist_test
```
fastlane update_plist_test
```
Update Plist test.
### update_plist_with_path_test
```
fastlane update_plist_with_path_test
```
Update Plist with path test.
### delete_plist_all_value_except_test
```
fastlane delete_plist_all_value_except_test
```
Delete all keys values that doesn't matched in a Plist test.
### delete_paths_test
```
fastlane delete_paths_test
```
Delete paths in plist test.
### shdr_monkey_test
```
fastlane shdr_monkey_test
```
SHDR Monkey Test

----

## iOS
### ios syntax_test
```
fastlane ios syntax_test
```

### ios shdr_help
```
fastlane ios shdr_help
```
Help to understand usage of SHDR iOS lanes.
### ios simulator
```
fastlane ios simulator
```
Simulator build
### ios dev
```
fastlane ios dev
```
Dev build
### ios app_store
```
fastlane ios app_store
```
AppStore build
### ios re_sign_build
```
fastlane ios re_sign_build
```
Re-Sign builds
### ios rome_dev
```
fastlane ios rome_dev
```
Rome CI
### ios upload_files_to_google_drive
```
fastlane ios upload_files_to_google_drive
```
Upload files to GoogleDrive

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
