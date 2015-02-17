#!/usr/bin/ruby -w

require 'rubygems'
require 'whois'


a = (1..3).flat_map{|n| ('a'..'z').to_a.repeated_permutation(n).map(&:join)}
a.map! { |word| "#{word}.com" }

checked = []
fileChecked = File.new("checked_domains.txt", "r")
while (line = fileChecked.gets)
  checked << "#{line}".gsub(/^#{$/}/, "").gsub(/#{$/}$/, "")
end
fileChecked.close

num = 0

a.each do |domain|

  begin

    fileChecked = File.new("checked_domains.txt", "a")
    fileFree    = File.new("free_domains.txt", "a")
    fileUsed    = File.new("used_domains.txt", "a")

    c = Whois::Client.new(timeout: 120)

    unless checked.include? domain
      fileChecked.puts(domain) 
      if c.lookup(domain).available?
        puts "Domain: " + domain + " is free"
        fileFree.puts(domain)
      else
        fileUsed.puts(domain)
      end

    else
      puts "Skipped " + domain
    end

    fileChecked.close
    fileFree.close
    fileUsed.close
    num = num + 1

  rescue
    puts "Exception occured for " + domain.to_s + " after " + num.to_s + " checks"
    num = 0
  end
end


