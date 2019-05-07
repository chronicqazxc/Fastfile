
desc "SHDR Monkey Test"
lane :shdr_monkey_test do |options|
    
    duration = options[:duration] ? options[:duration] : 60
    device = options[:device] ? options[:device] : "iPhone SE"
    prepareInterval = options[:prepareInterval] ? options[:prepareInterval] : 0
    isShowPaws = options[:isShowPaws] ? options[:isShowPaws] : true
    configuration = isShowPaws == true ? "UITest" : "Debug"
    update_info_plist(plist_path: "./SHDRUITests/UITestConfiguration.plist",
                      block: lambda { |plist|
                      plist["duration"] = duration.to_i
                      plist["prepareInterval"] = prepareInterval.to_i
                      })
                      puts "duration: #{duration}"
                      puts "device: #{device}"
                      puts "prepareInterval: #{prepareInterval}"
                      puts "isShowPaws: #{isShowPaws}"
                      scan(workspace: "ParkPlatform.xcworkspace",
                           scheme: "SHDRUITests",
                           only_testing: ["SHDRMonkeyTests"],
                           devices:[device],
                           configuration: configuration,
                           clean: true)
end
