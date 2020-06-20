require 'stackprof'

def write_to_file(id)
    open('output.out', 'a') do | file |
        file.puts "RequestId #{ id } from report at #{ Time.new } \n" 
    end
end

def custom_method()
    reportnum = 1
    i = 1
    num = 214748

    begin
        reportnum = reportnum * i;
        
        #Open file
        write_to_file(i)

        i +=1;
     end until i > num
end

def fib(n)
	if (n<=2)
		return 1
	else
		return (fib(n-1)+fib(n-2))
	end
end


StackProf.run(mode: :cpu, out: 'stackprof-cpu-myapp.dump') do
    p "Starting Profiler"
    p fibonacci(40)
    custom_method()
    p "Finish method and profiler"
end
