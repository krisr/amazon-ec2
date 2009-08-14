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

context "AWS::ELB::Base" do

  before do
    @attrs = { :access_key_id => "not a key",
                    :secret_access_key => "not a secret",
                    :use_ssl => true,
                    :server => "foo.example.com"}
  end

  specify "attribute readers should be available" do
    @ec2 = AWS::EC2::Base.new( @attrs )

    @ec2.use_ssl.should.equal true
    @ec2.port.should.equal 443
    @ec2.server.should.equal "foo.example.com"
  end

  specify "should work with insecure connections as well" do
    @ec2 = AWS::EC2::Base.new( @attrs.merge(:use_ssl=>false) )

    @ec2.use_ssl.should.equal false
    @ec2.port.should.equal 80
    @ec2.server.should.equal "foo.example.com"
  end

  specify "should allow specification of port" do
    @ec2 = AWS::EC2::Base.new( @attrs.merge(:port => 8443) )

    @ec2.use_ssl.should.equal true
    @ec2.port.should.equal 8443
    @ec2.server.should.equal "foo.example.com"
  end

  specify "api_version should be the same as AWS::ELB::API_VERSION" do
    @elb = AWS::ELB::Base.new( @attrs )
    @elb.api_version.should == AWS::ELB::API_VERSION
  end

end
