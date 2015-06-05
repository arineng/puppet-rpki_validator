require 'spec_helper'
describe 'rpki_validator' do

  context 'with defaults for all parameters' do
    it { should contain_class('rpki_validator') }
  end
end
