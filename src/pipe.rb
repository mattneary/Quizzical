require 'rubygems'
require 'json'

class Keypair
  attr_accessor :criteria
  def parse_criteria()
    @criteria.map { |criterion|
      criterion[1] = case criterion[1]
      when /^"[^"]+"$/ then criterion[1][1..-2]
      when "true" then true
      when "false" then false
      when /^[0-9]+$/ then criterion[1].to_i
      when /^[\[\{][\s\S]+[\}\]]$/ then JSON.parse(criterion)
      else criterion[1]
      end
    }
  end
  def initialize(args)
    @criteria = []
    if args[0] == '#raw'
      @criteria =  [['noparse', true]]      
    end
    args.each do |criterion|
      @criteria.push criterion.split('=')[0..1]
    end
    parse_criteria
  end
end

criteria = Keypair.new(ARGV).criteria

read = ""
STDIN.read.split("\n").each do |line|
  read += line
end

if criteria[0][0] == 'noparse'
  puts "Passed"  
else
  begin
    resp = JSON.parse(read)
    passed = true 
    criteria.each do |criterion|
      # handle whole-response equality
      if criterion[0] == "@"
	if resp == criterion[1]
	  passed = passed
	else
	  passed = false
	end
      end
    
      # check that the criteria continue to match
      if resp[criterion[0]] == criterion[1]
	passed = passed
      else
	passed = false
      end
    end
    if passed
      puts "Passed"
    end
  rescue
    puts read
  end
end

