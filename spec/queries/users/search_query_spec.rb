require 'rails_helper'

RSpec.describe Users::SearchQuery do
  describe '#call' do
    let(:instance) { described_class.call(conditions) }
    let(:conditions) { {} }

    subject { instance.where_values_hash }

    let(:default_where_values_hash) { {} }

    it { is_expected.to eq default_where_values_hash }

    context 'conditiosn included id' do
      let(:conditions) { { id: 1 } }
      it { is_expected.to eq default_where_values_hash.merge({ 'id' => 1 }) }
    end

    context 'conditions included name' do
      let(:conditions) { { name: 'tsuji' } }
      it { expect(instance.to_sql).to include "name like '%tsuji%'" }
    end

    context 'conditiosn included zip' do
      let(:conditions) { { zip: '1234567' } }
      it { is_expected.to eq default_where_values_hash.merge({ 'zip' => '1234567' }) }
    end

    context 'conditiosn included id' do
      let(:conditions) { { sex: 'woman' } }
      it { is_expected.to eq default_where_values_hash.merge({ 'sex' => 'woman' }) }
    end
  end
end
