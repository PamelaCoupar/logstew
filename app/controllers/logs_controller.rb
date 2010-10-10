class LogsController < ApplicationController
 before_filter :authenticate_steward!
 def index
    @logs =  current_steward.logs.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @logs }
    end
  end

  # GET /logs/new
  # GET /logs/new.xml
  def new
    @log = current_steward.logs.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @log }
    end
  end

  # POST /logs
  # POST /logs.xml
  def create
    @log = current_steward.logs.build(params[:log])
    respond_to do |format|
      if @log.save
        format.html { redirect_to(:action =>:index, :notice => 'Log was successfully created.') }
        format.xml  { render :xml => @log, :status => :created, :location => @log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @log.errors, :status => :unprocessable_entity }
      end
    end
  end 
  def destroy
     backtrace
     logger.info(params)
  end
end
