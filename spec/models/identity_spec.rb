require 'rails_helper'

RSpec.describe Identity, type: :model do

  describe ".find_for_oauth" do
      context "with a good auth object" do
        let(:identity) do
          auth = {uid: 123, info: {bio: "My bio",
                                   name: "My name",
                                   image: "My image url",
                                   nickname: "My nickname",
                                   website: "My website",},
                            credentials: {token: "123abc"}}

          Identity.find_for_oauth auth
        end

        subject { identity }
        it 'should set the name' do
          expect(subject.name).to eq "My name"
        end

        it 'should set the bio' do
          expect(subject.bio).to eq "My bio"
        end

        it 'should set the image url' do
          expect(subject.image).to eq "My image url"
        end

        it 'should set the nickname' do
          expect(subject.nickname).to eq "My nickname"
        end

        it 'should set the website' do
          expect(subject.website).to eq "My website"
        end


      end
  end

end
