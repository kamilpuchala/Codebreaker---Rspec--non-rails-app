require 'spec_helper'

module Codebreaker
  describe Game do
    let(:outputt) { double('outputt').as_null_object }
    let(:game) { Game.new(outputt) }

    describe "#start" do

      it "sends a welcome message" do
        expect(outputt).to receive(:puts).with("Welcome to Codebreaker!")
        game.start('1234')
      end

      it "prompts for the first guess" do
        expect(outputt).to receive(:puts).with("Enter guess:")
        game.start('1234')
      end
    end

    describe '#guess' do
      context "with no matches" do
        it "sends a mark with '" do
          game.start('1234')
          expect(outputt).to receive(:puts).with('')
          game.guess('5555')
        end
      end
      context "with 1 number match" do
        it "sends a mark with '" do
          game.start('1234')
          expect(outputt).to receive(:puts).with('-')
          game.guess('2555')
        end
      end
      context "with 1 exact match" do
        it "sends a mark with '" do
          game.start('1234')
          expect(outputt).to receive(:puts).with('+')
          game.guess('1555')
        end
      end
      context "with 2 number match" do
        it "sends a mark with '" do
          game.start('1234')
          expect(outputt).to receive(:puts).with('--')
          game.guess('2355')
        end
      end
      context "with 1 number match and 1 exact match(in the order" do
        it "sends a mark with '+1" do
          game.start('1234')
          expect(outputt).to receive(:puts).with('+-')
          game.guess('2535')
        end
      end
    end
  end
end