#!/usr/bin/env ruby

BEGIN{Time.now}

class Setup

	def initialize
		
	def $user_logname::nil
    end
    
    def update_ruby
		a = proc{Dir.chdir("/home#{`echo $USER`}")
        system "sudo apt-get  install ruby-full"
        sleep(1)
        system "sudo gem install rpi_gpio"}
        a.call
     end
	
	puts "WELCOME TO THE RUBY POWER BUTTON DRIVER INSTALLATION"
	puts "PLEASE FOLLOW THE INSTRUCTIONS BELOW"
	puts " "
	sleep(1)
	def check_user_dir
	print "User Login(default is pi): " ; $user_logname = gets.chomp
	if Dir.exists?("/home/#{$user_logname}")
		else
		puts "User Login is incorrect.  Try again."
		check_user_dir
	    end
	end
	check_user_dir
	sleep(1)
	puts "Updating Ruby Interpreter"
	sleep(2)
	puts "Installing required gems"
	update_ruby
	sleep(2)
	
	puts "Prepairing to write Driver"
	
	
	
	
	
	def $user_pin::nil
	end
	
	puts "Please Enter the Physical Pin number that you want to
	use for your power led inicator" ; $user_pin = gets.chomp
	
	def create_driver
		a = proc{Dir.chdir("/home#{`echo $USER`}")}
		b = proc{driver = File.new("Pbutton_driver.rb" , "w") ;
		driver.puts("#!/usr/bin/env ruby
		require 'rpi_gpio'
		
			$pin = RPi::GPIO.set_numbering :board
			$button = $pin.setup 5, :as => :input
			$power_led = $pin.setup #{$user_pin} , :as => :output, :initialize => :high
			
			def button_state
			$pin.low? 5
			end
			
			loop do
			button_state
			sleep(1)
			if button_state == true
			$pin.set_low #{$user_pin}
			`shutdown -h now`
			end
		end") ;
		driver.close }
		a.call
		b.call
		
		end
		create_driver
	sleep(2)
	
	puts "Creating .bash_aliases"
	
	def create_bash_alias
	a = proc{Dir.chdir("/home#{`echo &USER`}")}
	b = proc{bash_aliases = File.new(".bash_aliases" , "w") ;
	bash_aliases.puts("sudo ruby Pbutton_driver.rb &") ;
	bash_aliases.close }
	a.call
	b.call
	end
	
	create_bash_alias
	sleep(2)
	puts "Install Complete.  Starting Reboot"
	sleep(3)
	`sudo reboot`		
	
	
	end
end

Setup.new
