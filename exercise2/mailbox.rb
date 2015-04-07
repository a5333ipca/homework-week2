class Email

    attr_accessor :subject
    attr_accessor :date
    attr_accessor :from

    def initialize(subject, headers)
        
        raise Exception.new('headers is not a hash...') unless headers.is_a? Hash
        
        @subject = subject
        @from = headers[:from]
        @date = headers[:date]
    end
end
  
class Mailbox

    attr_accessor :name
    attr_accessor :emails

    def initialize(name, emails)
	
        @name = name
        @emails = emails
    end
end

emails = [
	Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
	Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
	Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]

mailbox = Mailbox.new("Ruby Study Group", emails)

mailbox.emails.each do |email|

	puts "Date:    #{email.date}"
	puts "From:    #{email.from}"
	puts "Subject: #{email.subject}"
	puts
end
