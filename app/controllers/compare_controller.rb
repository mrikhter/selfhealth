class CompareController < ApplicationController
  respond_to :html, :json

  def compare
    @tests = UserTest.find(params[:compare])
    #this is no good bc ordering all the tests first

    # @results = @tests.map do |test|
    #   { :test_date => test.test_date, :results => test.results.map do |result|
    #     { :name => result.item.full_name, :amount => result.amount }
    #   end
    #   }
    # end
    a = @tests.map {|test| test.results }.flatten
    @b = a.group_by { |result| result.item }
    # binding.pry
    @results = @b.map { |item| {:item => item[0].full_name, 
                                :units => item[0].units, 
                                :normal => { :low => item[0].normal_ranges.first.low, :high => item[0].normal_ranges.first.high },
                                :normal => item[1].map {|result| { :date => result.user_test.test_date, :low => item[0].normal_ranges.first.low, :high => item[0].normal_ranges.first.high }}, 
                                :results => item[1].map {|result| {:amount => result.amount, :date => result.user_test.test_date  }}}}
    
    @results1 = @b.map { |item| {:item => item[0].full_name, 
                                :units => item[0].units, 
                                :dates => item[1].map {|result| result.user_test.test_date },
                                :normal_low => item[1].map {|result| item[0].normal_ranges.first.low}, 
                                :normal_high => item[1].map {|result| item[0].normal_ranges.first.high}, 
                                :results => item[1].map {|result| result.amount }}}
    # binding.pry
    @results = @results.to_json
    # @dates = @tests.map { |test| test.test_date }.sort.to_json
    respond_with @results do |format|
      format.html
      format.json {render json: @results}
    end
  end
end


# @tests.map do |test|
#   { test.test_date => test.results.map do |result|
#     {result.id => result.amount }
#   end
#    }
# end  

# @tests.map do |test|
#   { test.test_date => test.results.map do |result|
#     {result.item.full_name => result.amount }
#   end
#    }
# end  

# @tests.map do |test|
#   { :test_date => test.test_date }
# end

# @tests.map do |test|
#   { :test_date => test.test_date, :results => test.results.map do |result|
#     {:name => result.item.full_name, :amount => result.amount }
#   end
#   }
# end