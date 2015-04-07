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

#Returns a new string of a specified length in which the current string is filled with spaces
def LeftJustify(text, len)
    
    #prevent text bigger then len
    newtext = text.to_s[0..len - 1]
    
	#left justify
    newtext = newtext.to_s.ljust(len)
    
    return newtext
end

class MailboxTextFormatter
    
    attr_accessor :mailbox

    def initialize(mailbox)
        
        @mailbox = mailbox
    end
    
    def format
        
        #adjust sizes to redim box
        date_maxlen = 10
        from_maxlen = 7
        subject_maxlen = 22
        
        #headers
        date = LeftJustify("Date", date_maxlen)
        from = LeftJustify("From", from_maxlen)
        subject = LeftJustify("Subject", subject_maxlen)
        
        #line separator
        line = "+-#{"-" * date_maxlen}-+-#{"-" * from_maxlen}-+-#{"-" * subject_maxlen}-+"
        
        puts
        puts "Mailbox: #{mailbox.name}"
        puts
        puts line
        puts "| #{date} | #{from} | #{subject} |"
        puts line
        
        mailbox.emails.each do |email|
            
            date = LeftJustify(email.date, date_maxlen)
            from = LeftJustify(email.from, from_maxlen)
            subject = LeftJustify(email.subject, subject_maxlen)

            puts "| #{date} | #{from} | #{subject} |"
        end
        
        puts line
        puts
    end
end

emails = [
    Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
    Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
    Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]

mailbox = Mailbox.new("Ruby Study Group", emails)

formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format
