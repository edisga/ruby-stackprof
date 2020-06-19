def write_to_file(id)
    open('output.out', 'a') do | file |
        file.puts "RequestId #{ id } from report at #{ Time.new } \n" 
    end
end

def custom_method()
    reportnum = 1
    i = 1
    num = 2147483

    begin
        reportnum = reportnum * i;
        #Open file
        write_to_file(i)

        i +=1;
     end until i > num
end


StackProf.run(mode: :cpu, out: 'tmp/stackprof-cpu-myapp.dump') do
    custom_method()
end

