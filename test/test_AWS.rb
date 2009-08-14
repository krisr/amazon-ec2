#--
# Amazon Web Services EC2 Query API Ruby library
#
# Ruby Gem Name::  amazon-ec2
# Author::    Glenn Rempe  (mailto:glenn@rempe.us)
# Copyright:: Copyright (c) 2007-2008 Glenn Rempe
# License::   Distributes under the same terms as Ruby
# Home::      http://github.com/grempe/amazon-ec2/tree/master
#++

require File.dirname(__FILE__) + '/test_helper.rb'

context "AWS" do

  specify "AWS.canonical_string(path) should conform to Amazon's requirements " do
    path = {"name1" => "value1", "name2" => "value2", "name3" => "value3"}
    if ENV['EC2_URL'].nil? || ENV['EC2_URL'] == 'https://ec2.amazonaws.com'
      AWS.canonical_string(path, 'ec2.amazonaws.com').should.equal "POST\nec2.amazonaws.com\n/\nname1=value1&name2=value2&name3=value3"
    elsif ENV['EC2_URL'] == 'https://us-east-1.ec2.amazonaws.com'
      AWS.canonical_string(path, 'ec2.amazonaws.com').should.equal "POST\nus-east-1.ec2.amazonaws.com\n/\nname1=value1&name2=value2&name3=value3"
    elsif ENV['EC2_URL'] == 'https://eu-west-1.ec2.amazonaws.com'
      AWS.canonical_string(path, 'ec2.amazonaws.com').should.equal "POST\neu-west-1.ec2.amazonaws.com\n/\nname1=value1&name2=value2&name3=value3"
    end
  end

  specify "AWS.encode should return the expected string" do
    AWS.encode("secretaccesskey", "foobar123", urlencode=true).should.equal "e3jeuDc3DIX2mW8cVqWiByj4j5g%3D"
    AWS.encode("secretaccesskey", "foobar123", urlencode=false).should.equal "e3jeuDc3DIX2mW8cVqWiByj4j5g="
  end
  
end
