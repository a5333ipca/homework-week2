class Email

    attr_accessor :subject
    attr_accessor :date
    attr_accessor :from
    
    def initialize(subject, date, from)
	
        @subject = subject
        @date = date
        @from = from
    end
end
  
email = Email.new("Homework this week", "2014-12-01", "Ferdous")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"
