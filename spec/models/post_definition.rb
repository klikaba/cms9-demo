require 'rails_helper'

RSpec.describe Cms9::PostDefinition, type: :model do
	describe 'validations' do
		it 'requires title for PostDefinition' do
			 postdef = Cms9::PostDefinition.new(name: '')
			 postdef.valid?
			 expect(postdef.errors[:name]).to include("can't be blank")
		end

		it 'requires title for PostField' do
			 postdef = Cms9::PostField.new(name: '')
			 postdef.valid?
			 expect(postdef.errors[:name]).to include("is too short (minimum is 3 characters)")
		end

	end
end
