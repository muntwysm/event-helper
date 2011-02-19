class EventsController < ApplicationController
	before_filter :require_admin, :except => [:index, :show]

  # GET /events
  # GET /events.xml
  def index
    @events = Event.all
		@title = "Events"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
		@title = "Event '#{@event.name}'"
		@requirements = @event.requirements
		@contributions_count = Contribution.find(:all, :conditions => ["event_id = ?", params[:id]]).count
		sql = "SELECT *
					FROM contributions
					WHERE event_id = #{params[:id]}
					AND item_id NOT IN 
							 (SELECT item_id
							 FROM requirements
							 WHERE event_id = #{params[:id]})"
		@orphaned_contributions = Contribution.find_by_sql(sql) 

		if params[:search]
			@reqs = Contribution.find(:all, :conditions => ["email LIKE ? AND event_id = ?", "%#{params[:search]}%", params[:id]], :order => "created_at")
		else
			@reqs = @event.requirements
		end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
		@event.requirements.build
		@locations = Location.all
		@title = "New Event"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
		@title = "Edit '#{@event.name}' Event"
		@event.requirements.build
		@locations = Location.all
		@title = "Edit '#{@event.name}' Event"
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
		@locations = Location.all

    respond_to do |format|
      if @event.save
				flash[:success] = "Event '#{@event.name}' successfully created."
        format.html { redirect_to(@event, :success => 'Event was successfully created.') } #format.html { render :action => "edit"} #
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
		params[:event][:existing_requirement_attributes] ||= {}

    @event = Event.find(params[:id])
		@locations = Location.all

    respond_to do |format|
      if @event.update_attributes(params[:event])
				format.html { redirect_to(edit_event_path(@event))} #render :action => "edit"} #format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
end
