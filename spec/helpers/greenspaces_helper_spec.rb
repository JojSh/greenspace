require 'rails_helper'

def create_greenspace
  Greenspace.create name: 'Richmond Park', description: 'Best park in Greater London'
end

# Specs in this file have access to a helper object that includes
# the GreenspacesHelper. For example:
#
# describe GreenspacesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe GreenspacesHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
