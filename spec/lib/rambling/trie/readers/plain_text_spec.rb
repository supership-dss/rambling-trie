# frozen_string_literal: true

require 'spec_helper'

describe Rambling::Trie::Readers::PlainText do
  subject(:reader) { described_class.new }

  describe '#each_word' do
    let(:filepath) { File.join(::SPEC_ROOT, 'assets', 'test_words.en_US.txt') }
    let(:words) { File.readlines(filepath).map(&:chomp) }

    it 'yields every word yielded by the file' do
      yielded = []
      reader.each_word(filepath) { |word| yielded << word }
      expect(yielded).to eq words
    end

    it 'returns an enumerator when no block is given' do
      expect(reader.each_word filepath).to be_an Enumerator
    end

    it 'returns the enumerable when a block is given' do
      expect(reader.each_word(filepath) { |_| }).to eq reader
    end
  end
end
