require 'shellwords'

puts ARGV
case ARGV[0]
when "new"
    # make the dir
    Dir.mkdir ARGV[1]
    # change dir
    Dir.chdir ARGV[1]

    # stub in all the directories we want
    %w(cmd internal pkg vendor api web configs init build deployments test docs tools examples third_party githooks assets website).each do |dir|
        Dir.mkdir(dir)
    end

    # setup the go module
    puts `go mod init #{ARGV[2]}`

    # db
    print "do you want an sql database [y/n]? "
    if gets.chomp == "y"
        puts `go get gorm.io/gorm`
        puts <<-DB
            1) postgres
            2) mysql
        DB
        case gets.chomp
        when "1"
            puts `go get gorm.io/driver/mysql`
        when "2"
            puts `go get gorm.io/driver/postgres`
        end
    end

    # go back home
    Dir.home
else
    puts <<-HELP
        new project_name module_name
    HELP
end
