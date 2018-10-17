require_relative '../thread_parity_printer'

RSpec.describe ThreadParityPrinter do
  describe '#print_numbers'
  it 'prints numbers with 2 threads' do
    printer = ThreadParityPrinter.new
    expected_output = "Thread 1: The number is '1'\nThread 2: The number is '2'\nThread 1: The number is '3'
Thread 2: The number is '4'\nThread 1: The number is '5'\nThread 2: The number is '6'\n"
    expect { printer.print_numbers(1, 6) }.to output(expected_output).to_stdout
  end
end
