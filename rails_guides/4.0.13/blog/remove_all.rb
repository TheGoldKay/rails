require 'open3'

def rm gems
    gems.each do |item| 
        stdout, stderr, status = Open3.capture3("gem uninstall #{item}")
        puts stdout
        puts stderr
        puts status.exitstatus
    end
end

stdout, stderr, status = Open3.capture3("gem list")
all_gems = stdout.gsub(/\(.*?\)/, "").split(" \n")                  #g.gsub(/\(.*?\)/, "").split(" \n")

rm all_gems