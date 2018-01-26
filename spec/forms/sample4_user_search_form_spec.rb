require 'rails_helper'

RSpec.describe Sample4UserSearchForm, type: :model do
  let(:form) { described_class.new(id: id, name: name, zip: zip, sex: sex) }
  let(:id) { 1 }
  let(:name) { 'tsuji' }
  let(:zip) { '1080022' }
  let(:sex) { 'man' }

  describe '#valid?' do
    subject { form.valid? }

    it { is_expected.to eq true }

    context 'when zip is not 7 length' do
      let(:zip) { '12345678' }
      it { is_expected.to eq false }
    end

    context 'when name is grater than 100' do
      let(:name) { '1' * 101 }
      it { is_expected.to eq false }
    end
  end

  describe '#search' do
    subject { form.search }

    before do
      allow(User).to receive(:search)
    end

    it 'call search' do
      expect { subject }.not_to raise_error
      expect(User).to have_received(:search).once
    end
  end
end
