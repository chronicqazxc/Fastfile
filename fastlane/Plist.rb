
def update_plist(keysValues, path = "./ABC/ABC-Info.plist")
    update_info_plist(plist_path: path,
                      block: lambda { |plist|
                      keysValues.each do |key, value|
                      plist[key] = value
                      end
                      })
end

# Delete all keys values that doesn't matched(case non-sensitive) in a Plist
# Example:
# Origin plist { A => { B => C }, D => { E => F } }
# delete_plist_all_value_except("path_to_plist", ["a"])
# Result will be { D => { E => F } }
def delete_plist_all_value_except(path, keys)
    update_info_plist(plist_path: path,
                      block: lambda { |plist|
                      plist.each do |pkey, pvalue|
                      if (keys.map(&:downcase).include? pkey.downcase) == false
                      plist.delete(pkey)
                      end
                      end
                      })
end

# Delete neted values(case sensitive) in a plist
# Example:
# Origin plist { A => { B => C }, D => { E => F } }
# delete_plist_by_path_strings("path_to_plist", ["A/B", "D/E"])
# Result will be { A => {}, D => {} }
def delete_plist_by_path_strings(path, paths)
    update_info_plist(plist_path: path,
                      block: lambda { |plist|
                        paths.each do |path|
                            levels = path.split("/")
                            combined_level = levels.join("/")
                            plist = delte_path_in_dic(plist, combined_level)
                        end
                      })
end

# Delete neted value(case sensitive) in a dictionary
# Example:
# Origin plist { A => { B => C }, D => { E => F } }
# delte_path_in_dic("path_to_plist", "A/B")
# Result will be { A => {}, D => { E => F } }
def delte_path_in_dic(dic, path)
    levels = path.split("/")
    if levels.length == 1
        dic.delete(levels.first)
    elsif levels.length > 0
        first = levels.first
        combined_level = levels.drop(1).join("/")
        dic[first => delte_path_in_dic(dic[first], combined_level)]
    end
    return dic
end

# Function testing
desc "Update Plist test."
lane :update_plist_test do
    update_plist({
                 "CFBundleDevelopmentRegion" => "xx",
                 "Environment" => "ooo"
    })
end

desc "Update Plist with path test."
lane :update_plist_with_path_test do
    update_plist({
                 "CFBundleDevelopmentRegion" => "xx",
                 "Environment" => "ooo"
                 },
                 "./ABC/ABC-Info.plist")
end

desc "Delete all keys values that doesn't matched in a Plist test."
lane :delete_plist_all_value_except_test do
    beforeDelete = get_info_plist_value(path: "./ABC/Resources/Configurations/Services.plist",
                                        key: "default")

    keys = ["DefAulT"]
    path = "./ABC/Resources/Configurations/Services.plist"
    delete_plist_all_value_except(path, keys)

    afterDelete = get_info_plist_value(path: "./ABC/Resources/Configurations/Services.plist",
                                       key: "default")

    if beforeDelete != afterDelete
        UI.user_error!("delete_plist_all_value_except_test failed")
    end

end

desc "Delete paths in plist test."
lane :delete_paths_test do
    mockKeyOrigin = get_info_plist_value(path: "./test/test.plist",
                                         key: "mockKey")
    fooKeyOrigin = get_info_plist_value(path: "./test/test.plist",
                                          key: "fooKey")

    paths = ["mockKey/level1/level2/com.mockKey.dev",
            "fooKey/com.foo.dev"]
    path = "./test/test.plist"
    delete_plist_by_path_strings(path, paths)

    mockKeyAfter = get_info_plist_value(path: "./test/test.plist",
                                         key: "mockKey")
    fooKeyAfter = get_info_plist_value(path: "./test/test.plist",
                                          key: "fooKey")

    if mockKeyOrigin == mockKeyAfter ||
        fooKeyOrigin == fooKeyAfter
        UI.user_error!("delete_paths_test failed")
    end

end
