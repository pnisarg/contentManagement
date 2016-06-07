class DemoController < ApplicationController

    layout false
    def index
        # render(:template => 'demo/hello')
        puts "inside index method"
        @array = [1,2,3,4]
        render('demo/index')
    end

    def hello_method
        puts 'inside hello method'
        @id = params['id']
        @fname = params['fname']
        @lname = params[:lname]
        puts @id + " " + @fname + " " + @lname
        render('demo/hello')
    end

    def redirect_demo
        redirect_to(:controller => 'demo', :action => 'hello_method')
    end
end
