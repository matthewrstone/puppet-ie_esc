require 'spec_helper'

describe 'ie_esc' do

  let(:title) {'IE ESC Configuration'}
  let(:params) { { :ensure => 'present' } }
  it do
    should contain_type{'registry::value'}.with({
      :data => 1,
    })
  end
end

