require_relative '../parity_printer'

RSpec.describe ParityPrinter do
  describe '#print_numbers_parity'
  it 'prints parity of numbers' do
    printer = ParityPrinter.new
    expected_output = "The number '1' is odd\nThe number '2' is even\nThe number '3' is divisible by three\nThe number '4' is even\nThe number '5' is odd\nThe number '6' is divisible by two and three\n"

    expect { printer.print_numbers_parity(1, 6) }.to output(expected_output).to_stdout
  end
end
