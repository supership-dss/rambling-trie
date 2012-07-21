[
  'invalid_operation',
  'children_hash_deferer',
  'compressor',
  'branches',
  'node',
  'root',
  'version'
].map { |file| File.join('rambling-trie', file) }.each &method(:require)

module Rambling
  module Trie
    class << self
      # Creates a new Trie. Entry point for the Rambling::Trie API.
      # @param [String, nil] filename the file to load the words from (defaults to nil).
      def create(filename = nil)
        Root.new filename
      end

      # Creates a new Trie. Entry point for the Rambling::Trie API.
      # @param [String, nil] filename the file to load the words from (defaults to nil).
      # @deprecated Please use {.create} instead.
      # @see .create
      def new(filename = nil)
        warn '[DEPRECATION] `new` is deprecated. Please use `create` instead.'
        create filename
      end
    end
  end
end
