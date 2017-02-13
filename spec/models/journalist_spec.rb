require 'rails_helper'

  RSpec.describe Journalist, type: :model do

    describe 'Create Journalist' do
      let(:journalist_valid) { Journalist.new(
        name: "Name Journalist", media: "Media Journalist") }
      let(:journalist_invalid) { Journalist.new }

      it 'should can not create journalist invalid' do
        expect(Journalist.count).to eql(0)
        expect(journalist_invalid).not_to be_valid
        expect(journalist_invalid.save).to eql(false)
        expect(Journalist.count).to eql(0)
      end

      it 'should can create journalist valid' do
        expect(Journalist.count).to eql(0)
        expect(journalist_valid).to be_valid
        expect(journalist_valid.save).to eql(true)
        expect(Journalist.count).to eql(1)
      end
    end

    context 'With A Journalist' do
      let(:journalist) { Journalist.new(
        name: "Name Journalist", media: "Media Journalist") }

      before { journalist.save }

      describe 'Update Journalist' do

        it 'should can not update journalist invalid' do
          expect(journalist.update(name: "")).to eql(false)
        end

        it 'should can update journalist valid' do
          new_name = "Test new Name"
          last_name = journalist.name
          expect(journalist.update(name: new_name)).to eql(true)
          expect(journalist.name).to_not eql(last_name)
          expect(journalist.name).to eql(new_name)
        end
      end

      describe 'Destroy Journalist' do
        it 'should can destroy journalist' do
          expect(Journalist.count).to eql(1)
          journalist.destroy
          expect(Journalist.count).to eql(0)
        end
      end

    end

  end
