# frozen_string_literal: true
require 'rails_helper'
require "#{Rails.root}/lib/fizz_buzz/checker"

describe FizzBuzz::Checker do
  let(:subject) { described_class.new(number) }

  describe '#fizz?' do
    context 'when number is 3' do
      let(:number) { 3 }
      it 'returnes true' do
        expect(subject.fizz?).to equal(true)
      end
    end

    context 'when number is 5' do
      let(:number) { 5 }
      it 'returnes false' do
        expect(subject.fizz?).to equal(false)
      end
    end
  end
  #
  # describe '#buzz?' do
  #
  #   context 'when format is 7' do
  #     let(:format) { 7 }
  #     #=> expectation not defined yet
  #   end
  #
  #   context 'when format is 5' do
  #     let(:format) { 5 }
  #     #=> expectation not defined yet
  #   end
  # end
  #
  # describe '#print' do
  #
  #   context 'when fizz? is true' do
  #     allow(subject).to receive(:fizz?).and_return(true)
  #
  #     context 'when buzz? is true' do
  #       allow(subject).to receive(:buzz?).and_return(true)
  #       #=> expectation not defined yet
  #     end
  #
  #     context 'when buzz? is false' do
  #       allow(subject).to receive(:buzz?).and_return(false)
  #       #=> expectation not defined yet
  #     end
  #   end
  #
  #   context 'when fizz? is false' do
  #     allow(subject).to receive(:fizz?).and_return(false)
  #
  #     context 'when buzz? is true' do
  #       allow(subject).to receive(:buzz?).and_return(true)
  #       #=> expectation not defined yet
  #     end
  #
  #     context 'when buzz? is false' do
  #       allow(subject).to receive(:buzz?).and_return(false)
  #       #=> expectation not defined yet
  #     end
  #   end
  # end
end
