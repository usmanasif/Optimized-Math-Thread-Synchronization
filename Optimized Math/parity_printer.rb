class ParityPrinter

  @number_is_even = false

  def print_numbers_parity(low, high)
    set_number_is_even(low)

    for number in low..high
      puts "The number '#{number}' is #{parity(number)}"
      toggle_number_is_even
    end
  end

  private
    def parity(number)
      if @number_is_even
        return 'divisible by two and three' if divisible_by_3?(number)
        'even'
      else
        return 'divisible by three' if divisible_by_3?(number)
        'odd'
      end
    end

    def divisible_by_3?(number)
      (number % 3).zero?
    end

    def set_number_is_even(number)
      @number_is_even = true if number.even?
    end

    def toggle_number_is_even
      @number_is_even = !@number_is_even
    end
end
