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
      it "sends the mark outputt" do
        game.start('1234')
        expect(outputt).to receive(:puts).with('++++')
        game.guess('1234')
      end
    end
  end
end
