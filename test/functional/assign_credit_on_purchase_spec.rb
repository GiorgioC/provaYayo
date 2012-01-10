require "test/spec"

context "An invitation sender" do
  setup do
    @sender = User.new :email=>"sender@topcs.it",:password=>"okokokok"
    @recipient = User.new :email=>"receiver@topcs.it",:password=>"okokokok"
    @invitation = Invitation.new(:sender=>@sender,:recipient=>@recipient)


  end
  specify "should get credit when recipient purchases" do


    true.should == false
  end
end