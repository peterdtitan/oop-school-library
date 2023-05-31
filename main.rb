require_relative 'render'

class Main
  def initialize
    @render = Render.new
  end

  puts 'Welcome the OOP Library. Choose an option below:\n'
  def main
    loop do
      @render.list_options
      choice = @render.get_request('Enter your choice number: ', :to_i)

      case choice
      when 1..6
        @render.execute_action(choice)
      when 7
        break
      else
        puts 'Invalid option, try again'
      end
    end
  end
end

main_app = Main.new
main_app.main
