# Fastfile
[Fastlane](https://fastlane.tools) is an awesome tools which increase productively for iOS developers, we can run tests, generate builds, deploy app to iTunes connect or HockeyApp.
I wrote this project to present my Fastlane usage as a demo, which include `iOS packages generate`, and `plist content modification`, and `perform UI Tests`, and `upload files to GoogleDrive`, and `re-sign builds`. 

## Example
Generate simulator build:
```shell
bundle exec fastlane simulator is_export:true
```
Generate debug build:
```shell
bundle exec fastlane dev is_export:true
```

Auther: chronicqazxc@gmail.com
