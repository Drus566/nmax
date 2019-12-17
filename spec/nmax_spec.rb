require 'rspec'
require_relative '../lib/app'

RSpec.describe NMax::App do

  let(:app) do
    $stdin = File.open('spec/stream.txt')
    amount_of_number = '5'
    NMax::App.new($stdin, amount_of_number)
  end
    
  context 'check methods' do
    it '#start' do
      expect(app.job).to eq([123, 66, 56, 9, 8]) 
    end
  end
end

RSpec.describe NMax::NumberPool do

  let(:number_pool) do  
    number_pool = NMax::NumberPool.new(5)
    number_pool.add_number_to_pool('1')
    number_pool.add_number_to_pool('2')
    number_pool
  end
  
  context 'check methods' do
    it '#add_number_to_pool' do
      expect(number_pool.pool).to eq(['1', '2']) 
    end

    it '#pool_sort' do
      expect(number_pool.pool_sort).to eq([2, 1])
    end

    it '#get_sorted_pool' do
      expect(number_pool.pool_sort.first(number_pool.amount_of_number)).to eq([2, 1])
    end
  end
end

RSpec.describe NMax::TextHandler do

  let(:text_handler) { NMax::TextHandler.new }

  context 'check toggle' do
    describe 'toggle is true' do
      before(:example) do
        text_handler.process_symbol('0')
        text_handler.process_symbol('1')
      end
        
      it 'receive digit' do
        expect(text_handler.process_symbol('1')).to eq(nil)
      end

      it 'receive non digit' do
        expect(text_handler.process_symbol('k')).to eq(nil)
      end

      it 'switch toggle' do
        text_handler.process_symbol('k')
        expect(text_handler.toggle).to eq(false)
      end
    end

    describe 'toggle is false' do
      it 'receive digit' do
        expect(text_handler.process_symbol('1')).to eq(nil) 
      end
        
      it 'receive non digit' do
        expect(text_handler.process_symbol('a')).to eq(nil)
      end
        
      it 'switch toggle' do
        text_handler.process_symbol('0')
        text_handler.process_symbol('1')
        expect(text_handler.toggle).to eq(true)
      end
    end
  end
  
  context 'check methods' do
    describe '#process_symbol' do
      it 'return nil' do
        expect(text_handler.process_symbol('1')).to eq(nil) 
      end

      it 'return number' do
        text_handler.process_symbol('1')
        text_handler.process_symbol('2')
        expect(text_handler.process_symbol('G')).to eq('12')
      end
    end

    describe '#is_digit?' do 
      it 'receive digit' do
        expect(text_handler.is_digit?('9')).to eq(0)
      end

      it 'receive letter' do
        expect(text_handler.is_digit?('+')).to eq(nil)
      end
    end

    describe '#is_zero?' do
      it 'receive zero' do
        expect(text_handler.is_zero?('0')).to eq(true)
      end

      it 'receove non zero' do
        expect(text_handler.is_zero?('1')).to eq(false)
      end
    end

    it '#buffer_is_full?' do
      text_handler.buffer << '3'
      expect(text_handler.buffer_is_full?).to eq(false)
    end
      
    describe '#sequence_of_zeros?' do
      it 'receive zeros' do
        text_handler.buffer << '0'
        expect(text_handler.sequence_of_zeros?).to eq(true)
      end

      it 'receive non zeros' do
        text_handler.buffer << '1'
        expect(text_handler.sequence_of_zeros?).to eq(nil)
      end
    end

    describe '#check_buffer' do
      it 'buffer is empty' do
        expect(text_handler.check_buffer).to eq(nil)
      end

      it 'buffer contain number' do
        text_handler.buffer << '1'
        text_handler.buffer << '2'
        text_handler.buffer << '3'
        expect(text_handler.check_buffer).to eq('123')
      end
    end
  end
end
