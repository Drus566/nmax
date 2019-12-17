
require_relative 'number_pool'
require_relative 'text_handler'

module NMax

    class App

        # Входной поток текстовых данных
        attr_reader :stream

        # Обработчик текста
        attr_reader :text_handler

        # Пул сохраняемых чисел
        attr_reader :number_pool

        def initialize(stream, amount_of_number)
            # поток входных данных
            @stream = stream
            # обработчик входных данных 
            @text_handler = TextHandler.new
            # пул чисел
            @number_pool = if amount_of_number.to_i == 0
                               NumberPool.new(5)
                           else
                               NumberPool.new(amount_of_number.to_i)
                           end 
        end

        def job
            # пока работает цикл
            while true do
                # получаем последовательно символы
                symbol = stream.getc
                # обрабатываем символ, встречается последовательность цифр - число, то сохраняем
                number = text_handler.process_symbol(symbol)
                # добавляем число в пул для последующей сортировки
                number_pool.add_number_to_pool(number) unless number.nil?
                # если символы закончились, выходим из цикла
                break if symbol.nil?
            end
            # получаем отсортированный пул чисел
            number_pool.get_sorted_pool
        end

        def result_of_job
            puts job
        end
    end
end



