module NMax

    class TextHandler

        # буфер для формирования числа из цифр
        attr_reader :buffer

        # переключатель для считывания числа, если число начинается с двух нулей,
        # то включается переключатель и последующая часть числа не считывается, так как оно уже не корректно
        attr_reader :toggle

        def initialize
            @buffer = ''
            @toggle = false
        end

        # обработка символа
        def process_symbol(symbol)
            # если символ является цифрой, и переключатель выключен...  
            if is_digit?(symbol) && !toggle
                # проверяем буфер на последовательность нулей
                return nil if sequence_of_zeros?
                # добавляем символ в буфер
                buffer << symbol 
                return nil
            end
            
            # если символ не цифра
            unless is_digit?(symbol)
                # если дальнейшая последовательность цифр не читается
                if toggle
                    # то читаем дальнейшие цифры
                    @toggle = false
                    return nil
                # если цифры читались, то проверяем буфер
                else
                    check_buffer
                end
            end            
        end

        # проверка является ли символ цифрой
        def is_digit?(symbol)
            symbol =~ /[[:digit:]]/    
        end
        
        # проверка буфера
        def check_buffer
            if buffer != ''
                # если буфер > 1000 значений, то обнуляем буфер и возвращаем nil т.к. такие числа
                # нам не подходят
                if buffer_is_full? 
                    @buffer = ''
                    return nil
                end
                
                # возвращаем число
                number = buffer
                @buffer = '' # необходимо писать @buffer, с '@' чтобы изменить его значение 
                return number
            end
        end

        # проверка на переполнение буфера (число должно быть не более 1 000 символов)
        def buffer_is_full?
            buffer.size > 1000
        end

        # символ равен нулю?
        def is_zero?(digit)
            digit.to_i == 0
        end

        # проверка буфера на нули
        def sequence_of_zeros?
            # если буфер имеет размер 1 и первый элемент равен 0
            if buffer.size == 1 && is_zero?(buffer[0])
                # включаем переключатель для последующего игнорирования цифр
                @toggle = true
                # обнуляем буфер
                @buffer = ''
                return true
            end 
        end
    end
end