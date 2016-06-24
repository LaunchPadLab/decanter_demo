Decanter - Live Coding
===

Overview
---

1. Generate Trips resource
2. Add validations to trip.rb
3. Write trips/new
4. Add create action to controller
5. Show that it fails
6. Make it succeed with manual parsing
7. Generate Destinations resource
8. Modify code for destination as nested resource to trip
9. Show that it fails
10. Make it succeed with manual parsing
11. Show Decanter


Generate Trips resource
---

```
rails g resource Trip name:string start_date:date budget:float
rake db:migrate
```


Validations
---

```ruby
validates_presence_of :name, :start_date, :budget
```


Write trips/new
---

```erb
<%= form_for @trip do |f| %>
  <p><%= f.object.errors.full_messages.join(", ") %></p>
  <div>
    <%= f.label :name %>
    <%= f.text_field :name %>
  </div>
  <div>
    <%= f.label :start_date %>
    <%= f.text_field :start_date, class: 'datepicker' %>
  </div>
  <div>
    <%= f.label :cost %>
    <%= f.text_field :budget, placeholder: '$1,500' %>
  </div>
  <div>
    <%= f.submit %>
  </div>
<% end %>
```


Add Create Action to Controller
---

```ruby
  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def index
    @trips = Trip.all
  end

  def create
    @trip = Trip.new(trip_params)    

    if @trip.save
      redirect_to trips_path
    else
      render 'new'
    end
  end

  private

    def trip_params
      params.require(:trip).permit(:name, :start_date, :budget)
    end
```

Make it succeed manually
---

def create
  @trip = Trip.new(trip_params)    

  start_date = trip_params[:start_date]
  parsed_start_date = Date.strptime(start_date, '%m/%d/%Y')
  @trip.start_date = parsed_start_date

  budget = trip_params[:budget]
  regex = /(\d|[.])/
  parsed_budget = budget.scan(regex).join.to_f
  @trip.budget = parsed_budget

  respond_to do |format|
    if @trip.save
      format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
      format.json { render :show, status: :created, location: @trip }
    else
      format.html { render :new }
      format.json { render json: @trip.errors, status: :unprocessable_entity }
    end
  end
end



Generate Destinations Resource
---

```
rails g model Destination arrival_date:date location:string percent_of_budget:float trip:references
rake db:migrate
```

Modify code for destination as nested resource to trip
---

1. validates_presence_of :arrival_date, :location, :percent_of_budget
2. has_many :destinations
3. accepts_nested_attributes_for :destinations
4. update form (see below)
5. update strong_params: destinations_attributes: [:arrival_date, :location, :percent_of_budget]
6. update create action (see below)

** update form **

```erb
<%= form_for @trip do |f| %>
  <p><%= f.object.errors.full_messages.join(", ") %></p>
  <div>
    <%= f.label :name %>
    <%= f.text_field :name %>
  </div>
  <div>
    <%= f.label :start_date %>
    <%= f.text_field :start_date, class: 'datepicker' %>
  </div>
  <div>
    <%= f.label :end_date %>
    <%= f.text_field :end_date, class: 'datepicker' %>
  </div>
  <ul>
    <%= f.fields_for :destinations do |destination_builder| %>
      <h4>Add Destination</h4>
      <div>
        <%= destination_builder.label :location %>
        <%= destination_builder.text_field :location %>
      </div>
      <div>
        <%= destination_builder.label :arrival_date %>
        <%= destination_builder.text_field :arrival_date, class: 'datepicker' %>
      </div>
      <div>
        <%= destination_builder.label :percent_of_budget %>
        <%= destination_builder.text_field :percent_of_budget, placeholder: '10%' %>
      </div>
    <% end %>
  </ul>
  <div>
    <%= f.submit %>
  </div>
<% end %>
```

** update create and new action **

```ruby
  def new
    @trip = Trip.new
    2.times do |i|
      @trip.destinations.build
    end
  end

  def create
    @trip = Trip.new(trip_params)

    start_date = trip_params[:start_date]
    parsed_start_date = Date.strptime(start_date, '%m/%d/%Y')
    @trip.start_date = parsed_start_date

    budget = trip_params[:budget]
    regex = /(\d|[.])/
    parsed_budget = budget.scan(regex).join.to_f
    @trip.budget = parsed_budget

    @trip.destinations.each_with_index do |destination, index|
      destination_params = trip_params[:destinations_attributes]["#{index}"]
      arrival_date = destination_params[:arrival_date]
      destination.arrival_date = Date.strptime(arrival_date, '%m/%d/%Y') if arrival_date.present?
      parsed_percent = destination_params[:percent_of_budget].scan(regex).join.to_f
      destination.percent_of_budget = parsed_percent / 100.0
    end

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end
```


Show Decanter
---

```ruby
gem 'decanter'
```

restart server

```
rails g decanter Trip name:string start_date:date budget:float destinations:has_many
rails g decanter Destination arrival_date:date location:string percent_of_budget:float
```

Update trips_controller
---

1. Remove code above @trip.save and add: @trip = Trip.decant_new(trip_params)

Show DateParser
---

- parse_format
- look at source code on github

Show Custom Parser
---

```
rails g parser Date
```

Show Squasher (if time permits)
---

```
rails g migration AddDateValuesToTrip
```

```
add_column :trips, :day, :integer
add_column :trips, :month, :integer
add_column :trips, :year, :integer
```

```
rake db:migrate
```

```erb
  <div>
    <%= f.label :day %>
    <%= f.text_field :day %>
  </div>
  <div>
    <%= f.label :month %>
    <%= f.text_field :month %>
  </div>
  <div>
    <%= f.label :year %>
    <%= f.text_field :year %>
  </div>
```

```ruby
input [:day, :month, :year], :date_squash, key: :start_date
```
