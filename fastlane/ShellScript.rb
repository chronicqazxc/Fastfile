
def who_am_i
    begin
        sh("whoami").strip
    end
end

def pwd
    begin
        sh("pwd").strip
    end
end

def clean_carthage_cache
    begin
        sh("rm -rf ~/Library/Caches/org.carthage.CarthageKit")
    end
end

def clean_derivedData
    begin
        sh("rm -rf ../../DerivedData")
    end
end
