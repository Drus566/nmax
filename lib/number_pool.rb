module NMax
    
    class NumberPool    
            
        # максимальное количество номеров, которые будут выдаваться клиенту
        attr_reader :amount_of_number

        # пул номеров
        attr_reader :pool

        # инициализируем пул номеров и максимальное количество номеров
        def initialize(amount_of_number)
            @amount_of_number = amount_of_number
            @pool = []
        end

        # отдаем число в пул
        def add_number_to_pool(number)
            pool << number
        end

        # получаем отсоритрованный массив
        def get_sorted_pool
            pool_sort.first(@amount_of_number)
        end

        # сортируем пул
        def pool_sort
            # если в пуле больше одного элемента
            if pool.size > 1
                # преобразуем элементы пула в числа и сортируем их
                @pool = pool.map(&:to_i)
                @pool = pool.sort{ |x,y| y <=> x }
            else 
                # иначе возвращаем единственный элемент
                pool[0]
            end
        end
    end
end