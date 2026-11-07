class HiController < ApplicationController
  def index
    @stud = 'студент Ярослава ЗОРІЙ'
    @message = 'Моє повідомлення'
    @time = Time.now
  end
end