require 'thread'

class ThreadParityPrinter

  def print_numbers(low, high)
    mutex = Mutex.new
    lock = ConditionVariable.new
    print_odd = low.odd?

    t1 = Thread.new {
      odd_number = nearest_odd_number(low)

      while odd_number <= high
        mutex.synchronize do
          lock.wait(mutex) unless print_odd
          print_message('Thread 1', odd_number)
          odd_number = odd_number + 2
          print_odd = !print_odd
          lock.signal
        end
      end
    }

    t2 = Thread.new {
      even_number = nearest_even_number(low)

      while even_number <= high do
        mutex.synchronize do
          lock.wait(mutex) if print_odd
          print_message('Thread 2', even_number)
          even_number = even_number + 2
          print_odd = !print_odd
          lock.signal
        end
      end
    }

    t1.join
    t2.join
  end

  private

    def print_message(thread_name, number)
      puts "#{thread_name}: The number is '#{number}'"
    end

    def nearest_odd_number(number)
      return number if number.odd?
      number.succ
    end

    def nearest_even_number(number)
      return number if number.even?
      number.succ
    end
end
