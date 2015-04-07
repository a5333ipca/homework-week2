class Email

    attr_accessor :subject
    attr_accessor :email_headers

    def initialize(subject, headers)
        
        raise Exception.new('headers is not a hash...') unless headers.is_a? Hash
        
        @subject = subject
        @email_headers = headers
    end
end
  
email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.email_headers[:date]}"
puts "From:    #{email.email_headers[:from]}"
puts "Subject: #{email.subject}"
