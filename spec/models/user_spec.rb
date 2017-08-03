require 'rails_helper'

RSpec.describe User, type: :model do


  describe "#instagram_client" do
    let(:user) { User.new }

    context "with identity" do
      let(:identity) {stub_model(Identity, :access_token => "123abc")}
      before { user.identity = identity}

      it 'returns an instagram client' do
        expect(user.instagram_client).to be_instance_of Instagram::Client
      end
    end

    context "with missing identity" do
      it 'should raise an exception' do
        expect{user.instagram_client}
          .to raise_exception Exceptions::InstagramError
      end
    end
  end

end
